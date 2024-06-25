
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 18 and 18+10 
             or ss_coupon_amt between 5018 and 5018+1000
             or ss_wholesale_cost between 68 and 68+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 8 and 8+10
          or ss_coupon_amt between 8592 and 8592+1000
          or ss_wholesale_cost between 23 and 23+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 41 and 41+10
          or ss_coupon_amt between 2140 and 2140+1000
          or ss_wholesale_cost between 38 and 38+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 165 and 165+10
          or ss_coupon_amt between 2349 and 2349+1000
          or ss_wholesale_cost between 36 and 36+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 23 and 23+10
          or ss_coupon_amt between 9331 and 9331+1000
          or ss_wholesale_cost between 15 and 15+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 77 and 77+10
          or ss_coupon_amt between 14407 and 14407+1000
          or ss_wholesale_cost between 27 and 27+20)) B6
limit 100;


