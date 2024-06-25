
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 162 and 162+10 
             or ss_coupon_amt between 14819 and 14819+1000
             or ss_wholesale_cost between 57 and 57+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 97 and 97+10
          or ss_coupon_amt between 16685 and 16685+1000
          or ss_wholesale_cost between 9 and 9+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 125 and 125+10
          or ss_coupon_amt between 1223 and 1223+1000
          or ss_wholesale_cost between 1 and 1+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 161 and 161+10
          or ss_coupon_amt between 10520 and 10520+1000
          or ss_wholesale_cost between 5 and 5+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 65 and 65+10
          or ss_coupon_amt between 9833 and 9833+1000
          or ss_wholesale_cost between 3 and 3+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 107 and 107+10
          or ss_coupon_amt between 7986 and 7986+1000
          or ss_wholesale_cost between 30 and 30+20)) B6
limit 100;


