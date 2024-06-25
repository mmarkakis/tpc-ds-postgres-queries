
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 71 and 71+10 
             or ss_coupon_amt between 5989 and 5989+1000
             or ss_wholesale_cost between 8 and 8+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 88 and 88+10
          or ss_coupon_amt between 1730 and 1730+1000
          or ss_wholesale_cost between 34 and 34+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 65 and 65+10
          or ss_coupon_amt between 17237 and 17237+1000
          or ss_wholesale_cost between 64 and 64+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 151 and 151+10
          or ss_coupon_amt between 7644 and 7644+1000
          or ss_wholesale_cost between 56 and 56+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 106 and 106+10
          or ss_coupon_amt between 16245 and 16245+1000
          or ss_wholesale_cost between 35 and 35+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 83 and 83+10
          or ss_coupon_amt between 13506 and 13506+1000
          or ss_wholesale_cost between 74 and 74+20)) B6
limit 100;


