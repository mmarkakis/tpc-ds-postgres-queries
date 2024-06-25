
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 33 and 33+10 
             or ss_coupon_amt between 3750 and 3750+1000
             or ss_wholesale_cost between 19 and 19+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 74 and 74+10
          or ss_coupon_amt between 1017 and 1017+1000
          or ss_wholesale_cost between 53 and 53+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 100 and 100+10
          or ss_coupon_amt between 3621 and 3621+1000
          or ss_wholesale_cost between 43 and 43+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 98 and 98+10
          or ss_coupon_amt between 17360 and 17360+1000
          or ss_wholesale_cost between 36 and 36+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 83 and 83+10
          or ss_coupon_amt between 17677 and 17677+1000
          or ss_wholesale_cost between 30 and 30+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 122 and 122+10
          or ss_coupon_amt between 3890 and 3890+1000
          or ss_wholesale_cost between 22 and 22+20)) B6
limit 100;


