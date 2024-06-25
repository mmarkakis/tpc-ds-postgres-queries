
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 68 and 68+10 
             or ss_coupon_amt between 878 and 878+1000
             or ss_wholesale_cost between 25 and 25+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 157 and 157+10
          or ss_coupon_amt between 17833 and 17833+1000
          or ss_wholesale_cost between 65 and 65+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 56 and 56+10
          or ss_coupon_amt between 2691 and 2691+1000
          or ss_wholesale_cost between 55 and 55+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 73 and 73+10
          or ss_coupon_amt between 16946 and 16946+1000
          or ss_wholesale_cost between 62 and 62+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 76 and 76+10
          or ss_coupon_amt between 15526 and 15526+1000
          or ss_wholesale_cost between 24 and 24+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 22 and 22+10
          or ss_coupon_amt between 15329 and 15329+1000
          or ss_wholesale_cost between 44 and 44+20)) B6
limit 100;


