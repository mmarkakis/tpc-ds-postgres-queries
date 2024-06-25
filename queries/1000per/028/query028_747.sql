
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 174 and 174+10 
             or ss_coupon_amt between 9820 and 9820+1000
             or ss_wholesale_cost between 49 and 49+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 106 and 106+10
          or ss_coupon_amt between 8531 and 8531+1000
          or ss_wholesale_cost between 33 and 33+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 77 and 77+10
          or ss_coupon_amt between 4611 and 4611+1000
          or ss_wholesale_cost between 20 and 20+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 119 and 119+10
          or ss_coupon_amt between 11611 and 11611+1000
          or ss_wholesale_cost between 79 and 79+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 123 and 123+10
          or ss_coupon_amt between 14160 and 14160+1000
          or ss_wholesale_cost between 16 and 16+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 108 and 108+10
          or ss_coupon_amt between 12787 and 12787+1000
          or ss_wholesale_cost between 19 and 19+20)) B6
limit 100;


