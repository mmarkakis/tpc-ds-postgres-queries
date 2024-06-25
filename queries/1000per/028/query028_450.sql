
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 81 and 81+10 
             or ss_coupon_amt between 3932 and 3932+1000
             or ss_wholesale_cost between 64 and 64+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 45 and 45+10
          or ss_coupon_amt between 625 and 625+1000
          or ss_wholesale_cost between 78 and 78+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 2 and 2+10
          or ss_coupon_amt between 5937 and 5937+1000
          or ss_wholesale_cost between 41 and 41+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 35 and 35+10
          or ss_coupon_amt between 401 and 401+1000
          or ss_wholesale_cost between 32 and 32+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 63 and 63+10
          or ss_coupon_amt between 13083 and 13083+1000
          or ss_wholesale_cost between 57 and 57+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 32 and 32+10
          or ss_coupon_amt between 2645 and 2645+1000
          or ss_wholesale_cost between 68 and 68+20)) B6
limit 100;


