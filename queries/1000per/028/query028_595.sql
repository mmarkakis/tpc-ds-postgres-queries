
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 159 and 159+10 
             or ss_coupon_amt between 4929 and 4929+1000
             or ss_wholesale_cost between 48 and 48+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 183 and 183+10
          or ss_coupon_amt between 10837 and 10837+1000
          or ss_wholesale_cost between 39 and 39+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 100 and 100+10
          or ss_coupon_amt between 9723 and 9723+1000
          or ss_wholesale_cost between 33 and 33+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 64 and 64+10
          or ss_coupon_amt between 5338 and 5338+1000
          or ss_wholesale_cost between 44 and 44+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 175 and 175+10
          or ss_coupon_amt between 10089 and 10089+1000
          or ss_wholesale_cost between 6 and 6+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 158 and 158+10
          or ss_coupon_amt between 2099 and 2099+1000
          or ss_wholesale_cost between 2 and 2+20)) B6
limit 100;


