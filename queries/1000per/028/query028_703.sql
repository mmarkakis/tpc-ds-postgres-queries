
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 114 and 114+10 
             or ss_coupon_amt between 11522 and 11522+1000
             or ss_wholesale_cost between 2 and 2+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 134 and 134+10
          or ss_coupon_amt between 1656 and 1656+1000
          or ss_wholesale_cost between 3 and 3+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 13 and 13+10
          or ss_coupon_amt between 13218 and 13218+1000
          or ss_wholesale_cost between 16 and 16+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 94 and 94+10
          or ss_coupon_amt between 13810 and 13810+1000
          or ss_wholesale_cost between 10 and 10+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 140 and 140+10
          or ss_coupon_amt between 1813 and 1813+1000
          or ss_wholesale_cost between 8 and 8+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 147 and 147+10
          or ss_coupon_amt between 6694 and 6694+1000
          or ss_wholesale_cost between 56 and 56+20)) B6
limit 100;


