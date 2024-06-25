
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 770 and 770+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'moccasin' or i_color = 'white') and 
        (i_units = 'Tbl' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'tan' or i_color = 'powder') and
        (i_units = 'Ounce' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'rose' or i_color = 'sky') and
        (i_units = 'Bundle' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornsilk' or i_color = 'floral') and
        (i_units = 'Carton' or i_units = 'Dram') and
        (i_size = 'medium' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lime' or i_color = 'light') and 
        (i_units = 'Pound' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'metallic' or i_color = 'goldenrod') and
        (i_units = 'N/A' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'gainsboro') and
        (i_units = 'Cup' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'mint' or i_color = 'orange') and
        (i_units = 'Ton' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


