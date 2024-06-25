
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 4 and 4+10 
             or ss_coupon_amt between 17759 and 17759+1000
             or ss_wholesale_cost between 80 and 80+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 179 and 179+10
          or ss_coupon_amt between 5472 and 5472+1000
          or ss_wholesale_cost between 12 and 12+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 70 and 70+10
          or ss_coupon_amt between 9291 and 9291+1000
          or ss_wholesale_cost between 72 and 72+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 72 and 72+10
          or ss_coupon_amt between 10063 and 10063+1000
          or ss_wholesale_cost between 62 and 62+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 11923 and 11923+1000
          or ss_wholesale_cost between 45 and 45+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 89 and 89+10
          or ss_coupon_amt between 4649 and 4649+1000
          or ss_wholesale_cost between 25 and 25+20)) B6
limit 100;


