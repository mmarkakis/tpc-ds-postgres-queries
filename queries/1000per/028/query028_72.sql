
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 112 and 112+10 
             or ss_coupon_amt between 16440 and 16440+1000
             or ss_wholesale_cost between 52 and 52+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 109 and 109+10
          or ss_coupon_amt between 6737 and 6737+1000
          or ss_wholesale_cost between 79 and 79+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 146 and 146+10
          or ss_coupon_amt between 16460 and 16460+1000
          or ss_wholesale_cost between 6 and 6+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 133 and 133+10
          or ss_coupon_amt between 5467 and 5467+1000
          or ss_wholesale_cost between 20 and 20+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 173 and 173+10
          or ss_coupon_amt between 8272 and 8272+1000
          or ss_wholesale_cost between 43 and 43+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 107 and 107+10
          or ss_coupon_amt between 17495 and 17495+1000
          or ss_wholesale_cost between 4 and 4+20)) B6
limit 100;


