
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 7 and 7+10 
             or ss_coupon_amt between 17547 and 17547+1000
             or ss_wholesale_cost between 53 and 53+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 19 and 19+10
          or ss_coupon_amt between 10275 and 10275+1000
          or ss_wholesale_cost between 66 and 66+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 117 and 117+10
          or ss_coupon_amt between 11573 and 11573+1000
          or ss_wholesale_cost between 78 and 78+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 130 and 130+10
          or ss_coupon_amt between 10084 and 10084+1000
          or ss_wholesale_cost between 27 and 27+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 168 and 168+10
          or ss_coupon_amt between 195 and 195+1000
          or ss_wholesale_cost between 35 and 35+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 20 and 20+10
          or ss_coupon_amt between 423 and 423+1000
          or ss_wholesale_cost between 28 and 28+20)) B6
limit 100;


