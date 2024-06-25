
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 187 and 187+10 
             or ss_coupon_amt between 17961 and 17961+1000
             or ss_wholesale_cost between 27 and 27+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 89 and 89+10
          or ss_coupon_amt between 10658 and 10658+1000
          or ss_wholesale_cost between 80 and 80+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 9 and 9+10
          or ss_coupon_amt between 11815 and 11815+1000
          or ss_wholesale_cost between 39 and 39+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 55 and 55+10
          or ss_coupon_amt between 11699 and 11699+1000
          or ss_wholesale_cost between 64 and 64+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 94 and 94+10
          or ss_coupon_amt between 1961 and 1961+1000
          or ss_wholesale_cost between 48 and 48+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 51 and 51+10
          or ss_coupon_amt between 6470 and 6470+1000
          or ss_wholesale_cost between 66 and 66+20)) B6
limit 100;


