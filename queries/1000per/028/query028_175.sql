
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 164 and 164+10 
             or ss_coupon_amt between 16041 and 16041+1000
             or ss_wholesale_cost between 23 and 23+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 51 and 51+10
          or ss_coupon_amt between 7956 and 7956+1000
          or ss_wholesale_cost between 58 and 58+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 146 and 146+10
          or ss_coupon_amt between 14939 and 14939+1000
          or ss_wholesale_cost between 32 and 32+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 24 and 24+10
          or ss_coupon_amt between 4078 and 4078+1000
          or ss_wholesale_cost between 44 and 44+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 70 and 70+10
          or ss_coupon_amt between 12811 and 12811+1000
          or ss_wholesale_cost between 50 and 50+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 186 and 186+10
          or ss_coupon_amt between 2679 and 2679+1000
          or ss_wholesale_cost between 79 and 79+20)) B6
limit 100;


