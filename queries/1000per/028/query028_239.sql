
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 165 and 165+10 
             or ss_coupon_amt between 7678 and 7678+1000
             or ss_wholesale_cost between 68 and 68+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 111 and 111+10
          or ss_coupon_amt between 4727 and 4727+1000
          or ss_wholesale_cost between 73 and 73+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 130 and 130+10
          or ss_coupon_amt between 10130 and 10130+1000
          or ss_wholesale_cost between 70 and 70+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 143 and 143+10
          or ss_coupon_amt between 9675 and 9675+1000
          or ss_wholesale_cost between 48 and 48+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 89 and 89+10
          or ss_coupon_amt between 16409 and 16409+1000
          or ss_wholesale_cost between 52 and 52+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 39 and 39+10
          or ss_coupon_amt between 9901 and 9901+1000
          or ss_wholesale_cost between 15 and 15+20)) B6
limit 100;


