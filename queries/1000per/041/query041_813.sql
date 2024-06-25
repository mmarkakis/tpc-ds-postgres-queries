
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 680 and 680+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'linen' or i_color = 'rose') and 
        (i_units = 'Oz' or i_units = 'Gram') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'chartreuse' or i_color = 'light') and
        (i_units = 'Box' or i_units = 'Each') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'snow' or i_color = 'salmon') and
        (i_units = 'Lb' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'ghost' or i_color = 'thistle') and
        (i_units = 'Pallet' or i_units = 'Ton') and
        (i_size = 'large' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cyan' or i_color = 'red') and 
        (i_units = 'Unknown' or i_units = 'Tbl') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'goldenrod' or i_color = 'yellow') and
        (i_units = 'Pound' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornsilk' or i_color = 'puff') and
        (i_units = 'Case' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'blue' or i_color = 'spring') and
        (i_units = 'Bundle' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


