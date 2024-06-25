
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 18 and 18+10 
             or ss_coupon_amt between 11293 and 11293+1000
             or ss_wholesale_cost between 9 and 9+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 119 and 119+10
          or ss_coupon_amt between 11754 and 11754+1000
          or ss_wholesale_cost between 59 and 59+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 46 and 46+10
          or ss_coupon_amt between 9115 and 9115+1000
          or ss_wholesale_cost between 64 and 64+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 84 and 84+10
          or ss_coupon_amt between 11156 and 11156+1000
          or ss_wholesale_cost between 10 and 10+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 149 and 149+10
          or ss_coupon_amt between 3965 and 3965+1000
          or ss_wholesale_cost between 70 and 70+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 54 and 54+10
          or ss_coupon_amt between 9835 and 9835+1000
          or ss_wholesale_cost between 8 and 8+20)) B6
limit 100;


