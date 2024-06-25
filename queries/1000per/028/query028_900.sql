
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 165 and 165+10 
             or ss_coupon_amt between 3166 and 3166+1000
             or ss_wholesale_cost between 4 and 4+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 147 and 147+10
          or ss_coupon_amt between 6181 and 6181+1000
          or ss_wholesale_cost between 34 and 34+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 3 and 3+10
          or ss_coupon_amt between 1440 and 1440+1000
          or ss_wholesale_cost between 39 and 39+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 26 and 26+10
          or ss_coupon_amt between 2569 and 2569+1000
          or ss_wholesale_cost between 76 and 76+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 46 and 46+10
          or ss_coupon_amt between 7676 and 7676+1000
          or ss_wholesale_cost between 26 and 26+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 127 and 127+10
          or ss_coupon_amt between 7897 and 7897+1000
          or ss_wholesale_cost between 28 and 28+20)) B6
limit 100;


