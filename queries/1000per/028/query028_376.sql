
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 90 and 90+10 
             or ss_coupon_amt between 1694 and 1694+1000
             or ss_wholesale_cost between 58 and 58+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 21 and 21+10
          or ss_coupon_amt between 3621 and 3621+1000
          or ss_wholesale_cost between 65 and 65+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 161 and 161+10
          or ss_coupon_amt between 11287 and 11287+1000
          or ss_wholesale_cost between 24 and 24+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 126 and 126+10
          or ss_coupon_amt between 14673 and 14673+1000
          or ss_wholesale_cost between 0 and 0+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 138 and 138+10
          or ss_coupon_amt between 12959 and 12959+1000
          or ss_wholesale_cost between 73 and 73+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 79 and 79+10
          or ss_coupon_amt between 11059 and 11059+1000
          or ss_wholesale_cost between 54 and 54+20)) B6
limit 100;


