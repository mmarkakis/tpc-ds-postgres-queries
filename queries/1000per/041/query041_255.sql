
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 952 and 952+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dodger' or i_color = 'red') and 
        (i_units = 'Dozen' or i_units = 'Pound') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'pink' or i_color = 'sienna') and
        (i_units = 'Bundle' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'violet' or i_color = 'chartreuse') and
        (i_units = 'Bunch' or i_units = 'Tsp') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'seashell' or i_color = 'midnight') and
        (i_units = 'Gross' or i_units = 'Box') and
        (i_size = 'economy' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tan' or i_color = 'smoke') and 
        (i_units = 'Case' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'yellow' or i_color = 'bisque') and
        (i_units = 'Dram' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'rose' or i_color = 'peru') and
        (i_units = 'Cup' or i_units = 'Ounce') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'black' or i_color = 'slate') and
        (i_units = 'Unknown' or i_units = 'N/A') and
        (i_size = 'economy' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


