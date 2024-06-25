
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 189 and 189+10 
             or ss_coupon_amt between 8306 and 8306+1000
             or ss_wholesale_cost between 36 and 36+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 41 and 41+10
          or ss_coupon_amt between 2417 and 2417+1000
          or ss_wholesale_cost between 50 and 50+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 49 and 49+10
          or ss_coupon_amt between 5419 and 5419+1000
          or ss_wholesale_cost between 8 and 8+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 179 and 179+10
          or ss_coupon_amt between 11723 and 11723+1000
          or ss_wholesale_cost between 15 and 15+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 77 and 77+10
          or ss_coupon_amt between 4779 and 4779+1000
          or ss_wholesale_cost between 44 and 44+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 131 and 131+10
          or ss_coupon_amt between 17662 and 17662+1000
          or ss_wholesale_cost between 67 and 67+20)) B6
limit 100;


