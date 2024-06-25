
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 994 and 994+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lavender' or i_color = 'blush') and 
        (i_units = 'Ton' or i_units = 'Gross') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'slate' or i_color = 'maroon') and
        (i_units = 'Each' or i_units = 'Dozen') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'aquamarine' or i_color = 'blanched') and
        (i_units = 'Box' or i_units = 'Tsp') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'royal' or i_color = 'forest') and
        (i_units = 'Gram' or i_units = 'Cup') and
        (i_size = 'extra large' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'seashell' or i_color = 'magenta') and 
        (i_units = 'Pallet' or i_units = 'Bundle') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'ghost' or i_color = 'ivory') and
        (i_units = 'Case' or i_units = 'Oz') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'gainsboro' or i_color = 'smoke') and
        (i_units = 'Unknown' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'blue' or i_color = 'purple') and
        (i_units = 'Carton' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


