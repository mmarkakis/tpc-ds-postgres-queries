
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 86 and 86+10 
             or ss_coupon_amt between 16352 and 16352+1000
             or ss_wholesale_cost between 21 and 21+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 1 and 1+10
          or ss_coupon_amt between 6176 and 6176+1000
          or ss_wholesale_cost between 40 and 40+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 117 and 117+10
          or ss_coupon_amt between 12203 and 12203+1000
          or ss_wholesale_cost between 16 and 16+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 59 and 59+10
          or ss_coupon_amt between 14857 and 14857+1000
          or ss_wholesale_cost between 49 and 49+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 68 and 68+10
          or ss_coupon_amt between 7827 and 7827+1000
          or ss_wholesale_cost between 45 and 45+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 29 and 29+10
          or ss_coupon_amt between 16057 and 16057+1000
          or ss_wholesale_cost between 71 and 71+20)) B6
limit 100;


