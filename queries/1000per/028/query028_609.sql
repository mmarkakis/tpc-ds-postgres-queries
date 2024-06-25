
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 142 and 142+10 
             or ss_coupon_amt between 1567 and 1567+1000
             or ss_wholesale_cost between 40 and 40+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 37 and 37+10
          or ss_coupon_amt between 17789 and 17789+1000
          or ss_wholesale_cost between 34 and 34+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 145 and 145+10
          or ss_coupon_amt between 14307 and 14307+1000
          or ss_wholesale_cost between 49 and 49+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 165 and 165+10
          or ss_coupon_amt between 17298 and 17298+1000
          or ss_wholesale_cost between 37 and 37+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 10 and 10+10
          or ss_coupon_amt between 9184 and 9184+1000
          or ss_wholesale_cost between 79 and 79+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 152 and 152+10
          or ss_coupon_amt between 9114 and 9114+1000
          or ss_wholesale_cost between 32 and 32+20)) B6
limit 100;


