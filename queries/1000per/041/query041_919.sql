
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 852 and 852+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'brown' or i_color = 'gainsboro') and 
        (i_units = 'Tsp' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'indian' or i_color = 'peach') and
        (i_units = 'Bunch' or i_units = 'Oz') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'frosted' or i_color = 'seashell') and
        (i_units = 'Pound' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'deep') and
        (i_units = 'Tbl' or i_units = 'Lb') and
        (i_size = 'petite' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'bisque' or i_color = 'thistle') and 
        (i_units = 'Box' or i_units = 'Gram') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'antique' or i_color = 'light') and
        (i_units = 'Cup' or i_units = 'N/A') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'rose' or i_color = 'rosy') and
        (i_units = 'Each' or i_units = 'Unknown') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'smoke' or i_color = 'metallic') and
        (i_units = 'Case' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


