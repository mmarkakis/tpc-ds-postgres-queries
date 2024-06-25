
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 902 and 902+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'maroon' or i_color = 'navajo') and 
        (i_units = 'Pallet' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'beige' or i_color = 'medium') and
        (i_units = 'Pound' or i_units = 'Dozen') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'blanched' or i_color = 'dim') and
        (i_units = 'Ton' or i_units = 'Cup') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'grey') and
        (i_units = 'Tbl' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'spring' or i_color = 'almond') and 
        (i_units = 'Oz' or i_units = 'Lb') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'dark' or i_color = 'blush') and
        (i_units = 'Unknown' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'smoke') and
        (i_units = 'Bunch' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'lawn' or i_color = 'saddle') and
        (i_units = 'Dram' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


