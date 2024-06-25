
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 34 and 34+10 
             or ss_coupon_amt between 16956 and 16956+1000
             or ss_wholesale_cost between 39 and 39+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 120 and 120+10
          or ss_coupon_amt between 3964 and 3964+1000
          or ss_wholesale_cost between 12 and 12+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 135 and 135+10
          or ss_coupon_amt between 15687 and 15687+1000
          or ss_wholesale_cost between 66 and 66+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 90 and 90+10
          or ss_coupon_amt between 13272 and 13272+1000
          or ss_wholesale_cost between 16 and 16+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 187 and 187+10
          or ss_coupon_amt between 3974 and 3974+1000
          or ss_wholesale_cost between 58 and 58+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 85 and 85+10
          or ss_coupon_amt between 10443 and 10443+1000
          or ss_wholesale_cost between 9 and 9+20)) B6
limit 100;


