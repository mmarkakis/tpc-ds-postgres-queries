
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 9 and 9+10 
             or ss_coupon_amt between 1676 and 1676+1000
             or ss_wholesale_cost between 56 and 56+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 15 and 15+10
          or ss_coupon_amt between 3903 and 3903+1000
          or ss_wholesale_cost between 24 and 24+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 151 and 151+10
          or ss_coupon_amt between 10950 and 10950+1000
          or ss_wholesale_cost between 70 and 70+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 87 and 87+10
          or ss_coupon_amt between 7163 and 7163+1000
          or ss_wholesale_cost between 74 and 74+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 36 and 36+10
          or ss_coupon_amt between 2548 and 2548+1000
          or ss_wholesale_cost between 36 and 36+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 122 and 122+10
          or ss_coupon_amt between 11273 and 11273+1000
          or ss_wholesale_cost between 57 and 57+20)) B6
limit 100;


