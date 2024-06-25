
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 5 and 5+10 
             or ss_coupon_amt between 754 and 754+1000
             or ss_wholesale_cost between 17 and 17+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 21 and 21+10
          or ss_coupon_amt between 7176 and 7176+1000
          or ss_wholesale_cost between 6 and 6+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 41 and 41+10
          or ss_coupon_amt between 15603 and 15603+1000
          or ss_wholesale_cost between 50 and 50+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 123 and 123+10
          or ss_coupon_amt between 15205 and 15205+1000
          or ss_wholesale_cost between 53 and 53+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 42 and 42+10
          or ss_coupon_amt between 15111 and 15111+1000
          or ss_wholesale_cost between 15 and 15+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 7 and 7+10
          or ss_coupon_amt between 3292 and 3292+1000
          or ss_wholesale_cost between 76 and 76+20)) B6
limit 100;


