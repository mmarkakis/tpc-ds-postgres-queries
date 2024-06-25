
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 35 and 35+10 
             or ss_coupon_amt between 12004 and 12004+1000
             or ss_wholesale_cost between 73 and 73+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 1 and 1+10
          or ss_coupon_amt between 15504 and 15504+1000
          or ss_wholesale_cost between 17 and 17+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 131 and 131+10
          or ss_coupon_amt between 17906 and 17906+1000
          or ss_wholesale_cost between 26 and 26+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 18 and 18+10
          or ss_coupon_amt between 8680 and 8680+1000
          or ss_wholesale_cost between 51 and 51+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 68 and 68+10
          or ss_coupon_amt between 7670 and 7670+1000
          or ss_wholesale_cost between 76 and 76+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 22 and 22+10
          or ss_coupon_amt between 9141 and 9141+1000
          or ss_wholesale_cost between 18 and 18+20)) B6
limit 100;


