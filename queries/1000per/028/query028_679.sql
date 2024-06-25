
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 20 and 20+10 
             or ss_coupon_amt between 7479 and 7479+1000
             or ss_wholesale_cost between 5 and 5+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 149 and 149+10
          or ss_coupon_amt between 5908 and 5908+1000
          or ss_wholesale_cost between 10 and 10+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 174 and 174+10
          or ss_coupon_amt between 4866 and 4866+1000
          or ss_wholesale_cost between 1 and 1+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 128 and 128+10
          or ss_coupon_amt between 11588 and 11588+1000
          or ss_wholesale_cost between 77 and 77+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 50 and 50+10
          or ss_coupon_amt between 6722 and 6722+1000
          or ss_wholesale_cost between 15 and 15+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 80 and 80+10
          or ss_coupon_amt between 17150 and 17150+1000
          or ss_wholesale_cost between 58 and 58+20)) B6
limit 100;


