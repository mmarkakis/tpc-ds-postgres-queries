
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 139 and 139+10 
             or ss_coupon_amt between 15375 and 15375+1000
             or ss_wholesale_cost between 30 and 30+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 38 and 38+10
          or ss_coupon_amt between 9854 and 9854+1000
          or ss_wholesale_cost between 40 and 40+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 109 and 109+10
          or ss_coupon_amt between 6520 and 6520+1000
          or ss_wholesale_cost between 63 and 63+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 149 and 149+10
          or ss_coupon_amt between 8399 and 8399+1000
          or ss_wholesale_cost between 16 and 16+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 169 and 169+10
          or ss_coupon_amt between 16953 and 16953+1000
          or ss_wholesale_cost between 11 and 11+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 183 and 183+10
          or ss_coupon_amt between 15467 and 15467+1000
          or ss_wholesale_cost between 22 and 22+20)) B6
limit 100;


