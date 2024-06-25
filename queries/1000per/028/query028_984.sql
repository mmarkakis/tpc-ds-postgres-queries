
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 97 and 97+10 
             or ss_coupon_amt between 8479 and 8479+1000
             or ss_wholesale_cost between 67 and 67+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 41 and 41+10
          or ss_coupon_amt between 3178 and 3178+1000
          or ss_wholesale_cost between 78 and 78+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 117 and 117+10
          or ss_coupon_amt between 11255 and 11255+1000
          or ss_wholesale_cost between 79 and 79+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 123 and 123+10
          or ss_coupon_amt between 9680 and 9680+1000
          or ss_wholesale_cost between 0 and 0+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 12 and 12+10
          or ss_coupon_amt between 9629 and 9629+1000
          or ss_wholesale_cost between 71 and 71+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 1 and 1+10
          or ss_coupon_amt between 5613 and 5613+1000
          or ss_wholesale_cost between 68 and 68+20)) B6
limit 100;


