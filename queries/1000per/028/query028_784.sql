
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 48 and 48+10 
             or ss_coupon_amt between 12916 and 12916+1000
             or ss_wholesale_cost between 57 and 57+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 83 and 83+10
          or ss_coupon_amt between 12192 and 12192+1000
          or ss_wholesale_cost between 5 and 5+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 29 and 29+10
          or ss_coupon_amt between 13010 and 13010+1000
          or ss_wholesale_cost between 6 and 6+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 21 and 21+10
          or ss_coupon_amt between 12267 and 12267+1000
          or ss_wholesale_cost between 69 and 69+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 28 and 28+10
          or ss_coupon_amt between 12126 and 12126+1000
          or ss_wholesale_cost between 3 and 3+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 182 and 182+10
          or ss_coupon_amt between 1480 and 1480+1000
          or ss_wholesale_cost between 19 and 19+20)) B6
limit 100;


