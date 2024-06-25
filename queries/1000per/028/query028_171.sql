
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 144 and 144+10 
             or ss_coupon_amt between 17842 and 17842+1000
             or ss_wholesale_cost between 68 and 68+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 72 and 72+10
          or ss_coupon_amt between 11410 and 11410+1000
          or ss_wholesale_cost between 34 and 34+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 19 and 19+10
          or ss_coupon_amt between 8662 and 8662+1000
          or ss_wholesale_cost between 10 and 10+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 63 and 63+10
          or ss_coupon_amt between 7453 and 7453+1000
          or ss_wholesale_cost between 1 and 1+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 80 and 80+10
          or ss_coupon_amt between 12977 and 12977+1000
          or ss_wholesale_cost between 20 and 20+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 101 and 101+10
          or ss_coupon_amt between 3066 and 3066+1000
          or ss_wholesale_cost between 7 and 7+20)) B6
limit 100;


