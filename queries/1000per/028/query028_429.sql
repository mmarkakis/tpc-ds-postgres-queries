
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 57 and 57+10 
             or ss_coupon_amt between 11928 and 11928+1000
             or ss_wholesale_cost between 18 and 18+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 59 and 59+10
          or ss_coupon_amt between 3570 and 3570+1000
          or ss_wholesale_cost between 79 and 79+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 165 and 165+10
          or ss_coupon_amt between 15119 and 15119+1000
          or ss_wholesale_cost between 7 and 7+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 121 and 121+10
          or ss_coupon_amt between 4949 and 4949+1000
          or ss_wholesale_cost between 69 and 69+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 105 and 105+10
          or ss_coupon_amt between 1009 and 1009+1000
          or ss_wholesale_cost between 1 and 1+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 81 and 81+10
          or ss_coupon_amt between 5337 and 5337+1000
          or ss_wholesale_cost between 65 and 65+20)) B6
limit 100;


