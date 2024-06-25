
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 40 and 40+10 
             or ss_coupon_amt between 10507 and 10507+1000
             or ss_wholesale_cost between 54 and 54+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 30 and 30+10
          or ss_coupon_amt between 12040 and 12040+1000
          or ss_wholesale_cost between 26 and 26+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 11 and 11+10
          or ss_coupon_amt between 10332 and 10332+1000
          or ss_wholesale_cost between 76 and 76+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 50 and 50+10
          or ss_coupon_amt between 336 and 336+1000
          or ss_wholesale_cost between 73 and 73+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 57 and 57+10
          or ss_coupon_amt between 1607 and 1607+1000
          or ss_wholesale_cost between 40 and 40+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 76 and 76+10
          or ss_coupon_amt between 5542 and 5542+1000
          or ss_wholesale_cost between 70 and 70+20)) B6
limit 100;


