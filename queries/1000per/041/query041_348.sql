
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 907 and 907+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'slate' or i_color = 'royal') and 
        (i_units = 'Pallet' or i_units = 'Bunch') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'firebrick' or i_color = 'orchid') and
        (i_units = 'Dozen' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'frosted' or i_color = 'spring') and
        (i_units = 'Each' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'blanched' or i_color = 'pink') and
        (i_units = 'Gross' or i_units = 'Tbl') and
        (i_size = 'large' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'brown' or i_color = 'maroon') and 
        (i_units = 'Bundle' or i_units = 'Unknown') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'yellow' or i_color = 'purple') and
        (i_units = 'Dram' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'chartreuse' or i_color = 'pale') and
        (i_units = 'Pound' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'saddle' or i_color = 'smoke') and
        (i_units = 'Ounce' or i_units = 'Gram') and
        (i_size = 'large' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


