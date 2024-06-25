
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 855 and 855+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'gainsboro' or i_color = 'red') and 
        (i_units = 'N/A' or i_units = 'Unknown') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'antique' or i_color = 'chartreuse') and
        (i_units = 'Bundle' or i_units = 'Carton') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'purple' or i_color = 'olive') and
        (i_units = 'Case' or i_units = 'Pound') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'beige' or i_color = 'powder') and
        (i_units = 'Dozen' or i_units = 'Ton') and
        (i_size = 'extra large' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'black' or i_color = 'burlywood') and 
        (i_units = 'Lb' or i_units = 'Bunch') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'white' or i_color = 'lemon') and
        (i_units = 'Gram' or i_units = 'Tbl') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'yellow' or i_color = 'aquamarine') and
        (i_units = 'Oz' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'azure' or i_color = 'cornsilk') and
        (i_units = 'Each' or i_units = 'Ounce') and
        (i_size = 'extra large' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


