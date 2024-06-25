
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 147 and 147+10 
             or ss_coupon_amt between 7379 and 7379+1000
             or ss_wholesale_cost between 0 and 0+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 111 and 111+10
          or ss_coupon_amt between 94 and 94+1000
          or ss_wholesale_cost between 71 and 71+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 83 and 83+10
          or ss_coupon_amt between 7580 and 7580+1000
          or ss_wholesale_cost between 15 and 15+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 88 and 88+10
          or ss_coupon_amt between 10787 and 10787+1000
          or ss_wholesale_cost between 66 and 66+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 161 and 161+10
          or ss_coupon_amt between 9583 and 9583+1000
          or ss_wholesale_cost between 41 and 41+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 10 and 10+10
          or ss_coupon_amt between 12911 and 12911+1000
          or ss_wholesale_cost between 3 and 3+20)) B6
limit 100;


