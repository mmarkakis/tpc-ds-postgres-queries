
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 52 and 52+10 
             or ss_coupon_amt between 6598 and 6598+1000
             or ss_wholesale_cost between 27 and 27+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 40 and 40+10
          or ss_coupon_amt between 11311 and 11311+1000
          or ss_wholesale_cost between 56 and 56+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 170 and 170+10
          or ss_coupon_amt between 12319 and 12319+1000
          or ss_wholesale_cost between 33 and 33+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 42 and 42+10
          or ss_coupon_amt between 17269 and 17269+1000
          or ss_wholesale_cost between 16 and 16+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 139 and 139+10
          or ss_coupon_amt between 16142 and 16142+1000
          or ss_wholesale_cost between 36 and 36+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 115 and 115+10
          or ss_coupon_amt between 14958 and 14958+1000
          or ss_wholesale_cost between 25 and 25+20)) B6
limit 100;


