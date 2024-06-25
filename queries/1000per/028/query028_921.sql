
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 43 and 43+10 
             or ss_coupon_amt between 866 and 866+1000
             or ss_wholesale_cost between 10 and 10+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 27 and 27+10
          or ss_coupon_amt between 13919 and 13919+1000
          or ss_wholesale_cost between 33 and 33+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 105 and 105+10
          or ss_coupon_amt between 72 and 72+1000
          or ss_wholesale_cost between 15 and 15+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 136 and 136+10
          or ss_coupon_amt between 15899 and 15899+1000
          or ss_wholesale_cost between 32 and 32+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 15 and 15+10
          or ss_coupon_amt between 12014 and 12014+1000
          or ss_wholesale_cost between 37 and 37+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 173 and 173+10
          or ss_coupon_amt between 14299 and 14299+1000
          or ss_wholesale_cost between 18 and 18+20)) B6
limit 100;


