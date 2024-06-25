
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 692 and 692+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navajo' or i_color = 'magenta') and 
        (i_units = 'Oz' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'sky' or i_color = 'yellow') and
        (i_units = 'Cup' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'white') and
        (i_units = 'Gram' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'beige' or i_color = 'olive') and
        (i_units = 'N/A' or i_units = 'Carton') and
        (i_size = 'large' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'bisque' or i_color = 'metallic') and 
        (i_units = 'Dozen' or i_units = 'Ounce') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'light' or i_color = 'burnished') and
        (i_units = 'Lb' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'wheat' or i_color = 'turquoise') and
        (i_units = 'Ton' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'snow' or i_color = 'chartreuse') and
        (i_units = 'Bundle' or i_units = 'Tbl') and
        (i_size = 'large' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


