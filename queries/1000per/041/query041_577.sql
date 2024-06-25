
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 793 and 793+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'forest' or i_color = 'brown') and 
        (i_units = 'Bunch' or i_units = 'N/A') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'cornflower' or i_color = 'yellow') and
        (i_units = 'Lb' or i_units = 'Unknown') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'almond' or i_color = 'khaki') and
        (i_units = 'Pallet' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'red') and
        (i_units = 'Pound' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'hot' or i_color = 'burnished') and 
        (i_units = 'Tbl' or i_units = 'Ton') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'chartreuse' or i_color = 'burlywood') and
        (i_units = 'Oz' or i_units = 'Tsp') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'gainsboro' or i_color = 'dark') and
        (i_units = 'Bundle' or i_units = 'Carton') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'cyan' or i_color = 'blue') and
        (i_units = 'Dram' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


