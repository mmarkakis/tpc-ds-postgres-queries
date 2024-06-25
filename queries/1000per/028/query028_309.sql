
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 61 and 61+10 
             or ss_coupon_amt between 1089 and 1089+1000
             or ss_wholesale_cost between 22 and 22+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 115 and 115+10
          or ss_coupon_amt between 16394 and 16394+1000
          or ss_wholesale_cost between 42 and 42+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 132 and 132+10
          or ss_coupon_amt between 1660 and 1660+1000
          or ss_wholesale_cost between 54 and 54+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 96 and 96+10
          or ss_coupon_amt between 3716 and 3716+1000
          or ss_wholesale_cost between 57 and 57+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 98 and 98+10
          or ss_coupon_amt between 6016 and 6016+1000
          or ss_wholesale_cost between 44 and 44+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 157 and 157+10
          or ss_coupon_amt between 15956 and 15956+1000
          or ss_wholesale_cost between 63 and 63+20)) B6
limit 100;


