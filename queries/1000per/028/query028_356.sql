
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 138 and 138+10 
             or ss_coupon_amt between 5125 and 5125+1000
             or ss_wholesale_cost between 60 and 60+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 141 and 141+10
          or ss_coupon_amt between 6587 and 6587+1000
          or ss_wholesale_cost between 6 and 6+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 21 and 21+10
          or ss_coupon_amt between 17893 and 17893+1000
          or ss_wholesale_cost between 0 and 0+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 0 and 0+10
          or ss_coupon_amt between 7504 and 7504+1000
          or ss_wholesale_cost between 50 and 50+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 189 and 189+10
          or ss_coupon_amt between 7494 and 7494+1000
          or ss_wholesale_cost between 73 and 73+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 130 and 130+10
          or ss_coupon_amt between 13607 and 13607+1000
          or ss_wholesale_cost between 1 and 1+20)) B6
limit 100;


