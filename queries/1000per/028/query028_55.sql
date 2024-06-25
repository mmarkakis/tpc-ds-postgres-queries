
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 49 and 49+10 
             or ss_coupon_amt between 7731 and 7731+1000
             or ss_wholesale_cost between 21 and 21+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 121 and 121+10
          or ss_coupon_amt between 13824 and 13824+1000
          or ss_wholesale_cost between 20 and 20+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 89 and 89+10
          or ss_coupon_amt between 6964 and 6964+1000
          or ss_wholesale_cost between 69 and 69+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 40 and 40+10
          or ss_coupon_amt between 8380 and 8380+1000
          or ss_wholesale_cost between 26 and 26+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 125 and 125+10
          or ss_coupon_amt between 13201 and 13201+1000
          or ss_wholesale_cost between 38 and 38+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 54 and 54+10
          or ss_coupon_amt between 1535 and 1535+1000
          or ss_wholesale_cost between 67 and 67+20)) B6
limit 100;


