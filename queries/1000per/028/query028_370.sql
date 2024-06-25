
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 156 and 156+10 
             or ss_coupon_amt between 7219 and 7219+1000
             or ss_wholesale_cost between 9 and 9+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 61 and 61+10
          or ss_coupon_amt between 7772 and 7772+1000
          or ss_wholesale_cost between 19 and 19+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 87 and 87+10
          or ss_coupon_amt between 14362 and 14362+1000
          or ss_wholesale_cost between 67 and 67+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 139 and 139+10
          or ss_coupon_amt between 17667 and 17667+1000
          or ss_wholesale_cost between 53 and 53+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 105 and 105+10
          or ss_coupon_amt between 10703 and 10703+1000
          or ss_wholesale_cost between 58 and 58+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 26 and 26+10
          or ss_coupon_amt between 8924 and 8924+1000
          or ss_wholesale_cost between 60 and 60+20)) B6
limit 100;


