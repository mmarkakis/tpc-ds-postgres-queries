
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 905 and 905+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'antique' or i_color = 'sky') and 
        (i_units = 'Ounce' or i_units = 'Bundle') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'papaya' or i_color = 'magenta') and
        (i_units = 'Box' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'rose' or i_color = 'blue') and
        (i_units = 'Dozen' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'mint' or i_color = 'cornflower') and
        (i_units = 'Case' or i_units = 'Ton') and
        (i_size = 'N/A' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'black' or i_color = 'white') and 
        (i_units = 'Tbl' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'drab' or i_color = 'steel') and
        (i_units = 'Each' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'burnished' or i_color = 'navajo') and
        (i_units = 'Unknown' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'moccasin' or i_color = 'gainsboro') and
        (i_units = 'Gross' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


