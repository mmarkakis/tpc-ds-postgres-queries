
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 72 and 72+10 
             or ss_coupon_amt between 1928 and 1928+1000
             or ss_wholesale_cost between 31 and 31+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 65 and 65+10
          or ss_coupon_amt between 11299 and 11299+1000
          or ss_wholesale_cost between 38 and 38+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 116 and 116+10
          or ss_coupon_amt between 12705 and 12705+1000
          or ss_wholesale_cost between 53 and 53+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 42 and 42+10
          or ss_coupon_amt between 14469 and 14469+1000
          or ss_wholesale_cost between 44 and 44+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 16 and 16+10
          or ss_coupon_amt between 9392 and 9392+1000
          or ss_wholesale_cost between 19 and 19+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 119 and 119+10
          or ss_coupon_amt between 15156 and 15156+1000
          or ss_wholesale_cost between 14 and 14+20)) B6
limit 100;


