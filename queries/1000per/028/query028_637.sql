
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 51 and 51+10 
             or ss_coupon_amt between 16144 and 16144+1000
             or ss_wholesale_cost between 2 and 2+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 101 and 101+10
          or ss_coupon_amt between 6769 and 6769+1000
          or ss_wholesale_cost between 13 and 13+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 136 and 136+10
          or ss_coupon_amt between 13575 and 13575+1000
          or ss_wholesale_cost between 63 and 63+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 38 and 38+10
          or ss_coupon_amt between 8863 and 8863+1000
          or ss_wholesale_cost between 67 and 67+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 45 and 45+10
          or ss_coupon_amt between 14869 and 14869+1000
          or ss_wholesale_cost between 53 and 53+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 124 and 124+10
          or ss_coupon_amt between 14690 and 14690+1000
          or ss_wholesale_cost between 18 and 18+20)) B6
limit 100;


