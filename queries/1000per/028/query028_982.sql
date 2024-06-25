
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 117 and 117+10 
             or ss_coupon_amt between 7203 and 7203+1000
             or ss_wholesale_cost between 80 and 80+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 108 and 108+10
          or ss_coupon_amt between 13646 and 13646+1000
          or ss_wholesale_cost between 75 and 75+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 66 and 66+10
          or ss_coupon_amt between 17052 and 17052+1000
          or ss_wholesale_cost between 26 and 26+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 48 and 48+10
          or ss_coupon_amt between 16513 and 16513+1000
          or ss_wholesale_cost between 0 and 0+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 173 and 173+10
          or ss_coupon_amt between 6815 and 6815+1000
          or ss_wholesale_cost between 46 and 46+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 146 and 146+10
          or ss_coupon_amt between 11684 and 11684+1000
          or ss_wholesale_cost between 11 and 11+20)) B6
limit 100;


