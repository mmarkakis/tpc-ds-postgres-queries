
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 792 and 792+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'pink' or i_color = 'yellow') and 
        (i_units = 'Pallet' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'papaya' or i_color = 'rosy') and
        (i_units = 'Cup' or i_units = 'Bunch') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'blanched' or i_color = 'maroon') and
        (i_units = 'Tsp' or i_units = 'Gross') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'floral') and
        (i_units = 'Pound' or i_units = 'Bundle') and
        (i_size = 'economy' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'white' or i_color = 'burlywood') and 
        (i_units = 'Lb' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'chocolate' or i_color = 'plum') and
        (i_units = 'Dram' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'antique') and
        (i_units = 'Dozen' or i_units = 'Case') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'blue') and
        (i_units = 'Carton' or i_units = 'N/A') and
        (i_size = 'economy' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


