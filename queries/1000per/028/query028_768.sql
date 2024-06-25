
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 172 and 172+10 
             or ss_coupon_amt between 10170 and 10170+1000
             or ss_wholesale_cost between 1 and 1+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 13 and 13+10
          or ss_coupon_amt between 11341 and 11341+1000
          or ss_wholesale_cost between 12 and 12+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 124 and 124+10
          or ss_coupon_amt between 10152 and 10152+1000
          or ss_wholesale_cost between 26 and 26+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 111 and 111+10
          or ss_coupon_amt between 8404 and 8404+1000
          or ss_wholesale_cost between 64 and 64+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 156 and 156+10
          or ss_coupon_amt between 10576 and 10576+1000
          or ss_wholesale_cost between 47 and 47+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 68 and 68+10
          or ss_coupon_amt between 13633 and 13633+1000
          or ss_wholesale_cost between 37 and 37+20)) B6
limit 100;


