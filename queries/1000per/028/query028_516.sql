
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 8 and 8+10 
             or ss_coupon_amt between 17532 and 17532+1000
             or ss_wholesale_cost between 74 and 74+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 81 and 81+10
          or ss_coupon_amt between 12413 and 12413+1000
          or ss_wholesale_cost between 63 and 63+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 33 and 33+10
          or ss_coupon_amt between 17439 and 17439+1000
          or ss_wholesale_cost between 39 and 39+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 34 and 34+10
          or ss_coupon_amt between 11476 and 11476+1000
          or ss_wholesale_cost between 6 and 6+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 120 and 120+10
          or ss_coupon_amt between 3173 and 3173+1000
          or ss_wholesale_cost between 75 and 75+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 82 and 82+10
          or ss_coupon_amt between 5170 and 5170+1000
          or ss_wholesale_cost between 4 and 4+20)) B6
limit 100;


