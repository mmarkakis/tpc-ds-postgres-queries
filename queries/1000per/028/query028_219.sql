
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 190 and 190+10 
             or ss_coupon_amt between 15758 and 15758+1000
             or ss_wholesale_cost between 42 and 42+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 17 and 17+10
          or ss_coupon_amt between 11926 and 11926+1000
          or ss_wholesale_cost between 36 and 36+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 174 and 174+10
          or ss_coupon_amt between 14695 and 14695+1000
          or ss_wholesale_cost between 74 and 74+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 107 and 107+10
          or ss_coupon_amt between 12482 and 12482+1000
          or ss_wholesale_cost between 73 and 73+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 79 and 79+10
          or ss_coupon_amt between 8391 and 8391+1000
          or ss_wholesale_cost between 31 and 31+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 143 and 143+10
          or ss_coupon_amt between 5870 and 5870+1000
          or ss_wholesale_cost between 16 and 16+20)) B6
limit 100;


