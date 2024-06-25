
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 131 and 131+10 
             or ss_coupon_amt between 2133 and 2133+1000
             or ss_wholesale_cost between 2 and 2+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 79 and 79+10
          or ss_coupon_amt between 6515 and 6515+1000
          or ss_wholesale_cost between 77 and 77+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 156 and 156+10
          or ss_coupon_amt between 5772 and 5772+1000
          or ss_wholesale_cost between 69 and 69+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 9 and 9+10
          or ss_coupon_amt between 3230 and 3230+1000
          or ss_wholesale_cost between 29 and 29+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 98 and 98+10
          or ss_coupon_amt between 17143 and 17143+1000
          or ss_wholesale_cost between 45 and 45+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 29 and 29+10
          or ss_coupon_amt between 3643 and 3643+1000
          or ss_wholesale_cost between 39 and 39+20)) B6
limit 100;


