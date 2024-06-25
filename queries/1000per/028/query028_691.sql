
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 14 and 14+10 
             or ss_coupon_amt between 5572 and 5572+1000
             or ss_wholesale_cost between 28 and 28+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 91 and 91+10
          or ss_coupon_amt between 15730 and 15730+1000
          or ss_wholesale_cost between 20 and 20+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 104 and 104+10
          or ss_coupon_amt between 9446 and 9446+1000
          or ss_wholesale_cost between 34 and 34+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 155 and 155+10
          or ss_coupon_amt between 9011 and 9011+1000
          or ss_wholesale_cost between 52 and 52+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 61 and 61+10
          or ss_coupon_amt between 5643 and 5643+1000
          or ss_wholesale_cost between 29 and 29+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 177 and 177+10
          or ss_coupon_amt between 13559 and 13559+1000
          or ss_wholesale_cost between 18 and 18+20)) B6
limit 100;


