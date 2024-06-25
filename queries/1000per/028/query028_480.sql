
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 112 and 112+10 
             or ss_coupon_amt between 15377 and 15377+1000
             or ss_wholesale_cost between 80 and 80+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 146 and 146+10
          or ss_coupon_amt between 12510 and 12510+1000
          or ss_wholesale_cost between 56 and 56+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 116 and 116+10
          or ss_coupon_amt between 12628 and 12628+1000
          or ss_wholesale_cost between 29 and 29+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 20 and 20+10
          or ss_coupon_amt between 7671 and 7671+1000
          or ss_wholesale_cost between 48 and 48+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 0 and 0+10
          or ss_coupon_amt between 10925 and 10925+1000
          or ss_wholesale_cost between 2 and 2+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 102 and 102+10
          or ss_coupon_amt between 3285 and 3285+1000
          or ss_wholesale_cost between 53 and 53+20)) B6
limit 100;


