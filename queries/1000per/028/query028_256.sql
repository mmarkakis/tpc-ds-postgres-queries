
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 170 and 170+10 
             or ss_coupon_amt between 10352 and 10352+1000
             or ss_wholesale_cost between 72 and 72+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 120 and 120+10
          or ss_coupon_amt between 14394 and 14394+1000
          or ss_wholesale_cost between 0 and 0+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 82 and 82+10
          or ss_coupon_amt between 348 and 348+1000
          or ss_wholesale_cost between 20 and 20+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 2 and 2+10
          or ss_coupon_amt between 12013 and 12013+1000
          or ss_wholesale_cost between 18 and 18+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 0 and 0+10
          or ss_coupon_amt between 11353 and 11353+1000
          or ss_wholesale_cost between 29 and 29+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 70 and 70+10
          or ss_coupon_amt between 11553 and 11553+1000
          or ss_wholesale_cost between 9 and 9+20)) B6
limit 100;


