
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 950 and 950+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blanched' or i_color = 'powder') and 
        (i_units = 'Pallet' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'mint' or i_color = 'navajo') and
        (i_units = 'Oz' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'violet') and
        (i_units = 'Box' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'wheat' or i_color = 'medium') and
        (i_units = 'N/A' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cornsilk' or i_color = 'bisque') and 
        (i_units = 'Carton' or i_units = 'Case') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'ivory' or i_color = 'lemon') and
        (i_units = 'Gross' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'floral' or i_color = 'beige') and
        (i_units = 'Ton' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'royal' or i_color = 'rosy') and
        (i_units = 'Tsp' or i_units = 'Bundle') and
        (i_size = 'N/A' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


