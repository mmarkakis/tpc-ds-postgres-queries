
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 919 and 919+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'turquoise' or i_color = 'metallic') and 
        (i_units = 'Unknown' or i_units = 'Dozen') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'peach' or i_color = 'cornflower') and
        (i_units = 'Oz' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'rosy' or i_color = 'dodger') and
        (i_units = 'Each' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'bisque' or i_color = 'chartreuse') and
        (i_units = 'Pallet' or i_units = 'Bundle') and
        (i_size = 'extra large' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tan' or i_color = 'peru') and 
        (i_units = 'Tbl' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'red' or i_color = 'floral') and
        (i_units = 'Ounce' or i_units = 'Ton') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'deep' or i_color = 'antique') and
        (i_units = 'Box' or i_units = 'N/A') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'cornsilk') and
        (i_units = 'Tsp' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


