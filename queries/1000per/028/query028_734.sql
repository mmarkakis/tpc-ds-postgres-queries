
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 122 and 122+10 
             or ss_coupon_amt between 10286 and 10286+1000
             or ss_wholesale_cost between 1 and 1+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 128 and 128+10
          or ss_coupon_amt between 11553 and 11553+1000
          or ss_wholesale_cost between 42 and 42+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 63 and 63+10
          or ss_coupon_amt between 2939 and 2939+1000
          or ss_wholesale_cost between 59 and 59+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 77 and 77+10
          or ss_coupon_amt between 3957 and 3957+1000
          or ss_wholesale_cost between 19 and 19+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 47 and 47+10
          or ss_coupon_amt between 1830 and 1830+1000
          or ss_wholesale_cost between 4 and 4+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 133 and 133+10
          or ss_coupon_amt between 1835 and 1835+1000
          or ss_wholesale_cost between 76 and 76+20)) B6
limit 100;


