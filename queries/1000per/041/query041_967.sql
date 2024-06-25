
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 879 and 879+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'ghost' or i_color = 'goldenrod') and 
        (i_units = 'Gram' or i_units = 'Pallet') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'smoke' or i_color = 'burlywood') and
        (i_units = 'Dozen' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'frosted') and
        (i_units = 'Ounce' or i_units = 'Ton') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'beige' or i_color = 'antique') and
        (i_units = 'Tsp' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'powder' or i_color = 'puff') and 
        (i_units = 'Tbl' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'mint' or i_color = 'tomato') and
        (i_units = 'Gross' or i_units = 'Carton') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'blanched' or i_color = 'steel') and
        (i_units = 'Dram' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'spring' or i_color = 'floral') and
        (i_units = 'Lb' or i_units = 'Cup') and
        (i_size = 'N/A' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


