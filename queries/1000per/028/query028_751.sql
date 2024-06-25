
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 169 and 169+10 
             or ss_coupon_amt between 1087 and 1087+1000
             or ss_wholesale_cost between 28 and 28+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 36 and 36+10
          or ss_coupon_amt between 11734 and 11734+1000
          or ss_wholesale_cost between 19 and 19+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 177 and 177+10
          or ss_coupon_amt between 4070 and 4070+1000
          or ss_wholesale_cost between 52 and 52+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 57 and 57+10
          or ss_coupon_amt between 6114 and 6114+1000
          or ss_wholesale_cost between 4 and 4+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 94 and 94+10
          or ss_coupon_amt between 5654 and 5654+1000
          or ss_wholesale_cost between 45 and 45+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 74 and 74+10
          or ss_coupon_amt between 13020 and 13020+1000
          or ss_wholesale_cost between 49 and 49+20)) B6
limit 100;


