
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 127 and 127+10 
             or ss_coupon_amt between 11202 and 11202+1000
             or ss_wholesale_cost between 37 and 37+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 189 and 189+10
          or ss_coupon_amt between 13140 and 13140+1000
          or ss_wholesale_cost between 65 and 65+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 54 and 54+10
          or ss_coupon_amt between 15753 and 15753+1000
          or ss_wholesale_cost between 41 and 41+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 179 and 179+10
          or ss_coupon_amt between 16424 and 16424+1000
          or ss_wholesale_cost between 47 and 47+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 146 and 146+10
          or ss_coupon_amt between 536 and 536+1000
          or ss_wholesale_cost between 45 and 45+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 140 and 140+10
          or ss_coupon_amt between 15599 and 15599+1000
          or ss_wholesale_cost between 3 and 3+20)) B6
limit 100;


