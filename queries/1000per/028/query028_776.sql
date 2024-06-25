
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 119 and 119+10 
             or ss_coupon_amt between 8885 and 8885+1000
             or ss_wholesale_cost between 7 and 7+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 186 and 186+10
          or ss_coupon_amt between 13826 and 13826+1000
          or ss_wholesale_cost between 30 and 30+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 6 and 6+10
          or ss_coupon_amt between 16744 and 16744+1000
          or ss_wholesale_cost between 42 and 42+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 183 and 183+10
          or ss_coupon_amt between 5533 and 5533+1000
          or ss_wholesale_cost between 65 and 65+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 143 and 143+10
          or ss_coupon_amt between 3987 and 3987+1000
          or ss_wholesale_cost between 29 and 29+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 52 and 52+10
          or ss_coupon_amt between 17975 and 17975+1000
          or ss_wholesale_cost between 44 and 44+20)) B6
limit 100;


