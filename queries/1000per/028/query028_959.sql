
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 19 and 19+10 
             or ss_coupon_amt between 2714 and 2714+1000
             or ss_wholesale_cost between 52 and 52+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 148 and 148+10
          or ss_coupon_amt between 8602 and 8602+1000
          or ss_wholesale_cost between 80 and 80+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 83 and 83+10
          or ss_coupon_amt between 10835 and 10835+1000
          or ss_wholesale_cost between 9 and 9+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 13 and 13+10
          or ss_coupon_amt between 16590 and 16590+1000
          or ss_wholesale_cost between 66 and 66+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 176 and 176+10
          or ss_coupon_amt between 200 and 200+1000
          or ss_wholesale_cost between 45 and 45+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 53 and 53+10
          or ss_coupon_amt between 15476 and 15476+1000
          or ss_wholesale_cost between 10 and 10+20)) B6
limit 100;


