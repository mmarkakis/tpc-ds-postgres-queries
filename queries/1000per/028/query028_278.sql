
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 65 and 65+10 
             or ss_coupon_amt between 9398 and 9398+1000
             or ss_wholesale_cost between 41 and 41+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 116 and 116+10
          or ss_coupon_amt between 1278 and 1278+1000
          or ss_wholesale_cost between 69 and 69+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 119 and 119+10
          or ss_coupon_amt between 14481 and 14481+1000
          or ss_wholesale_cost between 33 and 33+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 107 and 107+10
          or ss_coupon_amt between 17423 and 17423+1000
          or ss_wholesale_cost between 62 and 62+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 114 and 114+10
          or ss_coupon_amt between 5853 and 5853+1000
          or ss_wholesale_cost between 66 and 66+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 132 and 132+10
          or ss_coupon_amt between 11373 and 11373+1000
          or ss_wholesale_cost between 0 and 0+20)) B6
limit 100;


