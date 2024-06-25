
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 176 and 176+10 
             or ss_coupon_amt between 5652 and 5652+1000
             or ss_wholesale_cost between 1 and 1+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 50 and 50+10
          or ss_coupon_amt between 16859 and 16859+1000
          or ss_wholesale_cost between 15 and 15+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 7 and 7+10
          or ss_coupon_amt between 5146 and 5146+1000
          or ss_wholesale_cost between 17 and 17+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 104 and 104+10
          or ss_coupon_amt between 1294 and 1294+1000
          or ss_wholesale_cost between 18 and 18+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 32 and 32+10
          or ss_coupon_amt between 1571 and 1571+1000
          or ss_wholesale_cost between 27 and 27+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 156 and 156+10
          or ss_coupon_amt between 123 and 123+1000
          or ss_wholesale_cost between 14 and 14+20)) B6
limit 100;


