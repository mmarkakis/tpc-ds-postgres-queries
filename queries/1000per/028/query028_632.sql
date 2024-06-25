
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 6 and 6+10 
             or ss_coupon_amt between 7954 and 7954+1000
             or ss_wholesale_cost between 7 and 7+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 76 and 76+10
          or ss_coupon_amt between 4550 and 4550+1000
          or ss_wholesale_cost between 52 and 52+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 167 and 167+10
          or ss_coupon_amt between 5059 and 5059+1000
          or ss_wholesale_cost between 34 and 34+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 13 and 13+10
          or ss_coupon_amt between 4252 and 4252+1000
          or ss_wholesale_cost between 25 and 25+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 52 and 52+10
          or ss_coupon_amt between 17414 and 17414+1000
          or ss_wholesale_cost between 69 and 69+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 119 and 119+10
          or ss_coupon_amt between 14693 and 14693+1000
          or ss_wholesale_cost between 18 and 18+20)) B6
limit 100;


