
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 167 and 167+10 
             or ss_coupon_amt between 3483 and 3483+1000
             or ss_wholesale_cost between 70 and 70+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 163 and 163+10
          or ss_coupon_amt between 7297 and 7297+1000
          or ss_wholesale_cost between 25 and 25+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 79 and 79+10
          or ss_coupon_amt between 13123 and 13123+1000
          or ss_wholesale_cost between 22 and 22+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 112 and 112+10
          or ss_coupon_amt between 7338 and 7338+1000
          or ss_wholesale_cost between 47 and 47+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 86 and 86+10
          or ss_coupon_amt between 4435 and 4435+1000
          or ss_wholesale_cost between 37 and 37+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 83 and 83+10
          or ss_coupon_amt between 17205 and 17205+1000
          or ss_wholesale_cost between 54 and 54+20)) B6
limit 100;


