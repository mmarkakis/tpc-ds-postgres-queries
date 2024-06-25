
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 780 and 780+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orchid' or i_color = 'frosted') and 
        (i_units = 'Dozen' or i_units = 'Ton') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'linen' or i_color = 'blush') and
        (i_units = 'Unknown' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'beige') and
        (i_units = 'N/A' or i_units = 'Oz') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'olive' or i_color = 'goldenrod') and
        (i_units = 'Lb' or i_units = 'Ounce') and
        (i_size = 'N/A' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cream' or i_color = 'dodger') and 
        (i_units = 'Each' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'sienna' or i_color = 'medium') and
        (i_units = 'Box' or i_units = 'Dram') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'royal') and
        (i_units = 'Cup' or i_units = 'Bundle') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'chartreuse' or i_color = 'snow') and
        (i_units = 'Carton' or i_units = 'Pallet') and
        (i_size = 'N/A' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


