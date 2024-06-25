
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 149 and 149+10 
             or ss_coupon_amt between 11164 and 11164+1000
             or ss_wholesale_cost between 72 and 72+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 136 and 136+10
          or ss_coupon_amt between 2497 and 2497+1000
          or ss_wholesale_cost between 66 and 66+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 184 and 184+10
          or ss_coupon_amt between 13033 and 13033+1000
          or ss_wholesale_cost between 36 and 36+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 180 and 180+10
          or ss_coupon_amt between 17149 and 17149+1000
          or ss_wholesale_cost between 14 and 14+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 96 and 96+10
          or ss_coupon_amt between 14535 and 14535+1000
          or ss_wholesale_cost between 71 and 71+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 153 and 153+10
          or ss_coupon_amt between 4840 and 4840+1000
          or ss_wholesale_cost between 73 and 73+20)) B6
limit 100;


