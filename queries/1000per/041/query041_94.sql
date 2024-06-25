
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 762 and 762+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'misty' or i_color = 'chocolate') and 
        (i_units = 'Ton' or i_units = 'Gross') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'purple' or i_color = 'black') and
        (i_units = 'Tsp' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'tan') and
        (i_units = 'Lb' or i_units = 'Bundle') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'lemon') and
        (i_units = 'Bunch' or i_units = 'Dram') and
        (i_size = 'economy' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'olive' or i_color = 'turquoise') and 
        (i_units = 'Pallet' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'royal' or i_color = 'maroon') and
        (i_units = 'Carton' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'cyan') and
        (i_units = 'N/A' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'sandy' or i_color = 'light') and
        (i_units = 'Each' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


