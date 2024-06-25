
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 933 and 933+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rosy' or i_color = 'chiffon') and 
        (i_units = 'Carton' or i_units = 'Ton') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'ghost' or i_color = 'white') and
        (i_units = 'Tsp' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'dark') and
        (i_units = 'Pound' or i_units = 'Tbl') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'seashell' or i_color = 'midnight') and
        (i_units = 'Oz' or i_units = 'Bundle') and
        (i_size = 'large' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cornsilk' or i_color = 'blush') and 
        (i_units = 'Case' or i_units = 'Unknown') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'powder' or i_color = 'magenta') and
        (i_units = 'Each' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'royal' or i_color = 'purple') and
        (i_units = 'N/A' or i_units = 'Ounce') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'burnished' or i_color = 'ivory') and
        (i_units = 'Pallet' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


