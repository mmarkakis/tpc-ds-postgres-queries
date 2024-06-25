
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 941 and 941+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tomato' or i_color = 'goldenrod') and 
        (i_units = 'Unknown' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'turquoise' or i_color = 'puff') and
        (i_units = 'N/A' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'lace' or i_color = 'dodger') and
        (i_units = 'Ounce' or i_units = 'Oz') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'tan' or i_color = 'linen') and
        (i_units = 'Tsp' or i_units = 'Ton') and
        (i_size = 'N/A' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'thistle' or i_color = 'chiffon') and 
        (i_units = 'Carton' or i_units = 'Dram') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'seashell' or i_color = 'indian') and
        (i_units = 'Bundle' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'white' or i_color = 'lavender') and
        (i_units = 'Each' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'midnight' or i_color = 'brown') and
        (i_units = 'Bunch' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


