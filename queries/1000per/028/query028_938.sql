
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 122 and 122+10 
             or ss_coupon_amt between 2562 and 2562+1000
             or ss_wholesale_cost between 23 and 23+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 53 and 53+10
          or ss_coupon_amt between 15434 and 15434+1000
          or ss_wholesale_cost between 42 and 42+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 23 and 23+10
          or ss_coupon_amt between 16479 and 16479+1000
          or ss_wholesale_cost between 59 and 59+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 73 and 73+10
          or ss_coupon_amt between 15686 and 15686+1000
          or ss_wholesale_cost between 28 and 28+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 1674 and 1674+1000
          or ss_wholesale_cost between 30 and 30+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 111 and 111+10
          or ss_coupon_amt between 15738 and 15738+1000
          or ss_wholesale_cost between 5 and 5+20)) B6
limit 100;


