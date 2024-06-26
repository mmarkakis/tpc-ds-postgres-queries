
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 822 and 822+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'white' or i_color = 'chartreuse') and 
        (i_units = 'Gram' or i_units = 'Ton') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'tan' or i_color = 'khaki') and
        (i_units = 'Gross' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'spring' or i_color = 'seashell') and
        (i_units = 'Tbl' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'powder' or i_color = 'navy') and
        (i_units = 'Pound' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cornflower' or i_color = 'honeydew') and 
        (i_units = 'Dram' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'puff' or i_color = 'dark') and
        (i_units = 'Bunch' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'beige' or i_color = 'frosted') and
        (i_units = 'Bundle' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'black' or i_color = 'lime') and
        (i_units = 'Each' or i_units = 'N/A') and
        (i_size = 'large' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


