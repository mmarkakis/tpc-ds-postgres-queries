
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 14 and 14+10 
             or ss_coupon_amt between 2523 and 2523+1000
             or ss_wholesale_cost between 47 and 47+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 147 and 147+10
          or ss_coupon_amt between 11538 and 11538+1000
          or ss_wholesale_cost between 38 and 38+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 37 and 37+10
          or ss_coupon_amt between 16622 and 16622+1000
          or ss_wholesale_cost between 36 and 36+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 48 and 48+10
          or ss_coupon_amt between 5816 and 5816+1000
          or ss_wholesale_cost between 61 and 61+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 43 and 43+10
          or ss_coupon_amt between 12919 and 12919+1000
          or ss_wholesale_cost between 13 and 13+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 56 and 56+10
          or ss_coupon_amt between 10167 and 10167+1000
          or ss_wholesale_cost between 26 and 26+20)) B6
limit 100;


