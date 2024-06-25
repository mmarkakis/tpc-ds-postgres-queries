
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 33 and 33+10 
             or ss_coupon_amt between 15556 and 15556+1000
             or ss_wholesale_cost between 29 and 29+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 32 and 32+10
          or ss_coupon_amt between 14988 and 14988+1000
          or ss_wholesale_cost between 15 and 15+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 49 and 49+10
          or ss_coupon_amt between 15475 and 15475+1000
          or ss_wholesale_cost between 47 and 47+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 70 and 70+10
          or ss_coupon_amt between 3734 and 3734+1000
          or ss_wholesale_cost between 59 and 59+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 63 and 63+10
          or ss_coupon_amt between 2588 and 2588+1000
          or ss_wholesale_cost between 1 and 1+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 109 and 109+10
          or ss_coupon_amt between 15453 and 15453+1000
          or ss_wholesale_cost between 44 and 44+20)) B6
limit 100;


