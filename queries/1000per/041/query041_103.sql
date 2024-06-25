
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 995 and 995+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orange' or i_color = 'drab') and 
        (i_units = 'N/A' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'olive' or i_color = 'turquoise') and
        (i_units = 'Ounce' or i_units = 'Cup') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'chocolate' or i_color = 'dark') and
        (i_units = 'Carton' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'blanched' or i_color = 'chiffon') and
        (i_units = 'Bundle' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'floral' or i_color = 'seashell') and 
        (i_units = 'Bunch' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'slate' or i_color = 'rose') and
        (i_units = 'Unknown' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'midnight' or i_color = 'linen') and
        (i_units = 'Box' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'chartreuse' or i_color = 'burnished') and
        (i_units = 'Gross' or i_units = 'Tbl') and
        (i_size = 'small' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


