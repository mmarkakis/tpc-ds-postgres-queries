
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 68 and 68+10 
             or ss_coupon_amt between 12086 and 12086+1000
             or ss_wholesale_cost between 51 and 51+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 54 and 54+10
          or ss_coupon_amt between 4360 and 4360+1000
          or ss_wholesale_cost between 53 and 53+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 4 and 4+10
          or ss_coupon_amt between 16081 and 16081+1000
          or ss_wholesale_cost between 70 and 70+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 162 and 162+10
          or ss_coupon_amt between 9367 and 9367+1000
          or ss_wholesale_cost between 10 and 10+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 165 and 165+10
          or ss_coupon_amt between 5569 and 5569+1000
          or ss_wholesale_cost between 69 and 69+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 155 and 155+10
          or ss_coupon_amt between 12710 and 12710+1000
          or ss_wholesale_cost between 78 and 78+20)) B6
limit 100;


