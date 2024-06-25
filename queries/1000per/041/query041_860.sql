
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 978 and 978+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'violet' or i_color = 'tan') and 
        (i_units = 'Ounce' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'smoke' or i_color = 'turquoise') and
        (i_units = 'Gross' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'chartreuse' or i_color = 'wheat') and
        (i_units = 'Bunch' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'burlywood' or i_color = 'forest') and
        (i_units = 'Ton' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'yellow' or i_color = 'spring') and 
        (i_units = 'Gram' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'midnight' or i_color = 'lime') and
        (i_units = 'Pound' or i_units = 'Oz') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'khaki') and
        (i_units = 'Dram' or i_units = 'Carton') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'floral' or i_color = 'dodger') and
        (i_units = 'Bundle' or i_units = 'Tsp') and
        (i_size = 'economy' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


