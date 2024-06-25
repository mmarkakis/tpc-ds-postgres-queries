
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 61 and 61+10 
             or ss_coupon_amt between 808 and 808+1000
             or ss_wholesale_cost between 39 and 39+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 58 and 58+10
          or ss_coupon_amt between 5497 and 5497+1000
          or ss_wholesale_cost between 61 and 61+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 31 and 31+10
          or ss_coupon_amt between 17791 and 17791+1000
          or ss_wholesale_cost between 28 and 28+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 47 and 47+10
          or ss_coupon_amt between 14161 and 14161+1000
          or ss_wholesale_cost between 55 and 55+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 38 and 38+10
          or ss_coupon_amt between 5226 and 5226+1000
          or ss_wholesale_cost between 68 and 68+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 186 and 186+10
          or ss_coupon_amt between 17092 and 17092+1000
          or ss_wholesale_cost between 15 and 15+20)) B6
limit 100;


