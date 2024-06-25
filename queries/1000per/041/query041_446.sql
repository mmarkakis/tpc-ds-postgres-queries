
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 804 and 804+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orchid' or i_color = 'saddle') and 
        (i_units = 'Pound' or i_units = 'Gram') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'tan' or i_color = 'brown') and
        (i_units = 'Box' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'almond' or i_color = 'bisque') and
        (i_units = 'Dram' or i_units = 'Ton') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'burnished' or i_color = 'aquamarine') and
        (i_units = 'Unknown' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sky' or i_color = 'peach') and 
        (i_units = 'Oz' or i_units = 'Gross') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'beige' or i_color = 'yellow') and
        (i_units = 'Lb' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'burlywood' or i_color = 'red') and
        (i_units = 'Bunch' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'navy') and
        (i_units = 'Bundle' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


