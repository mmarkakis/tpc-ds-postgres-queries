
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 832 and 832+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'peru' or i_color = 'grey') and 
        (i_units = 'Tsp' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'metallic' or i_color = 'dark') and
        (i_units = 'Cup' or i_units = 'Bunch') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'tomato' or i_color = 'medium') and
        (i_units = 'Tbl' or i_units = 'Pound') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'lemon' or i_color = 'pink') and
        (i_units = 'Each' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'coral' or i_color = 'lace') and 
        (i_units = 'Unknown' or i_units = 'Dram') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'cream' or i_color = 'puff') and
        (i_units = 'Box' or i_units = 'N/A') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lawn' or i_color = 'lavender') and
        (i_units = 'Bundle' or i_units = 'Case') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'plum' or i_color = 'red') and
        (i_units = 'Gram' or i_units = 'Carton') and
        (i_size = 'petite' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


