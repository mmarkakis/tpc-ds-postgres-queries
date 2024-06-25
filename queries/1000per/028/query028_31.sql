
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 107 and 107+10 
             or ss_coupon_amt between 17719 and 17719+1000
             or ss_wholesale_cost between 3 and 3+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 66 and 66+10
          or ss_coupon_amt between 14235 and 14235+1000
          or ss_wholesale_cost between 45 and 45+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 33 and 33+10
          or ss_coupon_amt between 4398 and 4398+1000
          or ss_wholesale_cost between 65 and 65+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 163 and 163+10
          or ss_coupon_amt between 10392 and 10392+1000
          or ss_wholesale_cost between 75 and 75+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 156 and 156+10
          or ss_coupon_amt between 9756 and 9756+1000
          or ss_wholesale_cost between 63 and 63+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 136 and 136+10
          or ss_coupon_amt between 8228 and 8228+1000
          or ss_wholesale_cost between 72 and 72+20)) B6
limit 100;


