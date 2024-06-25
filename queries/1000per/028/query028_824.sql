
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 168 and 168+10 
             or ss_coupon_amt between 10526 and 10526+1000
             or ss_wholesale_cost between 27 and 27+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 145 and 145+10
          or ss_coupon_amt between 13537 and 13537+1000
          or ss_wholesale_cost between 69 and 69+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 115 and 115+10
          or ss_coupon_amt between 14138 and 14138+1000
          or ss_wholesale_cost between 34 and 34+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 18 and 18+10
          or ss_coupon_amt between 5479 and 5479+1000
          or ss_wholesale_cost between 43 and 43+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 40 and 40+10
          or ss_coupon_amt between 5455 and 5455+1000
          or ss_wholesale_cost between 61 and 61+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 29 and 29+10
          or ss_coupon_amt between 13527 and 13527+1000
          or ss_wholesale_cost between 76 and 76+20)) B6
limit 100;


