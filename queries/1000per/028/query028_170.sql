
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 161 and 161+10 
             or ss_coupon_amt between 10731 and 10731+1000
             or ss_wholesale_cost between 47 and 47+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 83 and 83+10
          or ss_coupon_amt between 17728 and 17728+1000
          or ss_wholesale_cost between 32 and 32+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 92 and 92+10
          or ss_coupon_amt between 12489 and 12489+1000
          or ss_wholesale_cost between 61 and 61+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 144 and 144+10
          or ss_coupon_amt between 13712 and 13712+1000
          or ss_wholesale_cost between 12 and 12+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 11 and 11+10
          or ss_coupon_amt between 188 and 188+1000
          or ss_wholesale_cost between 65 and 65+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 12 and 12+10
          or ss_coupon_amt between 4898 and 4898+1000
          or ss_wholesale_cost between 76 and 76+20)) B6
limit 100;


