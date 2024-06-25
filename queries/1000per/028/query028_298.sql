
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 90 and 90+10 
             or ss_coupon_amt between 14466 and 14466+1000
             or ss_wholesale_cost between 28 and 28+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 138 and 138+10
          or ss_coupon_amt between 13220 and 13220+1000
          or ss_wholesale_cost between 66 and 66+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 2 and 2+10
          or ss_coupon_amt between 11594 and 11594+1000
          or ss_wholesale_cost between 68 and 68+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 51 and 51+10
          or ss_coupon_amt between 12394 and 12394+1000
          or ss_wholesale_cost between 39 and 39+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 68 and 68+10
          or ss_coupon_amt between 15672 and 15672+1000
          or ss_wholesale_cost between 71 and 71+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 154 and 154+10
          or ss_coupon_amt between 7835 and 7835+1000
          or ss_wholesale_cost between 46 and 46+20)) B6
limit 100;


