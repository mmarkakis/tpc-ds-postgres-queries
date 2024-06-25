
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 137 and 137+10 
             or ss_coupon_amt between 13935 and 13935+1000
             or ss_wholesale_cost between 6 and 6+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 77 and 77+10
          or ss_coupon_amt between 2403 and 2403+1000
          or ss_wholesale_cost between 16 and 16+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 168 and 168+10
          or ss_coupon_amt between 27 and 27+1000
          or ss_wholesale_cost between 69 and 69+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 174 and 174+10
          or ss_coupon_amt between 9098 and 9098+1000
          or ss_wholesale_cost between 22 and 22+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 47 and 47+10
          or ss_coupon_amt between 5293 and 5293+1000
          or ss_wholesale_cost between 48 and 48+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 172 and 172+10
          or ss_coupon_amt between 12211 and 12211+1000
          or ss_wholesale_cost between 53 and 53+20)) B6
limit 100;


