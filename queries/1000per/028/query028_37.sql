
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 143 and 143+10 
             or ss_coupon_amt between 4272 and 4272+1000
             or ss_wholesale_cost between 24 and 24+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 18 and 18+10
          or ss_coupon_amt between 2541 and 2541+1000
          or ss_wholesale_cost between 72 and 72+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 134 and 134+10
          or ss_coupon_amt between 6854 and 6854+1000
          or ss_wholesale_cost between 22 and 22+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 118 and 118+10
          or ss_coupon_amt between 10637 and 10637+1000
          or ss_wholesale_cost between 20 and 20+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 29 and 29+10
          or ss_coupon_amt between 4487 and 4487+1000
          or ss_wholesale_cost between 27 and 27+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 167 and 167+10
          or ss_coupon_amt between 8499 and 8499+1000
          or ss_wholesale_cost between 26 and 26+20)) B6
limit 100;


