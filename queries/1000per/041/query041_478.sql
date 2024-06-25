
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 911 and 911+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'brown' or i_color = 'red') and 
        (i_units = 'Each' or i_units = 'Tbl') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'frosted' or i_color = 'burnished') and
        (i_units = 'Lb' or i_units = 'Case') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'orchid' or i_color = 'navy') and
        (i_units = 'Tsp' or i_units = 'Oz') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'metallic' or i_color = 'dodger') and
        (i_units = 'Unknown' or i_units = 'Bundle') and
        (i_size = 'economy' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cream' or i_color = 'rosy') and 
        (i_units = 'Cup' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'gainsboro' or i_color = 'drab') and
        (i_units = 'Bunch' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'purple' or i_color = 'lawn') and
        (i_units = 'Ounce' or i_units = 'Pound') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'ghost' or i_color = 'hot') and
        (i_units = 'Gram' or i_units = 'Box') and
        (i_size = 'economy' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


