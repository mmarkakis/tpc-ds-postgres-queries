
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 164 and 164+10 
             or ss_coupon_amt between 13362 and 13362+1000
             or ss_wholesale_cost between 58 and 58+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 113 and 113+10
          or ss_coupon_amt between 14263 and 14263+1000
          or ss_wholesale_cost between 4 and 4+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 122 and 122+10
          or ss_coupon_amt between 430 and 430+1000
          or ss_wholesale_cost between 57 and 57+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 109 and 109+10
          or ss_coupon_amt between 17047 and 17047+1000
          or ss_wholesale_cost between 37 and 37+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 183 and 183+10
          or ss_coupon_amt between 3120 and 3120+1000
          or ss_wholesale_cost between 12 and 12+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 81 and 81+10
          or ss_coupon_amt between 16347 and 16347+1000
          or ss_wholesale_cost between 45 and 45+20)) B6
limit 100;


