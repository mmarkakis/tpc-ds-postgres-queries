
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 162 and 162+10 
             or ss_coupon_amt between 12390 and 12390+1000
             or ss_wholesale_cost between 12 and 12+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 181 and 181+10
          or ss_coupon_amt between 10492 and 10492+1000
          or ss_wholesale_cost between 16 and 16+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 124 and 124+10
          or ss_coupon_amt between 6954 and 6954+1000
          or ss_wholesale_cost between 2 and 2+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 165 and 165+10
          or ss_coupon_amt between 12652 and 12652+1000
          or ss_wholesale_cost between 26 and 26+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 132 and 132+10
          or ss_coupon_amt between 3504 and 3504+1000
          or ss_wholesale_cost between 43 and 43+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 116 and 116+10
          or ss_coupon_amt between 14767 and 14767+1000
          or ss_wholesale_cost between 6 and 6+20)) B6
limit 100;


