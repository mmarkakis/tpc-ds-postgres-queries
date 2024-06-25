
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 822 and 822+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sky' or i_color = 'orange') and 
        (i_units = 'Bunch' or i_units = 'Gram') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'dark' or i_color = 'purple') and
        (i_units = 'Gross' or i_units = 'Dram') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'white' or i_color = 'lavender') and
        (i_units = 'Pound' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'lemon') and
        (i_units = 'Cup' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orchid' or i_color = 'antique') and 
        (i_units = 'Case' or i_units = 'Tsp') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'firebrick' or i_color = 'honeydew') and
        (i_units = 'Pallet' or i_units = 'Bundle') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'yellow' or i_color = 'azure') and
        (i_units = 'Lb' or i_units = 'Oz') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'plum') and
        (i_units = 'Ton' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


