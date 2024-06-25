
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 161 and 161+10 
             or ss_coupon_amt between 10051 and 10051+1000
             or ss_wholesale_cost between 32 and 32+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 153 and 153+10
          or ss_coupon_amt between 1711 and 1711+1000
          or ss_wholesale_cost between 14 and 14+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 55 and 55+10
          or ss_coupon_amt between 10555 and 10555+1000
          or ss_wholesale_cost between 49 and 49+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 12 and 12+10
          or ss_coupon_amt between 421 and 421+1000
          or ss_wholesale_cost between 45 and 45+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 162 and 162+10
          or ss_coupon_amt between 9216 and 9216+1000
          or ss_wholesale_cost between 78 and 78+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 35 and 35+10
          or ss_coupon_amt between 4572 and 4572+1000
          or ss_wholesale_cost between 12 and 12+20)) B6
limit 100;


