
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 94 and 94+10 
             or ss_coupon_amt between 5731 and 5731+1000
             or ss_wholesale_cost between 76 and 76+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 160 and 160+10
          or ss_coupon_amt between 4886 and 4886+1000
          or ss_wholesale_cost between 47 and 47+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 176 and 176+10
          or ss_coupon_amt between 5284 and 5284+1000
          or ss_wholesale_cost between 71 and 71+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 117 and 117+10
          or ss_coupon_amt between 6678 and 6678+1000
          or ss_wholesale_cost between 34 and 34+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 112 and 112+10
          or ss_coupon_amt between 6295 and 6295+1000
          or ss_wholesale_cost between 4 and 4+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 59 and 59+10
          or ss_coupon_amt between 17112 and 17112+1000
          or ss_wholesale_cost between 0 and 0+20)) B6
limit 100;


