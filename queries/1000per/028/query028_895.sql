
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 143 and 143+10 
             or ss_coupon_amt between 15018 and 15018+1000
             or ss_wholesale_cost between 62 and 62+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 88 and 88+10
          or ss_coupon_amt between 3451 and 3451+1000
          or ss_wholesale_cost between 9 and 9+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 44 and 44+10
          or ss_coupon_amt between 5483 and 5483+1000
          or ss_wholesale_cost between 73 and 73+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 55 and 55+10
          or ss_coupon_amt between 16886 and 16886+1000
          or ss_wholesale_cost between 75 and 75+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 103 and 103+10
          or ss_coupon_amt between 16988 and 16988+1000
          or ss_wholesale_cost between 72 and 72+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 31 and 31+10
          or ss_coupon_amt between 6328 and 6328+1000
          or ss_wholesale_cost between 19 and 19+20)) B6
limit 100;


