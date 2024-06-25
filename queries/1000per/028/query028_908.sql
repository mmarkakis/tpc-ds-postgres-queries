
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 96 and 96+10 
             or ss_coupon_amt between 2820 and 2820+1000
             or ss_wholesale_cost between 65 and 65+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 129 and 129+10
          or ss_coupon_amt between 7155 and 7155+1000
          or ss_wholesale_cost between 71 and 71+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 26 and 26+10
          or ss_coupon_amt between 11624 and 11624+1000
          or ss_wholesale_cost between 72 and 72+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 168 and 168+10
          or ss_coupon_amt between 12083 and 12083+1000
          or ss_wholesale_cost between 76 and 76+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 51 and 51+10
          or ss_coupon_amt between 5089 and 5089+1000
          or ss_wholesale_cost between 9 and 9+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 106 and 106+10
          or ss_coupon_amt between 16542 and 16542+1000
          or ss_wholesale_cost between 59 and 59+20)) B6
limit 100;


