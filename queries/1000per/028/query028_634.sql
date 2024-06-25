
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 175 and 175+10 
             or ss_coupon_amt between 12796 and 12796+1000
             or ss_wholesale_cost between 35 and 35+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 74 and 74+10
          or ss_coupon_amt between 6975 and 6975+1000
          or ss_wholesale_cost between 40 and 40+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 34 and 34+10
          or ss_coupon_amt between 11952 and 11952+1000
          or ss_wholesale_cost between 49 and 49+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 24 and 24+10
          or ss_coupon_amt between 14094 and 14094+1000
          or ss_wholesale_cost between 53 and 53+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 150 and 150+10
          or ss_coupon_amt between 12890 and 12890+1000
          or ss_wholesale_cost between 77 and 77+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 82 and 82+10
          or ss_coupon_amt between 4713 and 4713+1000
          or ss_wholesale_cost between 15 and 15+20)) B6
limit 100;


