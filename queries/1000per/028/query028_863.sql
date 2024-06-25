
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 138 and 138+10 
             or ss_coupon_amt between 533 and 533+1000
             or ss_wholesale_cost between 32 and 32+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 73 and 73+10
          or ss_coupon_amt between 8798 and 8798+1000
          or ss_wholesale_cost between 36 and 36+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 4 and 4+10
          or ss_coupon_amt between 11831 and 11831+1000
          or ss_wholesale_cost between 50 and 50+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 36 and 36+10
          or ss_coupon_amt between 6786 and 6786+1000
          or ss_wholesale_cost between 18 and 18+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 124 and 124+10
          or ss_coupon_amt between 10003 and 10003+1000
          or ss_wholesale_cost between 41 and 41+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 51 and 51+10
          or ss_coupon_amt between 16495 and 16495+1000
          or ss_wholesale_cost between 57 and 57+20)) B6
limit 100;


