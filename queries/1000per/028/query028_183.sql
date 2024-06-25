
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 175 and 175+10 
             or ss_coupon_amt between 2565 and 2565+1000
             or ss_wholesale_cost between 23 and 23+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 150 and 150+10
          or ss_coupon_amt between 13957 and 13957+1000
          or ss_wholesale_cost between 58 and 58+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 36 and 36+10
          or ss_coupon_amt between 8626 and 8626+1000
          or ss_wholesale_cost between 60 and 60+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 59 and 59+10
          or ss_coupon_amt between 6659 and 6659+1000
          or ss_wholesale_cost between 68 and 68+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 24 and 24+10
          or ss_coupon_amt between 3147 and 3147+1000
          or ss_wholesale_cost between 45 and 45+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 122 and 122+10
          or ss_coupon_amt between 16245 and 16245+1000
          or ss_wholesale_cost between 49 and 49+20)) B6
limit 100;


