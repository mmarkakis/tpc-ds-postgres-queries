
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 802 and 802+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lace' or i_color = 'sky') and 
        (i_units = 'Dozen' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'cornsilk' or i_color = 'navy') and
        (i_units = 'Bunch' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'powder' or i_color = 'seashell') and
        (i_units = 'Gram' or i_units = 'Carton') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'khaki' or i_color = 'yellow') and
        (i_units = 'Tbl' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'chiffon' or i_color = 'white') and 
        (i_units = 'Bundle' or i_units = 'Cup') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'papaya' or i_color = 'medium') and
        (i_units = 'Oz' or i_units = 'Dram') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'midnight' or i_color = 'misty') and
        (i_units = 'Ounce' or i_units = 'Gross') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'almond' or i_color = 'dim') and
        (i_units = 'Ton' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


