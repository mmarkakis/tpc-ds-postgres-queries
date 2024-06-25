
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 138 and 138+10 
             or ss_coupon_amt between 5500 and 5500+1000
             or ss_wholesale_cost between 15 and 15+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 45 and 45+10
          or ss_coupon_amt between 3315 and 3315+1000
          or ss_wholesale_cost between 76 and 76+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 107 and 107+10
          or ss_coupon_amt between 4649 and 4649+1000
          or ss_wholesale_cost between 8 and 8+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 36 and 36+10
          or ss_coupon_amt between 6089 and 6089+1000
          or ss_wholesale_cost between 38 and 38+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 164 and 164+10
          or ss_coupon_amt between 17269 and 17269+1000
          or ss_wholesale_cost between 78 and 78+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 135 and 135+10
          or ss_coupon_amt between 820 and 820+1000
          or ss_wholesale_cost between 75 and 75+20)) B6
limit 100;


