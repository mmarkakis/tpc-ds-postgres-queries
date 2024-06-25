
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 689 and 689+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navy' or i_color = 'rosy') and 
        (i_units = 'Dram' or i_units = 'Carton') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'aquamarine' or i_color = 'burlywood') and
        (i_units = 'N/A' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'violet') and
        (i_units = 'Ton' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'tomato' or i_color = 'puff') and
        (i_units = 'Pound' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blush' or i_color = 'lime') and 
        (i_units = 'Dozen' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'azure' or i_color = 'ghost') and
        (i_units = 'Pallet' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornsilk' or i_color = 'orange') and
        (i_units = 'Bundle' or i_units = 'Lb') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'indian' or i_color = 'cream') and
        (i_units = 'Unknown' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


