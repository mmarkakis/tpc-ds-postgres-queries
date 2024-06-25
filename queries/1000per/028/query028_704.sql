
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 182 and 182+10 
             or ss_coupon_amt between 5860 and 5860+1000
             or ss_wholesale_cost between 17 and 17+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 126 and 126+10
          or ss_coupon_amt between 15009 and 15009+1000
          or ss_wholesale_cost between 61 and 61+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 133 and 133+10
          or ss_coupon_amt between 3037 and 3037+1000
          or ss_wholesale_cost between 79 and 79+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 104 and 104+10
          or ss_coupon_amt between 9278 and 9278+1000
          or ss_wholesale_cost between 63 and 63+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 127 and 127+10
          or ss_coupon_amt between 13423 and 13423+1000
          or ss_wholesale_cost between 18 and 18+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 17059 and 17059+1000
          or ss_wholesale_cost between 47 and 47+20)) B6
limit 100;


