
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 897 and 897+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'ghost' or i_color = 'cyan') and 
        (i_units = 'Gross' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'blanched' or i_color = 'spring') and
        (i_units = 'Tsp' or i_units = 'Case') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'firebrick' or i_color = 'gainsboro') and
        (i_units = 'Bunch' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'turquoise' or i_color = 'aquamarine') and
        (i_units = 'Each' or i_units = 'Ton') and
        (i_size = 'small' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cornflower' or i_color = 'peach') and 
        (i_units = 'Oz' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'steel' or i_color = 'mint') and
        (i_units = 'Dozen' or i_units = 'Pound') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'orange' or i_color = 'lemon') and
        (i_units = 'Lb' or i_units = 'Pallet') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'floral' or i_color = 'green') and
        (i_units = 'Cup' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


