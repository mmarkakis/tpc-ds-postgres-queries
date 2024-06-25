
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 2 and 2+10 
             or ss_coupon_amt between 14226 and 14226+1000
             or ss_wholesale_cost between 16 and 16+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 136 and 136+10
          or ss_coupon_amt between 1415 and 1415+1000
          or ss_wholesale_cost between 17 and 17+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 81 and 81+10
          or ss_coupon_amt between 1930 and 1930+1000
          or ss_wholesale_cost between 44 and 44+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 63 and 63+10
          or ss_coupon_amt between 15797 and 15797+1000
          or ss_wholesale_cost between 31 and 31+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 129 and 129+10
          or ss_coupon_amt between 4731 and 4731+1000
          or ss_wholesale_cost between 76 and 76+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 34 and 34+10
          or ss_coupon_amt between 14128 and 14128+1000
          or ss_wholesale_cost between 7 and 7+20)) B6
limit 100;


