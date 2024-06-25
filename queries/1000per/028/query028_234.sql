
select  *
from (select avg(ss_list_price) B1_LP
            ,count(ss_list_price) B1_CNT
            ,count(distinct ss_list_price) B1_CNTD
      from store_sales
      where ss_quantity between 0 and 5
        and (ss_list_price between 25 and 25+10 
             or ss_coupon_amt between 11138 and 11138+1000
             or ss_wholesale_cost between 69 and 69+20)) B1,
     (select avg(ss_list_price) B2_LP
            ,count(ss_list_price) B2_CNT
            ,count(distinct ss_list_price) B2_CNTD
      from store_sales
      where ss_quantity between 6 and 10
        and (ss_list_price between 30 and 30+10
          or ss_coupon_amt between 1775 and 1775+1000
          or ss_wholesale_cost between 7 and 7+20)) B2,
     (select avg(ss_list_price) B3_LP
            ,count(ss_list_price) B3_CNT
            ,count(distinct ss_list_price) B3_CNTD
      from store_sales
      where ss_quantity between 11 and 15
        and (ss_list_price between 148 and 148+10
          or ss_coupon_amt between 14487 and 14487+1000
          or ss_wholesale_cost between 12 and 12+20)) B3,
     (select avg(ss_list_price) B4_LP
            ,count(ss_list_price) B4_CNT
            ,count(distinct ss_list_price) B4_CNTD
      from store_sales
      where ss_quantity between 16 and 20
        and (ss_list_price between 53 and 53+10
          or ss_coupon_amt between 3431 and 3431+1000
          or ss_wholesale_cost between 43 and 43+20)) B4,
     (select avg(ss_list_price) B5_LP
            ,count(ss_list_price) B5_CNT
            ,count(distinct ss_list_price) B5_CNTD
      from store_sales
      where ss_quantity between 21 and 25
        and (ss_list_price between 104 and 104+10
          or ss_coupon_amt between 1557 and 1557+1000
          or ss_wholesale_cost between 44 and 44+20)) B5,
     (select avg(ss_list_price) B6_LP
            ,count(ss_list_price) B6_CNT
            ,count(distinct ss_list_price) B6_CNTD
      from store_sales
      where ss_quantity between 26 and 30
        and (ss_list_price between 22 and 22+10
          or ss_coupon_amt between 11552 and 11552+1000
          or ss_wholesale_cost between 47 and 47+20)) B6
limit 100;


