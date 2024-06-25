
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 133 and 133+10 
             or ss_coupon_amt between 2541 and 2541+1000
             or ss_wholesale_cost between 75 and 75+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 2 and 2+10
          or ss_coupon_amt between 9342 and 9342+1000
          or ss_wholesale_cost between 8 and 8+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 177 and 177+10
          or ss_coupon_amt between 16379 and 16379+1000
          or ss_wholesale_cost between 24 and 24+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 158 and 158+10
          or ss_coupon_amt between 1876 and 1876+1000
          or ss_wholesale_cost between 73 and 73+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 135 and 135+10
          or ss_coupon_amt between 9378 and 9378+1000
          or ss_wholesale_cost between 16 and 16+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 51 and 51+10
          or ss_coupon_amt between 16468 and 16468+1000
          or ss_wholesale_cost between 62 and 62+20)) B6
limit 100;


