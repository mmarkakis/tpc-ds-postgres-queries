
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 187 and 187+10 
             or ss_coupon_amt between 5468 and 5468+1000
             or ss_wholesale_cost between 73 and 73+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 184 and 184+10
          or ss_coupon_amt between 12156 and 12156+1000
          or ss_wholesale_cost between 5 and 5+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 90 and 90+10
          or ss_coupon_amt between 16260 and 16260+1000
          or ss_wholesale_cost between 14 and 14+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 111 and 111+10
          or ss_coupon_amt between 13372 and 13372+1000
          or ss_wholesale_cost between 27 and 27+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 102 and 102+10
          or ss_coupon_amt between 7753 and 7753+1000
          or ss_wholesale_cost between 33 and 33+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 115 and 115+10
          or ss_coupon_amt between 9636 and 9636+1000
          or ss_wholesale_cost between 77 and 77+20)) B6
limit 100;


