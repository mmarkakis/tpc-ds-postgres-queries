
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 76 and 76+10 
             or ss_coupon_amt between 8674 and 8674+1000
             or ss_wholesale_cost between 71 and 71+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 150 and 150+10
          or ss_coupon_amt between 7527 and 7527+1000
          or ss_wholesale_cost between 63 and 63+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 158 and 158+10
          or ss_coupon_amt between 11332 and 11332+1000
          or ss_wholesale_cost between 54 and 54+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 122 and 122+10
          or ss_coupon_amt between 3665 and 3665+1000
          or ss_wholesale_cost between 2 and 2+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 16 and 16+10
          or ss_coupon_amt between 13052 and 13052+1000
          or ss_wholesale_cost between 0 and 0+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 121 and 121+10
          or ss_coupon_amt between 3817 and 3817+1000
          or ss_wholesale_cost between 55 and 55+20)) B6
limit 100;


