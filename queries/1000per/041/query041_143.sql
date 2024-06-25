
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 764 and 764+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'magenta' or i_color = 'red') and 
        (i_units = 'Bunch' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'olive' or i_color = 'blanched') and
        (i_units = 'Dozen' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'sienna' or i_color = 'steel') and
        (i_units = 'Pound' or i_units = 'Bundle') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'royal' or i_color = 'gainsboro') and
        (i_units = 'Gram' or i_units = 'Each') and
        (i_size = 'N/A' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'drab' or i_color = 'burlywood') and 
        (i_units = 'Carton' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'peach' or i_color = 'violet') and
        (i_units = 'Cup' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'seashell' or i_color = 'sandy') and
        (i_units = 'Ton' or i_units = 'Tsp') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'moccasin') and
        (i_units = 'Dram' or i_units = 'Oz') and
        (i_size = 'N/A' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


