
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 135 and 135+10 
             or ss_coupon_amt between 13007 and 13007+1000
             or ss_wholesale_cost between 77 and 77+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 126 and 126+10
          or ss_coupon_amt between 14547 and 14547+1000
          or ss_wholesale_cost between 49 and 49+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 173 and 173+10
          or ss_coupon_amt between 4406 and 4406+1000
          or ss_wholesale_cost between 44 and 44+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 28 and 28+10
          or ss_coupon_amt between 17572 and 17572+1000
          or ss_wholesale_cost between 50 and 50+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 8 and 8+10
          or ss_coupon_amt between 6650 and 6650+1000
          or ss_wholesale_cost between 11 and 11+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 174 and 174+10
          or ss_coupon_amt between 13841 and 13841+1000
          or ss_wholesale_cost between 55 and 55+20)) B6
limit 100;


