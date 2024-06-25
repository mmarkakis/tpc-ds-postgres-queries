
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 72 and 72+10 
             or ss_coupon_amt between 10911 and 10911+1000
             or ss_wholesale_cost between 16 and 16+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 154 and 154+10
          or ss_coupon_amt between 7177 and 7177+1000
          or ss_wholesale_cost between 40 and 40+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 122 and 122+10
          or ss_coupon_amt between 11754 and 11754+1000
          or ss_wholesale_cost between 0 and 0+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 97 and 97+10
          or ss_coupon_amt between 5 and 5+1000
          or ss_wholesale_cost between 66 and 66+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 105 and 105+10
          or ss_coupon_amt between 4406 and 4406+1000
          or ss_wholesale_cost between 11 and 11+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 120 and 120+10
          or ss_coupon_amt between 441 and 441+1000
          or ss_wholesale_cost between 53 and 53+20)) B6
limit 100;


