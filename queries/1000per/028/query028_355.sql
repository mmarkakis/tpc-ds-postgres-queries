
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 44 and 44+10 
             or ss_coupon_amt between 12215 and 12215+1000
             or ss_wholesale_cost between 62 and 62+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 124 and 124+10
          or ss_coupon_amt between 4042 and 4042+1000
          or ss_wholesale_cost between 18 and 18+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 77 and 77+10
          or ss_coupon_amt between 16583 and 16583+1000
          or ss_wholesale_cost between 33 and 33+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 127 and 127+10
          or ss_coupon_amt between 2765 and 2765+1000
          or ss_wholesale_cost between 58 and 58+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 106 and 106+10
          or ss_coupon_amt between 4342 and 4342+1000
          or ss_wholesale_cost between 63 and 63+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 182 and 182+10
          or ss_coupon_amt between 12529 and 12529+1000
          or ss_wholesale_cost between 5 and 5+20)) B6
limit 100;


