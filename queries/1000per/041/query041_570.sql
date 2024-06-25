
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 753 and 753+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navy' or i_color = 'firebrick') and 
        (i_units = 'Gross' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'tomato' or i_color = 'black') and
        (i_units = 'Pallet' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'brown' or i_color = 'khaki') and
        (i_units = 'Case' or i_units = 'Oz') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'light' or i_color = 'maroon') and
        (i_units = 'Cup' or i_units = 'Bundle') and
        (i_size = 'N/A' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'azure' or i_color = 'aquamarine') and 
        (i_units = 'Dozen' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'papaya' or i_color = 'green') and
        (i_units = 'Each' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'olive' or i_color = 'cornsilk') and
        (i_units = 'Ounce' or i_units = 'Tsp') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'ivory') and
        (i_units = 'Lb' or i_units = 'N/A') and
        (i_size = 'N/A' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


