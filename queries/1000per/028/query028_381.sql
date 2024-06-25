
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 129 and 129+10 
             or ss_coupon_amt between 2511 and 2511+1000
             or ss_wholesale_cost between 7 and 7+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 22 and 22+10
          or ss_coupon_amt between 7751 and 7751+1000
          or ss_wholesale_cost between 77 and 77+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 66 and 66+10
          or ss_coupon_amt between 6052 and 6052+1000
          or ss_wholesale_cost between 78 and 78+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 13 and 13+10
          or ss_coupon_amt between 634 and 634+1000
          or ss_wholesale_cost between 51 and 51+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 4 and 4+10
          or ss_coupon_amt between 13031 and 13031+1000
          or ss_wholesale_cost between 36 and 36+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 124 and 124+10
          or ss_coupon_amt between 6375 and 6375+1000
          or ss_wholesale_cost between 13 and 13+20)) B6
limit 100;


