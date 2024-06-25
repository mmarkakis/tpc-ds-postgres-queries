
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 26 and 26+10 
             or ss_coupon_amt between 13289 and 13289+1000
             or ss_wholesale_cost between 71 and 71+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 0 and 0+10
          or ss_coupon_amt between 5345 and 5345+1000
          or ss_wholesale_cost between 1 and 1+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 54 and 54+10
          or ss_coupon_amt between 14246 and 14246+1000
          or ss_wholesale_cost between 22 and 22+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 10707 and 10707+1000
          or ss_wholesale_cost between 43 and 43+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 38 and 38+10
          or ss_coupon_amt between 10573 and 10573+1000
          or ss_wholesale_cost between 50 and 50+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 65 and 65+10
          or ss_coupon_amt between 4897 and 4897+1000
          or ss_wholesale_cost between 35 and 35+20)) B6
limit 100;


