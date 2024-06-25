
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 815 and 815+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'metallic' or i_color = 'firebrick') and 
        (i_units = 'Dram' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'peach' or i_color = 'powder') and
        (i_units = 'Tsp' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'plum' or i_color = 'moccasin') and
        (i_units = 'Each' or i_units = 'Tbl') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'spring') and
        (i_units = 'Pallet' or i_units = 'N/A') and
        (i_size = 'small' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'azure' or i_color = 'lime') and 
        (i_units = 'Bunch' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'navy' or i_color = 'beige') and
        (i_units = 'Lb' or i_units = 'Pound') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'burlywood' or i_color = 'lace') and
        (i_units = 'Cup' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'smoke' or i_color = 'deep') and
        (i_units = 'Unknown' or i_units = 'Bundle') and
        (i_size = 'small' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


