
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 797 and 797+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'seashell' or i_color = 'aquamarine') and 
        (i_units = 'Each' or i_units = 'Pound') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'saddle' or i_color = 'antique') and
        (i_units = 'Carton' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'frosted') and
        (i_units = 'Pallet' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'lawn' or i_color = 'blue') and
        (i_units = 'Dozen' or i_units = 'Dram') and
        (i_size = 'petite' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'coral' or i_color = 'chartreuse') and 
        (i_units = 'N/A' or i_units = 'Bundle') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'steel' or i_color = 'deep') and
        (i_units = 'Bunch' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'honeydew') and
        (i_units = 'Lb' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'sienna' or i_color = 'burlywood') and
        (i_units = 'Cup' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


