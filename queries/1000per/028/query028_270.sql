
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 33 and 33+10 
             or ss_coupon_amt between 4066 and 4066+1000
             or ss_wholesale_cost between 28 and 28+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 176 and 176+10
          or ss_coupon_amt between 1736 and 1736+1000
          or ss_wholesale_cost between 54 and 54+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 49 and 49+10
          or ss_coupon_amt between 8860 and 8860+1000
          or ss_wholesale_cost between 79 and 79+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 162 and 162+10
          or ss_coupon_amt between 4708 and 4708+1000
          or ss_wholesale_cost between 77 and 77+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 84 and 84+10
          or ss_coupon_amt between 10604 and 10604+1000
          or ss_wholesale_cost between 52 and 52+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 80 and 80+10
          or ss_coupon_amt between 15476 and 15476+1000
          or ss_wholesale_cost between 5 and 5+20)) B6
limit 100;


