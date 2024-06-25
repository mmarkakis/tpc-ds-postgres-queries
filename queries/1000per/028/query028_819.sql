
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 102 and 102+10 
             or ss_coupon_amt between 6520 and 6520+1000
             or ss_wholesale_cost between 75 and 75+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 20 and 20+10
          or ss_coupon_amt between 7561 and 7561+1000
          or ss_wholesale_cost between 55 and 55+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 94 and 94+10
          or ss_coupon_amt between 15347 and 15347+1000
          or ss_wholesale_cost between 19 and 19+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 135 and 135+10
          or ss_coupon_amt between 7392 and 7392+1000
          or ss_wholesale_cost between 77 and 77+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 90 and 90+10
          or ss_coupon_amt between 3094 and 3094+1000
          or ss_wholesale_cost between 28 and 28+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 83 and 83+10
          or ss_coupon_amt between 4090 and 4090+1000
          or ss_wholesale_cost between 48 and 48+20)) B6
limit 100;


