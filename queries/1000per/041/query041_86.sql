
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 877 and 877+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sienna' or i_color = 'green') and 
        (i_units = 'Oz' or i_units = 'Ounce') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'metallic' or i_color = 'cornflower') and
        (i_units = 'Gram' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'lace' or i_color = 'rosy') and
        (i_units = 'Tbl' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'cornsilk') and
        (i_units = 'Ton' or i_units = 'Bundle') and
        (i_size = 'economy' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orchid' or i_color = 'dim') and 
        (i_units = 'Pound' or i_units = 'Bunch') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'chiffon' or i_color = 'goldenrod') and
        (i_units = 'Each' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'violet' or i_color = 'chartreuse') and
        (i_units = 'Pallet' or i_units = 'Carton') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'brown' or i_color = 'lime') and
        (i_units = 'N/A' or i_units = 'Dozen') and
        (i_size = 'economy' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


