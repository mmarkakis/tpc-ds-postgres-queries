
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 983 and 983+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'yellow' or i_color = 'olive') and 
        (i_units = 'Case' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'powder' or i_color = 'navajo') and
        (i_units = 'Unknown' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'thistle' or i_color = 'lavender') and
        (i_units = 'Bunch' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'chocolate' or i_color = 'blue') and
        (i_units = 'Carton' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sky' or i_color = 'maroon') and 
        (i_units = 'Oz' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'aquamarine' or i_color = 'light') and
        (i_units = 'Pallet' or i_units = 'Bundle') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'blush' or i_color = 'burnished') and
        (i_units = 'Ounce' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'cyan') and
        (i_units = 'N/A' or i_units = 'Pound') and
        (i_size = 'large' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


