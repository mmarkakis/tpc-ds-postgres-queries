
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 64 and 64+10 
             or ss_coupon_amt between 17181 and 17181+1000
             or ss_wholesale_cost between 16 and 16+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 85 and 85+10
          or ss_coupon_amt between 15695 and 15695+1000
          or ss_wholesale_cost between 22 and 22+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 96 and 96+10
          or ss_coupon_amt between 3159 and 3159+1000
          or ss_wholesale_cost between 64 and 64+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 102 and 102+10
          or ss_coupon_amt between 6778 and 6778+1000
          or ss_wholesale_cost between 2 and 2+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 117 and 117+10
          or ss_coupon_amt between 14280 and 14280+1000
          or ss_wholesale_cost between 17 and 17+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 49 and 49+10
          or ss_coupon_amt between 863 and 863+1000
          or ss_wholesale_cost between 61 and 61+20)) B6
limit 100;


