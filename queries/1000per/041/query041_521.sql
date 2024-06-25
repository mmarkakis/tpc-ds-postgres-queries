
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 789 and 789+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'deep' or i_color = 'almond') and 
        (i_units = 'Bundle' or i_units = 'Tsp') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'grey' or i_color = 'brown') and
        (i_units = 'Pallet' or i_units = 'Each') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'lace') and
        (i_units = 'Ton' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'spring') and
        (i_units = 'Box' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'gainsboro' or i_color = 'sky') and 
        (i_units = 'Case' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'papaya' or i_color = 'beige') and
        (i_units = 'Carton' or i_units = 'Gram') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'frosted' or i_color = 'seashell') and
        (i_units = 'Bunch' or i_units = 'Tbl') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'dim') and
        (i_units = 'Dram' or i_units = 'Dozen') and
        (i_size = 'economy' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


