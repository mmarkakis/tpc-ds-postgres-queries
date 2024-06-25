
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 685 and 685+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lavender' or i_color = 'sienna') and 
        (i_units = 'Bunch' or i_units = 'N/A') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'light' or i_color = 'beige') and
        (i_units = 'Gram' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'seashell' or i_color = 'smoke') and
        (i_units = 'Cup' or i_units = 'Dram') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'yellow' or i_color = 'cornflower') and
        (i_units = 'Tbl' or i_units = 'Dozen') and
        (i_size = 'medium' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'purple' or i_color = 'magenta') and 
        (i_units = 'Pound' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'indian' or i_color = 'forest') and
        (i_units = 'Case' or i_units = 'Bundle') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'frosted') and
        (i_units = 'Box' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'deep' or i_color = 'slate') and
        (i_units = 'Tsp' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


