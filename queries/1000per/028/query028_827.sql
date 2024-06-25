
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 80 and 80+10 
             or ss_coupon_amt between 13553 and 13553+1000
             or ss_wholesale_cost between 71 and 71+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 105 and 105+10
          or ss_coupon_amt between 5015 and 5015+1000
          or ss_wholesale_cost between 39 and 39+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 90 and 90+10
          or ss_coupon_amt between 8965 and 8965+1000
          or ss_wholesale_cost between 48 and 48+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 165 and 165+10
          or ss_coupon_amt between 705 and 705+1000
          or ss_wholesale_cost between 68 and 68+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 120 and 120+10
          or ss_coupon_amt between 12904 and 12904+1000
          or ss_wholesale_cost between 7 and 7+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 72 and 72+10
          or ss_coupon_amt between 7205 and 7205+1000
          or ss_wholesale_cost between 13 and 13+20)) B6
limit 100;


