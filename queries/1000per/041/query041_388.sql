
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 870 and 870+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'floral' or i_color = 'green') and 
        (i_units = 'Lb' or i_units = 'Ounce') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'pale' or i_color = 'beige') and
        (i_units = 'Carton' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'puff' or i_color = 'tan') and
        (i_units = 'Pallet' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'lavender') and
        (i_units = 'Unknown' or i_units = 'Case') and
        (i_size = 'extra large' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rose' or i_color = 'saddle') and 
        (i_units = 'Dozen' or i_units = 'Pound') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'brown' or i_color = 'olive') and
        (i_units = 'Dram' or i_units = 'N/A') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'chartreuse' or i_color = 'light') and
        (i_units = 'Bundle' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'black') and
        (i_units = 'Bunch' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


