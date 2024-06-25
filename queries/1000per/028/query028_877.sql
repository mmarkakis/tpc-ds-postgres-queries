
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 88 and 88+10 
             or ss_coupon_amt between 12160 and 12160+1000
             or ss_wholesale_cost between 32 and 32+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 26 and 26+10
          or ss_coupon_amt between 16483 and 16483+1000
          or ss_wholesale_cost between 67 and 67+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 114 and 114+10
          or ss_coupon_amt between 17921 and 17921+1000
          or ss_wholesale_cost between 50 and 50+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 178 and 178+10
          or ss_coupon_amt between 127 and 127+1000
          or ss_wholesale_cost between 20 and 20+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 177 and 177+10
          or ss_coupon_amt between 17886 and 17886+1000
          or ss_wholesale_cost between 24 and 24+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 164 and 164+10
          or ss_coupon_amt between 403 and 403+1000
          or ss_wholesale_cost between 29 and 29+20)) B6
limit 100;


