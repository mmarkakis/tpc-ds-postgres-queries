
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 155 and 155+10 
             or ss_coupon_amt between 5649 and 5649+1000
             or ss_wholesale_cost between 38 and 38+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 2 and 2+10
          or ss_coupon_amt between 6602 and 6602+1000
          or ss_wholesale_cost between 58 and 58+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 51 and 51+10
          or ss_coupon_amt between 11222 and 11222+1000
          or ss_wholesale_cost between 49 and 49+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 84 and 84+10
          or ss_coupon_amt between 7777 and 7777+1000
          or ss_wholesale_cost between 52 and 52+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 40 and 40+10
          or ss_coupon_amt between 3870 and 3870+1000
          or ss_wholesale_cost between 5 and 5+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 74 and 74+10
          or ss_coupon_amt between 10735 and 10735+1000
          or ss_wholesale_cost between 71 and 71+20)) B6
limit 100;


