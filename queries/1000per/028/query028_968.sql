
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 28 and 28+10 
             or ss_coupon_amt between 17856 and 17856+1000
             or ss_wholesale_cost between 80 and 80+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 16 and 16+10
          or ss_coupon_amt between 17121 and 17121+1000
          or ss_wholesale_cost between 36 and 36+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 133 and 133+10
          or ss_coupon_amt between 2055 and 2055+1000
          or ss_wholesale_cost between 65 and 65+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 65 and 65+10
          or ss_coupon_amt between 752 and 752+1000
          or ss_wholesale_cost between 0 and 0+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 166 and 166+10
          or ss_coupon_amt between 14959 and 14959+1000
          or ss_wholesale_cost between 39 and 39+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 0 and 0+10
          or ss_coupon_amt between 11793 and 11793+1000
          or ss_wholesale_cost between 24 and 24+20)) B6
limit 100;


