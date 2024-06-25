
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 729 and 729+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'indian' or i_color = 'ivory') and 
        (i_units = 'Cup' or i_units = 'Bundle') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'puff' or i_color = 'tan') and
        (i_units = 'Carton' or i_units = 'N/A') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'metallic' or i_color = 'chocolate') and
        (i_units = 'Dozen' or i_units = 'Tsp') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'beige' or i_color = 'light') and
        (i_units = 'Pallet' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'frosted' or i_color = 'lavender') and 
        (i_units = 'Case' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'floral' or i_color = 'saddle') and
        (i_units = 'Dram' or i_units = 'Box') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'midnight' or i_color = 'almond') and
        (i_units = 'Ton' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'purple' or i_color = 'honeydew') and
        (i_units = 'Ounce' or i_units = 'Oz') and
        (i_size = 'extra large' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


