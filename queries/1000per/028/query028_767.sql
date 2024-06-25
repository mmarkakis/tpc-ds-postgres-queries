
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 166 and 166+10 
             or ss_coupon_amt between 4213 and 4213+1000
             or ss_wholesale_cost between 15 and 15+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 57 and 57+10
          or ss_coupon_amt between 11168 and 11168+1000
          or ss_wholesale_cost between 75 and 75+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 122 and 122+10
          or ss_coupon_amt between 12729 and 12729+1000
          or ss_wholesale_cost between 12 and 12+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 179 and 179+10
          or ss_coupon_amt between 5004 and 5004+1000
          or ss_wholesale_cost between 71 and 71+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 64 and 64+10
          or ss_coupon_amt between 17362 and 17362+1000
          or ss_wholesale_cost between 52 and 52+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 31 and 31+10
          or ss_coupon_amt between 13330 and 13330+1000
          or ss_wholesale_cost between 25 and 25+20)) B6
limit 100;


