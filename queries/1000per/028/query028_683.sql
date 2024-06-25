
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 35 and 35+10 
             or ss_coupon_amt between 2373 and 2373+1000
             or ss_wholesale_cost between 0 and 0+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 176 and 176+10
          or ss_coupon_amt between 7504 and 7504+1000
          or ss_wholesale_cost between 3 and 3+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 165 and 165+10
          or ss_coupon_amt between 14192 and 14192+1000
          or ss_wholesale_cost between 67 and 67+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 120 and 120+10
          or ss_coupon_amt between 10043 and 10043+1000
          or ss_wholesale_cost between 11 and 11+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 104 and 104+10
          or ss_coupon_amt between 12895 and 12895+1000
          or ss_wholesale_cost between 25 and 25+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 168 and 168+10
          or ss_coupon_amt between 15790 and 15790+1000
          or ss_wholesale_cost between 46 and 46+20)) B6
limit 100;


