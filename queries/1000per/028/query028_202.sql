
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 120 and 120+10 
             or ss_coupon_amt between 2408 and 2408+1000
             or ss_wholesale_cost between 7 and 7+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 33 and 33+10
          or ss_coupon_amt between 8389 and 8389+1000
          or ss_wholesale_cost between 73 and 73+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 142 and 142+10
          or ss_coupon_amt between 3904 and 3904+1000
          or ss_wholesale_cost between 31 and 31+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 10 and 10+10
          or ss_coupon_amt between 111 and 111+1000
          or ss_wholesale_cost between 19 and 19+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 87 and 87+10
          or ss_coupon_amt between 7637 and 7637+1000
          or ss_wholesale_cost between 22 and 22+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 138 and 138+10
          or ss_coupon_amt between 16927 and 16927+1000
          or ss_wholesale_cost between 12 and 12+20)) B6
limit 100;


