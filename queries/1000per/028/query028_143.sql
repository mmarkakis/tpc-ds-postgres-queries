
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 94 and 94+10 
             or ss_coupon_amt between 13174 and 13174+1000
             or ss_wholesale_cost between 47 and 47+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 102 and 102+10
          or ss_coupon_amt between 13613 and 13613+1000
          or ss_wholesale_cost between 1 and 1+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 16 and 16+10
          or ss_coupon_amt between 6443 and 6443+1000
          or ss_wholesale_cost between 11 and 11+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 144 and 144+10
          or ss_coupon_amt between 14324 and 14324+1000
          or ss_wholesale_cost between 42 and 42+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 99 and 99+10
          or ss_coupon_amt between 13796 and 13796+1000
          or ss_wholesale_cost between 39 and 39+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 91 and 91+10
          or ss_coupon_amt between 6756 and 6756+1000
          or ss_wholesale_cost between 36 and 36+20)) B6
limit 100;


