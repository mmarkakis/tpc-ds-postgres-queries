
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 109 and 109+10 
             or ss_coupon_amt between 2288 and 2288+1000
             or ss_wholesale_cost between 37 and 37+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 106 and 106+10
          or ss_coupon_amt between 6661 and 6661+1000
          or ss_wholesale_cost between 52 and 52+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 26 and 26+10
          or ss_coupon_amt between 15850 and 15850+1000
          or ss_wholesale_cost between 54 and 54+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 13 and 13+10
          or ss_coupon_amt between 7811 and 7811+1000
          or ss_wholesale_cost between 59 and 59+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 127 and 127+10
          or ss_coupon_amt between 5841 and 5841+1000
          or ss_wholesale_cost between 15 and 15+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 21 and 21+10
          or ss_coupon_amt between 16568 and 16568+1000
          or ss_wholesale_cost between 39 and 39+20)) B6
limit 100;


