
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 22 and 22+10 
             or ss_coupon_amt between 17821 and 17821+1000
             or ss_wholesale_cost between 48 and 48+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 112 and 112+10
          or ss_coupon_amt between 13426 and 13426+1000
          or ss_wholesale_cost between 73 and 73+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 66 and 66+10
          or ss_coupon_amt between 9499 and 9499+1000
          or ss_wholesale_cost between 59 and 59+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 143 and 143+10
          or ss_coupon_amt between 10692 and 10692+1000
          or ss_wholesale_cost between 13 and 13+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 117 and 117+10
          or ss_coupon_amt between 3894 and 3894+1000
          or ss_wholesale_cost between 7 and 7+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 38 and 38+10
          or ss_coupon_amt between 924 and 924+1000
          or ss_wholesale_cost between 56 and 56+20)) B6
limit 100;


