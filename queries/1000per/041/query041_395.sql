
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 910 and 910+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'violet' or i_color = 'seashell') and 
        (i_units = 'Tsp' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'lavender' or i_color = 'aquamarine') and
        (i_units = 'Unknown' or i_units = 'Gram') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'beige' or i_color = 'maroon') and
        (i_units = 'Cup' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'drab' or i_color = 'thistle') and
        (i_units = 'Dozen' or i_units = 'Bundle') and
        (i_size = 'extra large' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dodger' or i_color = 'green') and 
        (i_units = 'Dram' or i_units = 'Ton') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'ivory' or i_color = 'lemon') and
        (i_units = 'Bunch' or i_units = 'Lb') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'coral' or i_color = 'smoke') and
        (i_units = 'N/A' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'rose' or i_color = 'chiffon') and
        (i_units = 'Oz' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


