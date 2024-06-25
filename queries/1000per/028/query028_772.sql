
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 180 and 180+10 
             or ss_coupon_amt between 2207 and 2207+1000
             or ss_wholesale_cost between 50 and 50+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 23 and 23+10
          or ss_coupon_amt between 2743 and 2743+1000
          or ss_wholesale_cost between 43 and 43+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 35 and 35+10
          or ss_coupon_amt between 1564 and 1564+1000
          or ss_wholesale_cost between 32 and 32+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 90 and 90+10
          or ss_coupon_amt between 10589 and 10589+1000
          or ss_wholesale_cost between 11 and 11+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 144 and 144+10
          or ss_coupon_amt between 9301 and 9301+1000
          or ss_wholesale_cost between 55 and 55+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 153 and 153+10
          or ss_coupon_amt between 13432 and 13432+1000
          or ss_wholesale_cost between 0 and 0+20)) B6
limit 100;


