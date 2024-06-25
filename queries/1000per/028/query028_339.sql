
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 51 and 51+10 
             or ss_coupon_amt between 14248 and 14248+1000
             or ss_wholesale_cost between 31 and 31+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 50 and 50+10
          or ss_coupon_amt between 5818 and 5818+1000
          or ss_wholesale_cost between 8 and 8+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 189 and 189+10
          or ss_coupon_amt between 11856 and 11856+1000
          or ss_wholesale_cost between 59 and 59+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 48 and 48+10
          or ss_coupon_amt between 2532 and 2532+1000
          or ss_wholesale_cost between 64 and 64+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 82 and 82+10
          or ss_coupon_amt between 6935 and 6935+1000
          or ss_wholesale_cost between 41 and 41+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 65 and 65+10
          or ss_coupon_amt between 8432 and 8432+1000
          or ss_wholesale_cost between 43 and 43+20)) B6
limit 100;


