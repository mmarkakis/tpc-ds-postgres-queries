
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 784 and 784+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'frosted' or i_color = 'spring') and 
        (i_units = 'Bundle' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'red' or i_color = 'linen') and
        (i_units = 'Box' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'bisque' or i_color = 'snow') and
        (i_units = 'Unknown' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'chocolate' or i_color = 'olive') and
        (i_units = 'N/A' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'papaya' or i_color = 'deep') and 
        (i_units = 'Carton' or i_units = 'Gram') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'dim' or i_color = 'royal') and
        (i_units = 'Tbl' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'khaki' or i_color = 'blue') and
        (i_units = 'Oz' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'orchid' or i_color = 'drab') and
        (i_units = 'Cup' or i_units = 'Tsp') and
        (i_size = 'petite' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


