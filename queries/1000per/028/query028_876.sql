
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 139 and 139+10 
             or ss_coupon_amt between 1403 and 1403+1000
             or ss_wholesale_cost between 34 and 34+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 107 and 107+10
          or ss_coupon_amt between 17539 and 17539+1000
          or ss_wholesale_cost between 74 and 74+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 183 and 183+10
          or ss_coupon_amt between 5252 and 5252+1000
          or ss_wholesale_cost between 6 and 6+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 184 and 184+10
          or ss_coupon_amt between 7764 and 7764+1000
          or ss_wholesale_cost between 56 and 56+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 140 and 140+10
          or ss_coupon_amt between 3765 and 3765+1000
          or ss_wholesale_cost between 14 and 14+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 50 and 50+10
          or ss_coupon_amt between 12764 and 12764+1000
          or ss_wholesale_cost between 51 and 51+20)) B6
limit 100;


