
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 165 and 165+10 
             or ss_coupon_amt between 11003 and 11003+1000
             or ss_wholesale_cost between 35 and 35+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 72 and 72+10
          or ss_coupon_amt between 5405 and 5405+1000
          or ss_wholesale_cost between 53 and 53+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 170 and 170+10
          or ss_coupon_amt between 26 and 26+1000
          or ss_wholesale_cost between 66 and 66+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 156 and 156+10
          or ss_coupon_amt between 6174 and 6174+1000
          or ss_wholesale_cost between 45 and 45+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 173 and 173+10
          or ss_coupon_amt between 7073 and 7073+1000
          or ss_wholesale_cost between 14 and 14+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 32 and 32+10
          or ss_coupon_amt between 17806 and 17806+1000
          or ss_wholesale_cost between 56 and 56+20)) B6
limit 100;


