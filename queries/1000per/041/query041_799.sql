
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 895 and 895+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'seashell' or i_color = 'cornflower') and 
        (i_units = 'Gross' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'burnished' or i_color = 'gainsboro') and
        (i_units = 'Ton' or i_units = 'Bundle') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'yellow') and
        (i_units = 'Carton' or i_units = 'Lb') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'goldenrod' or i_color = 'ivory') and
        (i_units = 'Pallet' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navy' or i_color = 'blanched') and 
        (i_units = 'Dozen' or i_units = 'Oz') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'maroon' or i_color = 'light') and
        (i_units = 'N/A' or i_units = 'Case') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'wheat') and
        (i_units = 'Pound' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'steel' or i_color = 'plum') and
        (i_units = 'Bunch' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


