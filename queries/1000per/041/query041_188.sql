
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 762 and 762+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rose' or i_color = 'firebrick') and 
        (i_units = 'Gross' or i_units = 'Pallet') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'light' or i_color = 'puff') and
        (i_units = 'Oz' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'plum' or i_color = 'wheat') and
        (i_units = 'Bundle' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'antique' or i_color = 'cyan') and
        (i_units = 'Gram' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'black' or i_color = 'ivory') and 
        (i_units = 'Cup' or i_units = 'Each') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'lavender' or i_color = 'honeydew') and
        (i_units = 'Unknown' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'grey' or i_color = 'brown') and
        (i_units = 'Lb' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'dodger' or i_color = 'turquoise') and
        (i_units = 'Pound' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


