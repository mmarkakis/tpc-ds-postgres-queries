
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 187 and 187+10 
             or ss_coupon_amt between 6149 and 6149+1000
             or ss_wholesale_cost between 16 and 16+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 49 and 49+10
          or ss_coupon_amt between 9791 and 9791+1000
          or ss_wholesale_cost between 63 and 63+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 174 and 174+10
          or ss_coupon_amt between 12426 and 12426+1000
          or ss_wholesale_cost between 17 and 17+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 172 and 172+10
          or ss_coupon_amt between 1186 and 1186+1000
          or ss_wholesale_cost between 49 and 49+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 81 and 81+10
          or ss_coupon_amt between 15021 and 15021+1000
          or ss_wholesale_cost between 11 and 11+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 98 and 98+10
          or ss_coupon_amt between 844 and 844+1000
          or ss_wholesale_cost between 15 and 15+20)) B6
limit 100;


