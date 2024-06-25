
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 161 and 161+10 
             or ss_coupon_amt between 550 and 550+1000
             or ss_wholesale_cost between 59 and 59+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 107 and 107+10
          or ss_coupon_amt between 2009 and 2009+1000
          or ss_wholesale_cost between 38 and 38+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 93 and 93+10
          or ss_coupon_amt between 13604 and 13604+1000
          or ss_wholesale_cost between 18 and 18+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 26 and 26+10
          or ss_coupon_amt between 9568 and 9568+1000
          or ss_wholesale_cost between 52 and 52+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 187 and 187+10
          or ss_coupon_amt between 1238 and 1238+1000
          or ss_wholesale_cost between 5 and 5+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 36 and 36+10
          or ss_coupon_amt between 4324 and 4324+1000
          or ss_wholesale_cost between 28 and 28+20)) B6
limit 100;


