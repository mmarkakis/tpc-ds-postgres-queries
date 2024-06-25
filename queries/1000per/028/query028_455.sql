
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 11 and 11+10 
             or ss_coupon_amt between 13466 and 13466+1000
             or ss_wholesale_cost between 19 and 19+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 148 and 148+10
          or ss_coupon_amt between 16798 and 16798+1000
          or ss_wholesale_cost between 70 and 70+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 154 and 154+10
          or ss_coupon_amt between 17172 and 17172+1000
          or ss_wholesale_cost between 32 and 32+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 66 and 66+10
          or ss_coupon_amt between 3825 and 3825+1000
          or ss_wholesale_cost between 72 and 72+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 62 and 62+10
          or ss_coupon_amt between 4205 and 4205+1000
          or ss_wholesale_cost between 13 and 13+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 171 and 171+10
          or ss_coupon_amt between 3228 and 3228+1000
          or ss_wholesale_cost between 38 and 38+20)) B6
limit 100;


