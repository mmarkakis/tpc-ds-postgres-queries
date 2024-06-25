
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 765 and 765+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lime' or i_color = 'pink') and 
        (i_units = 'Case' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'tomato' or i_color = 'misty') and
        (i_units = 'Bunch' or i_units = 'Cup') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'almond') and
        (i_units = 'Dozen' or i_units = 'Tsp') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'sandy' or i_color = 'wheat') and
        (i_units = 'Tbl' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'plum' or i_color = 'yellow') and 
        (i_units = 'Oz' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'cornflower' or i_color = 'burlywood') and
        (i_units = 'Pound' or i_units = 'Bundle') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'cornsilk') and
        (i_units = 'Gram' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'thistle' or i_color = 'frosted') and
        (i_units = 'Each' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


