
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 673 and 673+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'salmon' or i_color = 'lace') and 
        (i_units = 'Box' or i_units = 'Pallet') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'metallic' or i_color = 'magenta') and
        (i_units = 'Unknown' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'navajo' or i_color = 'deep') and
        (i_units = 'Tbl' or i_units = 'Dozen') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'steel' or i_color = 'sandy') and
        (i_units = 'Bundle' or i_units = 'N/A') and
        (i_size = 'N/A' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'royal' or i_color = 'bisque') and 
        (i_units = 'Carton' or i_units = 'Pound') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'almond' or i_color = 'chartreuse') and
        (i_units = 'Case' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'moccasin' or i_color = 'sienna') and
        (i_units = 'Oz' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'seashell') and
        (i_units = 'Lb' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


