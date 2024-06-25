
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 892 and 892+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'royal' or i_color = 'grey') and 
        (i_units = 'Carton' or i_units = 'Gram') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'beige' or i_color = 'chartreuse') and
        (i_units = 'Pallet' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'hot') and
        (i_units = 'Ton' or i_units = 'Each') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'drab' or i_color = 'aquamarine') and
        (i_units = 'Dozen' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lemon' or i_color = 'light') and 
        (i_units = 'N/A' or i_units = 'Case') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'steel' or i_color = 'almond') and
        (i_units = 'Bundle' or i_units = 'Cup') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'violet' or i_color = 'slate') and
        (i_units = 'Oz' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'rosy' or i_color = 'antique') and
        (i_units = 'Box' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


