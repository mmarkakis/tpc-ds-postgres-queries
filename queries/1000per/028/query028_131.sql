
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 129 and 129+10 
             or ss_coupon_amt between 12404 and 12404+1000
             or ss_wholesale_cost between 67 and 67+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 147 and 147+10
          or ss_coupon_amt between 2513 and 2513+1000
          or ss_wholesale_cost between 32 and 32+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 105 and 105+10
          or ss_coupon_amt between 10883 and 10883+1000
          or ss_wholesale_cost between 21 and 21+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 88 and 88+10
          or ss_coupon_amt between 12574 and 12574+1000
          or ss_wholesale_cost between 62 and 62+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 126 and 126+10
          or ss_coupon_amt between 16113 and 16113+1000
          or ss_wholesale_cost between 66 and 66+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 124 and 124+10
          or ss_coupon_amt between 11935 and 11935+1000
          or ss_wholesale_cost between 4 and 4+20)) B6
limit 100;


