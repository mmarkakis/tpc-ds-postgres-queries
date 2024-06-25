
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 166 and 166+10 
             or ss_coupon_amt between 14980 and 14980+1000
             or ss_wholesale_cost between 32 and 32+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 158 and 158+10
          or ss_coupon_amt between 1587 and 1587+1000
          or ss_wholesale_cost between 15 and 15+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 116 and 116+10
          or ss_coupon_amt between 15678 and 15678+1000
          or ss_wholesale_cost between 53 and 53+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 77 and 77+10
          or ss_coupon_amt between 13815 and 13815+1000
          or ss_wholesale_cost between 72 and 72+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 174 and 174+10
          or ss_coupon_amt between 9226 and 9226+1000
          or ss_wholesale_cost between 67 and 67+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 177 and 177+10
          or ss_coupon_amt between 14808 and 14808+1000
          or ss_wholesale_cost between 80 and 80+20)) B6
limit 100;


