
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 20 and 20+10 
             or ss_coupon_amt between 16068 and 16068+1000
             or ss_wholesale_cost between 38 and 38+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 42 and 42+10
          or ss_coupon_amt between 11128 and 11128+1000
          or ss_wholesale_cost between 33 and 33+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 180 and 180+10
          or ss_coupon_amt between 5472 and 5472+1000
          or ss_wholesale_cost between 14 and 14+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 128 and 128+10
          or ss_coupon_amt between 14926 and 14926+1000
          or ss_wholesale_cost between 72 and 72+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 55 and 55+10
          or ss_coupon_amt between 4149 and 4149+1000
          or ss_wholesale_cost between 54 and 54+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 125 and 125+10
          or ss_coupon_amt between 3407 and 3407+1000
          or ss_wholesale_cost between 22 and 22+20)) B6
limit 100;


