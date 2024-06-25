
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 996 and 996+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'aquamarine' or i_color = 'powder') and 
        (i_units = 'Tsp' or i_units = 'Gram') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'smoke' or i_color = 'burlywood') and
        (i_units = 'Gross' or i_units = 'Oz') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'khaki') and
        (i_units = 'Cup' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'floral' or i_color = 'peach') and
        (i_units = 'Lb' or i_units = 'Case') and
        (i_size = 'N/A' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'indian' or i_color = 'orchid') and 
        (i_units = 'Bundle' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'white' or i_color = 'grey') and
        (i_units = 'Bunch' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'chartreuse') and
        (i_units = 'Pallet' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'green') and
        (i_units = 'Dozen' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


