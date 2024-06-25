
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 761 and 761+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'linen' or i_color = 'dark') and 
        (i_units = 'Tbl' or i_units = 'Case') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'blanched' or i_color = 'sienna') and
        (i_units = 'Ounce' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'tomato') and
        (i_units = 'Cup' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'gainsboro' or i_color = 'purple') and
        (i_units = 'Gram' or i_units = 'Each') and
        (i_size = 'N/A' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'hot' or i_color = 'brown') and 
        (i_units = 'Carton' or i_units = 'Oz') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'wheat' or i_color = 'peru') and
        (i_units = 'Unknown' or i_units = 'Gross') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'orange' or i_color = 'burlywood') and
        (i_units = 'Tsp' or i_units = 'Bundle') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'chocolate' or i_color = 'azure') and
        (i_units = 'N/A' or i_units = 'Dram') and
        (i_size = 'N/A' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


