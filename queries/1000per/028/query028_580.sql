
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 174 and 174+10 
             or ss_coupon_amt between 16162 and 16162+1000
             or ss_wholesale_cost between 15 and 15+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 51 and 51+10
          or ss_coupon_amt between 2742 and 2742+1000
          or ss_wholesale_cost between 5 and 5+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 170 and 170+10
          or ss_coupon_amt between 13434 and 13434+1000
          or ss_wholesale_cost between 30 and 30+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 14608 and 14608+1000
          or ss_wholesale_cost between 69 and 69+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 44 and 44+10
          or ss_coupon_amt between 9438 and 9438+1000
          or ss_wholesale_cost between 60 and 60+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 162 and 162+10
          or ss_coupon_amt between 7187 and 7187+1000
          or ss_wholesale_cost between 66 and 66+20)) B6
limit 100;


