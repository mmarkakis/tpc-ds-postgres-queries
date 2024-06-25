
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 105 and 105+10 
             or ss_coupon_amt between 4898 and 4898+1000
             or ss_wholesale_cost between 64 and 64+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 0 and 0+10
          or ss_coupon_amt between 17520 and 17520+1000
          or ss_wholesale_cost between 41 and 41+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 9 and 9+10
          or ss_coupon_amt between 8957 and 8957+1000
          or ss_wholesale_cost between 22 and 22+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 174 and 174+10
          or ss_coupon_amt between 17654 and 17654+1000
          or ss_wholesale_cost between 5 and 5+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 8 and 8+10
          or ss_coupon_amt between 16109 and 16109+1000
          or ss_wholesale_cost between 1 and 1+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 86 and 86+10
          or ss_coupon_amt between 7909 and 7909+1000
          or ss_wholesale_cost between 11 and 11+20)) B6
limit 100;


