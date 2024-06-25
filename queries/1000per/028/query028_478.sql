
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 168 and 168+10 
             or ss_coupon_amt between 10872 and 10872+1000
             or ss_wholesale_cost between 34 and 34+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 26 and 26+10
          or ss_coupon_amt between 2183 and 2183+1000
          or ss_wholesale_cost between 28 and 28+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 15 and 15+10
          or ss_coupon_amt between 11920 and 11920+1000
          or ss_wholesale_cost between 38 and 38+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 180 and 180+10
          or ss_coupon_amt between 10789 and 10789+1000
          or ss_wholesale_cost between 21 and 21+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 1 and 1+10
          or ss_coupon_amt between 6879 and 6879+1000
          or ss_wholesale_cost between 6 and 6+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 142 and 142+10
          or ss_coupon_amt between 9036 and 9036+1000
          or ss_wholesale_cost between 29 and 29+20)) B6
limit 100;


