
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 0 and 0+10 
             or ss_coupon_amt between 16787 and 16787+1000
             or ss_wholesale_cost between 62 and 62+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 132 and 132+10
          or ss_coupon_amt between 9921 and 9921+1000
          or ss_wholesale_cost between 73 and 73+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 20 and 20+10
          or ss_coupon_amt between 2798 and 2798+1000
          or ss_wholesale_cost between 48 and 48+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 139 and 139+10
          or ss_coupon_amt between 2321 and 2321+1000
          or ss_wholesale_cost between 17 and 17+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 56 and 56+10
          or ss_coupon_amt between 12809 and 12809+1000
          or ss_wholesale_cost between 26 and 26+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 166 and 166+10
          or ss_coupon_amt between 246 and 246+1000
          or ss_wholesale_cost between 54 and 54+20)) B6
limit 100;


