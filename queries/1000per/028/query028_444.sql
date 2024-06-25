
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 187 and 187+10 
             or ss_coupon_amt between 17337 and 17337+1000
             or ss_wholesale_cost between 61 and 61+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 173 and 173+10
          or ss_coupon_amt between 11324 and 11324+1000
          or ss_wholesale_cost between 74 and 74+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 129 and 129+10
          or ss_coupon_amt between 17454 and 17454+1000
          or ss_wholesale_cost between 64 and 64+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 162 and 162+10
          or ss_coupon_amt between 11653 and 11653+1000
          or ss_wholesale_cost between 12 and 12+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 34 and 34+10
          or ss_coupon_amt between 4381 and 4381+1000
          or ss_wholesale_cost between 18 and 18+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 160 and 160+10
          or ss_coupon_amt between 15744 and 15744+1000
          or ss_wholesale_cost between 75 and 75+20)) B6
limit 100;


