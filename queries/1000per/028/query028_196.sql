
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 100 and 100+10 
             or ss_coupon_amt between 12860 and 12860+1000
             or ss_wholesale_cost between 75 and 75+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 176 and 176+10
          or ss_coupon_amt between 7128 and 7128+1000
          or ss_wholesale_cost between 44 and 44+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 125 and 125+10
          or ss_coupon_amt between 10965 and 10965+1000
          or ss_wholesale_cost between 40 and 40+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 183 and 183+10
          or ss_coupon_amt between 9298 and 9298+1000
          or ss_wholesale_cost between 35 and 35+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 34 and 34+10
          or ss_coupon_amt between 1100 and 1100+1000
          or ss_wholesale_cost between 7 and 7+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 99 and 99+10
          or ss_coupon_amt between 7665 and 7665+1000
          or ss_wholesale_cost between 43 and 43+20)) B6
limit 100;


