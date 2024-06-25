
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 32 and 32+10 
             or ss_coupon_amt between 4219 and 4219+1000
             or ss_wholesale_cost between 30 and 30+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 50 and 50+10
          or ss_coupon_amt between 411 and 411+1000
          or ss_wholesale_cost between 20 and 20+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 150 and 150+10
          or ss_coupon_amt between 2676 and 2676+1000
          or ss_wholesale_cost between 31 and 31+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 65 and 65+10
          or ss_coupon_amt between 8181 and 8181+1000
          or ss_wholesale_cost between 67 and 67+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 128 and 128+10
          or ss_coupon_amt between 5046 and 5046+1000
          or ss_wholesale_cost between 17 and 17+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 55 and 55+10
          or ss_coupon_amt between 1987 and 1987+1000
          or ss_wholesale_cost between 1 and 1+20)) B6
limit 100;


