
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 760 and 760+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'white' or i_color = 'sky') and 
        (i_units = 'Dozen' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'bisque' or i_color = 'cornsilk') and
        (i_units = 'Bunch' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'burlywood') and
        (i_units = 'N/A' or i_units = 'Tsp') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'violet' or i_color = 'seashell') and
        (i_units = 'Pallet' or i_units = 'Each') and
        (i_size = 'large' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tan' or i_color = 'coral') and 
        (i_units = 'Gram' or i_units = 'Lb') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'puff' or i_color = 'yellow') and
        (i_units = 'Bundle' or i_units = 'Dram') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'lawn' or i_color = 'peach') and
        (i_units = 'Gross' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'light' or i_color = 'salmon') and
        (i_units = 'Unknown' or i_units = 'Pound') and
        (i_size = 'large' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


