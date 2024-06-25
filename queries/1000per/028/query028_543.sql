
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 6 and 6+10 
             or ss_coupon_amt between 7805 and 7805+1000
             or ss_wholesale_cost between 79 and 79+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 136 and 136+10
          or ss_coupon_amt between 7963 and 7963+1000
          or ss_wholesale_cost between 6 and 6+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 106 and 106+10
          or ss_coupon_amt between 7665 and 7665+1000
          or ss_wholesale_cost between 65 and 65+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 63 and 63+10
          or ss_coupon_amt between 16098 and 16098+1000
          or ss_wholesale_cost between 35 and 35+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 80 and 80+10
          or ss_coupon_amt between 6752 and 6752+1000
          or ss_wholesale_cost between 80 and 80+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 47 and 47+10
          or ss_coupon_amt between 5217 and 5217+1000
          or ss_wholesale_cost between 24 and 24+20)) B6
limit 100;


