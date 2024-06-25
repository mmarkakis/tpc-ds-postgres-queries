
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 136 and 136+10 
             or ss_coupon_amt between 16608 and 16608+1000
             or ss_wholesale_cost between 42 and 42+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 150 and 150+10
          or ss_coupon_amt between 6530 and 6530+1000
          or ss_wholesale_cost between 26 and 26+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 117 and 117+10
          or ss_coupon_amt between 11520 and 11520+1000
          or ss_wholesale_cost between 67 and 67+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 66 and 66+10
          or ss_coupon_amt between 15769 and 15769+1000
          or ss_wholesale_cost between 41 and 41+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 173 and 173+10
          or ss_coupon_amt between 8439 and 8439+1000
          or ss_wholesale_cost between 15 and 15+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 147 and 147+10
          or ss_coupon_amt between 14652 and 14652+1000
          or ss_wholesale_cost between 58 and 58+20)) B6
limit 100;


