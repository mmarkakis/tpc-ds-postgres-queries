
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 23 and 23+10 
             or ss_coupon_amt between 3032 and 3032+1000
             or ss_wholesale_cost between 39 and 39+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 57 and 57+10
          or ss_coupon_amt between 1733 and 1733+1000
          or ss_wholesale_cost between 3 and 3+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 125 and 125+10
          or ss_coupon_amt between 4609 and 4609+1000
          or ss_wholesale_cost between 74 and 74+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 19 and 19+10
          or ss_coupon_amt between 5730 and 5730+1000
          or ss_wholesale_cost between 15 and 15+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 47 and 47+10
          or ss_coupon_amt between 1207 and 1207+1000
          or ss_wholesale_cost between 12 and 12+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 60 and 60+10
          or ss_coupon_amt between 9478 and 9478+1000
          or ss_wholesale_cost between 31 and 31+20)) B6
limit 100;


