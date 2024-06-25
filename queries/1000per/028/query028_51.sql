
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 140 and 140+10 
             or ss_coupon_amt between 9273 and 9273+1000
             or ss_wholesale_cost between 40 and 40+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 160 and 160+10
          or ss_coupon_amt between 13614 and 13614+1000
          or ss_wholesale_cost between 1 and 1+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 189 and 189+10
          or ss_coupon_amt between 9614 and 9614+1000
          or ss_wholesale_cost between 51 and 51+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 108 and 108+10
          or ss_coupon_amt between 12552 and 12552+1000
          or ss_wholesale_cost between 3 and 3+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 44 and 44+10
          or ss_coupon_amt between 14617 and 14617+1000
          or ss_wholesale_cost between 8 and 8+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 115 and 115+10
          or ss_coupon_amt between 2309 and 2309+1000
          or ss_wholesale_cost between 15 and 15+20)) B6
limit 100;


