
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 686 and 686+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'pink' or i_color = 'turquoise') and 
        (i_units = 'Dozen' or i_units = 'Ton') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'lavender' or i_color = 'medium') and
        (i_units = 'Oz' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'sandy' or i_color = 'thistle') and
        (i_units = 'N/A' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'burlywood' or i_color = 'blue') and
        (i_units = 'Gram' or i_units = 'Dram') and
        (i_size = 'N/A' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'grey' or i_color = 'dodger') and 
        (i_units = 'Box' or i_units = 'Pound') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'orange' or i_color = 'moccasin') and
        (i_units = 'Tsp' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'ivory') and
        (i_units = 'Unknown' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'olive' or i_color = 'wheat') and
        (i_units = 'Carton' or i_units = 'Pallet') and
        (i_size = 'N/A' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


