
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 14 and 14+10 
             or ss_coupon_amt between 10686 and 10686+1000
             or ss_wholesale_cost between 64 and 64+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 50 and 50+10
          or ss_coupon_amt between 13156 and 13156+1000
          or ss_wholesale_cost between 70 and 70+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 73 and 73+10
          or ss_coupon_amt between 1880 and 1880+1000
          or ss_wholesale_cost between 29 and 29+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 161 and 161+10
          or ss_coupon_amt between 13439 and 13439+1000
          or ss_wholesale_cost between 65 and 65+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 148 and 148+10
          or ss_coupon_amt between 2045 and 2045+1000
          or ss_wholesale_cost between 46 and 46+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 66 and 66+10
          or ss_coupon_amt between 11802 and 11802+1000
          or ss_wholesale_cost between 41 and 41+20)) B6
limit 100;


