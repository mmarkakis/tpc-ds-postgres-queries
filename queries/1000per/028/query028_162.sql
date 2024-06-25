
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 87 and 87+10 
             or ss_coupon_amt between 17990 and 17990+1000
             or ss_wholesale_cost between 47 and 47+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 5248 and 5248+1000
          or ss_wholesale_cost between 29 and 29+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 68 and 68+10
          or ss_coupon_amt between 15921 and 15921+1000
          or ss_wholesale_cost between 26 and 26+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 56 and 56+10
          or ss_coupon_amt between 11518 and 11518+1000
          or ss_wholesale_cost between 41 and 41+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 145 and 145+10
          or ss_coupon_amt between 12347 and 12347+1000
          or ss_wholesale_cost between 76 and 76+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 26 and 26+10
          or ss_coupon_amt between 14869 and 14869+1000
          or ss_wholesale_cost between 37 and 37+20)) B6
limit 100;


