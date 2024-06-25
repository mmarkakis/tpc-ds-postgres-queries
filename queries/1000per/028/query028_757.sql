
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 162 and 162+10 
             or ss_coupon_amt between 13683 and 13683+1000
             or ss_wholesale_cost between 39 and 39+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 25 and 25+10
          or ss_coupon_amt between 17232 and 17232+1000
          or ss_wholesale_cost between 17 and 17+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 89 and 89+10
          or ss_coupon_amt between 436 and 436+1000
          or ss_wholesale_cost between 16 and 16+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 39 and 39+10
          or ss_coupon_amt between 5658 and 5658+1000
          or ss_wholesale_cost between 19 and 19+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 122 and 122+10
          or ss_coupon_amt between 13041 and 13041+1000
          or ss_wholesale_cost between 1 and 1+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 190 and 190+10
          or ss_coupon_amt between 5660 and 5660+1000
          or ss_wholesale_cost between 56 and 56+20)) B6
limit 100;


