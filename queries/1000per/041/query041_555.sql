
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 777 and 777+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'linen' or i_color = 'lemon') and 
        (i_units = 'Bunch' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'lavender' or i_color = 'lace') and
        (i_units = 'Tsp' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'puff' or i_color = 'papaya') and
        (i_units = 'Dram' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'sienna' or i_color = 'medium') and
        (i_units = 'Pound' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'plum' or i_color = 'metallic') and 
        (i_units = 'Gross' or i_units = 'Bundle') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'dodger' or i_color = 'sandy') and
        (i_units = 'Each' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'blue' or i_color = 'dark') and
        (i_units = 'Carton' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'mint' or i_color = 'almond') and
        (i_units = 'Gram' or i_units = 'Pallet') and
        (i_size = 'large' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


