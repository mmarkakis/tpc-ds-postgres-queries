import pandas as pd
import sys

sys.path.append("../..")
from causallearn.search.ConstraintBased.PC import pc
from causallearn.search.ConstraintBased.FCI import fci
from causallearn.search.FCMBased import lingam
from causallearn.search.FCMBased.lingam.utils import make_dot
from causallearn.search.HiddenCausal.GIN import GIN
#from causallearn.search.PermutationBased.GRaSP import grasp
#from causallearn.search.ScoreBased.GES import ges
from causallearn.search.ScoreBased.ExactSearch import bic_exact_search
from causallearn.graph.Endpoint import Endpoint
import pickle
from datetime import datetime
import multiprocessing as mp
from graph_renderer import GraphRenderer
import networkx as nx
from tqdm.auto import tqdm
import argparse
from openai import OpenAI

TIMEOUT_SECONDS = 60 * 60

PC_OPTIONS = [
    "fisherz",
    "mv_fisherz",
    "mc_fisherz",
    "kci",
    "chisq",
    "gsq",
    "d_separation",
]

FCI_OPTIONS = ["fisherz", "kci", "chisq", "gsq"]

LINGAM_OPTIONS = ['placeholder']

GIN_OPTIONS = ["kci", "hsic"]

GRASP_OPTIONS = [
    "local_score_CV_general",
    "local_score_marginal_general",
    "local_score_CV_multi",
    "local_score_marginal_multi",
    "local_score_BIC",
    "local_score_BDeu",
]

GES_OPTIONS = [
    "local_score_CV_general",
    "local_score_marginal_general",
    "local_score_CV_multi",
    "local_score_marginal_multi",
    "local_score_BIC",
    "local_score_BIC_from_cov",
    "local_score_BDeu",
]

EXACT_SEARCH_OPTIONS = ["dp", "astar"]

GPT_OPTIONS = ["gpt-4"]



def run_method_with_timer(dataset_name, method_name, options, fres):
    # Load the data
    data_df = pd.read_pickle(dataset_name)
    data = data_df.to_numpy().astype(float)
    vars_dict = {i: name for i, name in enumerate(data_df.columns)}

    ##############################

    # Define causal discovery methods

    def general_graph_to_nx_digraph(gg_cg):
        # Convert the graph to a NetworkX DiGraph
        nx_cg = nx.DiGraph()
        for edge in gg_cg.get_graph_edges():
            node1 = edge.get_node1().get_name()
            node2 = edge.get_node2().get_name()
            points_left = edge.get_endpoint1() == Endpoint.ARROW and (
                edge.get_endpoint2() == Endpoint.TAIL
                or edge.get_endpoint2() == Endpoint.CIRCLE
            )
            points_right = edge.get_endpoint2() == Endpoint.ARROW and (
                edge.get_endpoint1() == Endpoint.TAIL
                or edge.get_endpoint1() == Endpoint.CIRCLE
            )
            if not points_left:  # points right or undirected
                nx_cg.add_edge(node1, node2)
            if not points_right:  # points left or undirected
                nx_cg.add_edge(node2, node1)

        return nx_cg

    def run_pc(option):
        cg = pc(data, indep_test=option, show_progress=False)
        cg.to_nx_graph()
        return cg.nx_graph

    def run_fci(option):
        cg, _ = fci(data, independence_test_method=option, show_progress=False)
        nx_cg = general_graph_to_nx_digraph(cg)
        return nx_cg

    def run_lingam(option):
        model = lingam.ICALiNGAM()
        model.fit(data)
        gv_cg = make_dot(model.adjacency_matrix_, labels=list(data_df.columns))

        # Convert the Graphviz Digraph to NetworkX DiGraph
        nx_cg = nx.DiGraph()
        for line in gv_cg.body:
            tokens = line.strip(";").split("->")
            if len(tokens) == 2:
                nx_cg.add_edge(tokens[0].strip(), tokens[1].strip())
            tokens = tokens[0].split("--")
            if len(tokens) == 2:
                nx_cg.add_edge(tokens[0].strip(), tokens[1].strip())
                nx_cg.add_edge(tokens[1].strip(), tokens[0].strip())
        return nx_cg

    def run_gin(option):
        cg, _ = GIN.GIN(data, indep_test_method=option)
        nx_cg = general_graph_to_nx_digraph(cg)
        return nx_cg

    def run_grasp(option):
        cg = grasp(data, score_func=option)
        nx_cg = general_graph_to_nx_digraph(cg)
        return nx_cg

    def run_ges(option):
        record = ges(data, score_func=option)
        nx_cg = general_graph_to_nx_digraph(record["G"])
        return nx_cg

    def run_exact_search(option):
        matrix = bic_exact_search(data, search_method=option)
        # Convert the matrix to a NetworkX DiGraph
        # If matrix[i,j] == 1, then there is an edge from i to j
        nx_cg = nx.DiGraph()
        for i in range(matrix.shape[0]):
            for j in range(matrix.shape[1]):
                if matrix[i, j] == 1:
                    nx_cg.add_edge(i, j)
        return nx_cg

    def run_gpt(option):
        model = option
        # Open a file for logging, with the model and the timestamp in the name
        log_file = open(
            f"evaluation/gpt-logs/{model}-{datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}.txt",
            "w",
        )

        client = OpenAI()
        graph = nx.DiGraph()

        for i in tqdm(
            range(len(vars_dict)), desc="Outer edge-finding loop using GPT..."
        ):
            for j in range(i + 1, len(vars_dict)):
                var_a = vars_dict[i]
                var_b = vars_dict[j]

                example_rows = data_df[[var_a, var_b]].dropna().sample(3)
                examples_a = ", ".join(str(x) for x in example_rows[var_a].tolist())
                examples_b = ", ".join(str(x) for x in example_rows[var_b].tolist())

                # Define the messages to send to the model
                messages = [
                    {
                        "role": "system",
                        "content": "You are a helpful assistant for causal reasoning.",
                    },
                    {
                        "role": "user",
                        "content": f"""Which cause-and-effect relationship is more likely? """
                        f"""A. changing {var_a} causes a change in {var_b}. """
                        f"""B. changing {var_b} causes a change in {var_a}. """
                        f"""C. Neither of the two. """
                        f""" Here are some example values of {var_a} : [{examples_a}]"""
                        f""" Here are the corresponding values of {var_b} : [{examples_b}]"""
                        """Let's work this out in a step by step way to be sure that we have the right answer. """
                        """Then provide your ﬁnal answer within the tags <Answer>A/B/C</Answer>.""",
                    },
                ]

                reply = (
                    client.chat.completions.create(model=model, messages=messages)
                    .choices[0]
                    .message.content
                )

                # Log the messages and the reply
                log_file.write(f"{datetime.now()}\n")
                log_file.write("Messages:\n")
                for message in messages:
                    log_file.write(f"{message['role']}: {message['content']}\n")
                log_file.write("----------------\n")
                log_file.write(f"Reply: {reply}\n\n")
                log_file.write("================\n")
                log_file.flush()

                # Find the part of the reply that contains the answer
                start_idx = reply.find("<Answer>") + len("<Answer>")
                end_idx = reply.find("</Answer>")
                answer = reply[start_idx:end_idx]

                # Add the edge to the graph
                if answer == "A":
                    graph.add_edge(var_a, var_b)
                elif answer == "B":
                    graph.add_edge(var_b, var_a)
        log_file.close()
        nx_cg = graph
        return nx_cg

    # Run a function within a try except block
    def run_safe(function, option):
        try:
            starttime = datetime.now()
            nx_cg = function(option=option)

            # Check if the graph is empty
            if nx_cg.number_of_edges() == 0:
                fres.write(
                    f"{dataset_name},{method_name},{option},empty,{(datetime.now() - starttime).seconds}\n"
                )
                fres.flush()
                return

            # Remove isolated nodes
            nx_cg.remove_nodes_from(list(nx.isolates(nx_cg)))

            print(f"{datetime.now()} Writing out {method_name} with {option}")
            sys.stdout.flush()
            fres.write(
                f"{dataset_name},{method_name},{option},success,{(datetime.now() - starttime).seconds}\n"
            )
            fres.flush()

            # Save the graph as png
            GraphRenderer.save_graph(
                nx_cg, vars_dict, f"{dataset_name}_{method_name}_{option}.png"
            )

            # Write out graph as pickle
            with open(f"{dataset_name}_{method_name}_{option}.pkl", "wb") as f:
                pickle.dump(nx_cg, f)
        except Exception as e:
            print(f"{datetime.now()} Error running {function}: {e}")
            sys.stdout.flush()
            fres.write(f"{dataset_name},{method_name},{option},exception: {e},\n")
            fres.flush()

    ##############################

    # Run the discovery

    for option in options:
        process = mp.Process(
            target=run_safe,
            kwargs={"function": locals()[f"run_{method_name}"], "option": option},
        )
        print(f"{datetime.now()} Running {method_name} with {option}")
        sys.stdout.flush()

        process.start()
        process.join(TIMEOUT_SECONDS)
        if process.is_alive():
            print(f"{datetime.now()} Function timed out")
            fres.write(
                f"{dataset_name},{method_name},{option},timeout,{TIMEOUT_SECONDS}\n"
            )
            fres.flush()
            process.terminate()  # Terminate the process
            process.join()  # Clean up the process

        print(f"{datetime.now()} Done running {method_name} with {option}")
        sys.stdout.flush()


def main():
    parser = argparse.ArgumentParser()  
    parser.add_argument("--dataset", type=str, required=True)
    args = parser.parse_args()
    dataset_name = args.dataset

    # Open logging files
    fout = open(f"{dataset_name}-discovery.log", "a")
    sys.stdout = fout
    sys.stderr = fout
    fres = open(f"{dataset_name}-discovery-results.csv", "a")
    fres.write(f"dataset_name,method_name,option,result,time\n")
    fres.flush()
    
    # Run all the discovery methods
    print("\n\n========================================\n\n")
    print(f"{datetime.now()} Starting {dataset_name}\n")
    run_method_with_timer(dataset_name, "pc", PC_OPTIONS, fres)
    run_method_with_timer(dataset_name, "fci", FCI_OPTIONS, fres)
    run_method_with_timer(dataset_name, "lingam", LINGAM_OPTIONS, fres)
    run_method_with_timer(dataset_name, "gin", GIN_OPTIONS, fres)
    #run_method_with_timer(dataset_name, "grasp", GRASP_OPTIONS, fres)
    #run_method_with_timer(dataset_name, "ges", GES_OPTIONS, fres)
    run_method_with_timer(dataset_name, "exact_search", EXACT_SEARCH_OPTIONS, fres)
    run_method_with_timer(dataset_name, "gpt", GPT_OPTIONS, fres)

    fout.close()
    fres.close()


if __name__ == "__main__":
    main()