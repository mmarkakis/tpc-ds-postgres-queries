
select case when (select count(*) 
                  from store_sales 
                  where ss_quantity between 1 and 20) > 3796965
            then (select avg(ss_ext_sales_price) 
                  from store_sales 
                  where ss_quantity between 1 and 20) 
            else (select avg(ss_net_profit)
                  from store_sales
                  where ss_quantity between 1 and 20) end bucket1 ,
       case when (select count(*)
                  from store_sales
                  where ss_quantity between 21 and 40) > 684894
            then (select avg(ss_ext_sales_price)
                  from store_sales
                  where ss_quantity between 21 and 40) 
            else (select avg(ss_net_profit)
                  from store_sales
                  where ss_quantity between 21 and 40) end bucket2,
       case when (select count(*)
                  from store_sales
                  where ss_quantity between 41 and 60) > 3376056
            then (select avg(ss_ext_sales_price)
                  from store_sales
                  where ss_quantity between 41 and 60)
            else (select avg(ss_net_profit)
                  from store_sales
                  where ss_quantity between 41 and 60) end bucket3,
       case when (select count(*)
                  from store_sales
                  where ss_quantity between 61 and 80) > 4215243
            then (select avg(ss_ext_sales_price)
                  from store_sales
                  where ss_quantity between 61 and 80)
            else (select avg(ss_net_profit)
                  from store_sales
                  where ss_quantity between 61 and 80) end bucket4,
       case when (select count(*)
                  from store_sales
                  where ss_quantity between 81 and 100) > 2086871
            then (select avg(ss_ext_sales_price)
                  from store_sales
                  where ss_quantity between 81 and 100)
            else (select avg(ss_net_profit)
                  from store_sales
                  where ss_quantity between 81 and 100) end bucket5
from reason
where r_reason_sk = 1
;


