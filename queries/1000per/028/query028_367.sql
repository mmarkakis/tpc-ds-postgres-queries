
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 14 and 14+10 
             or ss_coupon_amt between 11262 and 11262+1000
             or ss_wholesale_cost between 49 and 49+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 171 and 171+10
          or ss_coupon_amt between 16060 and 16060+1000
          or ss_wholesale_cost between 24 and 24+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 39 and 39+10
          or ss_coupon_amt between 6814 and 6814+1000
          or ss_wholesale_cost between 21 and 21+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 139 and 139+10
          or ss_coupon_amt between 6764 and 6764+1000
          or ss_wholesale_cost between 9 and 9+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 12 and 12+10
          or ss_coupon_amt between 1917 and 1917+1000
          or ss_wholesale_cost between 70 and 70+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 187 and 187+10
          or ss_coupon_amt between 9974 and 9974+1000
          or ss_wholesale_cost between 29 and 29+20)) B6
limit 100;


