
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 166 and 166+10 
             or ss_coupon_amt between 9454 and 9454+1000
             or ss_wholesale_cost between 50 and 50+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 79 and 79+10
          or ss_coupon_amt between 5317 and 5317+1000
          or ss_wholesale_cost between 45 and 45+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 152 and 152+10
          or ss_coupon_amt between 8937 and 8937+1000
          or ss_wholesale_cost between 5 and 5+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 100 and 100+10
          or ss_coupon_amt between 2851 and 2851+1000
          or ss_wholesale_cost between 71 and 71+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 173 and 173+10
          or ss_coupon_amt between 13881 and 13881+1000
          or ss_wholesale_cost between 2 and 2+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 32 and 32+10
          or ss_coupon_amt between 14902 and 14902+1000
          or ss_wholesale_cost between 24 and 24+20)) B6
limit 100;


