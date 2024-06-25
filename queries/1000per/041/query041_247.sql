
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 792 and 792+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'thistle' or i_color = 'gainsboro') and 
        (i_units = 'Tbl' or i_units = 'Dram') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'blanched' or i_color = 'chartreuse') and
        (i_units = 'Dozen' or i_units = 'Bundle') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'honeydew' or i_color = 'plum') and
        (i_units = 'Gram' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lawn' or i_color = 'cornflower') and
        (i_units = 'Carton' or i_units = 'Pound') and
        (i_size = 'economy' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navy' or i_color = 'burnished') and 
        (i_units = 'Tsp' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'saddle' or i_color = 'moccasin') and
        (i_units = 'Box' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'bisque') and
        (i_units = 'Lb' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'aquamarine' or i_color = 'lime') and
        (i_units = 'Bunch' or i_units = 'Case') and
        (i_size = 'economy' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


