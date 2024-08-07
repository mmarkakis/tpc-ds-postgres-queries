# Based on brad/query_rep.py

import sqlglot
import sqlglot.expressions as exp
import yaml
from importlib.resources import files, as_file
from typing import List, Optional

_DATA_MODIFICATION_PREFIXES = [
    "INSERT",
    "UPDATE",
    "DELETE",
    "BEGIN",
    "COMMIT",
    "ROLLBACK",
]


class QueryRep:
    """
    A SQL query's "internal representation" within BRAD.

    In practice, this class is used to abstract away the internal representation
    so that its implementation details are not part of the interface of other
    BRAD classes (e.g., we want to avoid exposing the query's parsed representation).

    Objects of this class are logically immutable.
    """

    def __init__(self, sql_query: str):
        self._raw_sql_query = sql_query

        # Lazily computed.
        self._ast: Optional[sqlglot.Expression] = None
        self._is_data_modification: Optional[bool] = None
        self._tables: Optional[List[str]] = None
        self._columns: Optional[List[str]] = None
        self._num_joins: Optional[List[str]] = None

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, QueryRep):
            return False
        return self._raw_sql_query == other._raw_sql_query

    def __hash__(self) -> int:
        return hash(self._raw_sql_query)

    @property
    def raw_query(self) -> str:
        return self._raw_sql_query

    def is_data_modification_query(self) -> bool:
        if self._is_data_modification is None:
            self._is_data_modification = any(
                map(self._raw_sql_query.upper().startswith, _DATA_MODIFICATION_PREFIXES)
            )
        return self._is_data_modification

    def is_transaction_start(self) -> bool:
        return self._raw_sql_query.upper() == "BEGIN"

    def is_transaction_end(self) -> bool:
        raw_sql = self._raw_sql_query.upper()
        return raw_sql == "COMMIT" or raw_sql == "ROLLBACK"

    

    def ast(self) -> sqlglot.Expression:
        self._parse_query_if_needed()
        return self._ast

    def _parse_query_if_needed(self) -> None:
        if self._ast is None:
            self._ast = sqlglot.parse_one(self._raw_sql_query, dialect="redshift")
            assert self._ast is not None

    def tables(self) -> List[str]:
        if self._tables is None:
            self._parse_query_if_needed()
            self._tables = list(set(
                map(lambda tbl: tbl.name, self._ast.find_all(exp.Table))
            ))
        return self._tables
    
    def num_tables(self) -> int:
        return len(self.tables())
    
    def columns(self) -> List[str]:
        if self._columns is None:
            self._parse_query_if_needed()
            self._columns =  list(set(
                map(lambda col: col.output_name, self.ast().find_all(exp.Column))
            ))
        return self._columns

    def num_columns(self) -> int:
        return len(self.columns())
    
    def num_joins(self) -> List[str]:
        if self._num_joins is None:
            self._parse_query_if_needed()
            self._num_joins = 0             
            for _ in self.ast().find_all(exp.Join):
                self._num_joins += 1
        return self._num_joins



    
