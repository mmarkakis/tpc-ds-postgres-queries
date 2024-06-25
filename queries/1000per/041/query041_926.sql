
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 950 and 950+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blue' or i_color = 'papaya') and 
        (i_units = 'Gram' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'green' or i_color = 'royal') and
        (i_units = 'Dram' or i_units = 'Ounce') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'indian' or i_color = 'pale') and
        (i_units = 'Unknown' or i_units = 'Cup') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'coral') and
        (i_units = 'Pallet' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cyan' or i_color = 'lemon') and 
        (i_units = 'Carton' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'dark' or i_color = 'saddle') and
        (i_units = 'N/A' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'gainsboro' or i_color = 'deep') and
        (i_units = 'Tbl' or i_units = 'Bundle') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'black' or i_color = 'midnight') and
        (i_units = 'Ton' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


