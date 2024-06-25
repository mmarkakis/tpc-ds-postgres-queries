
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 801 and 801+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'peach' or i_color = 'metallic') and 
        (i_units = 'Unknown' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'midnight' or i_color = 'dim') and
        (i_units = 'Tsp' or i_units = 'N/A') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lime' or i_color = 'frosted') and
        (i_units = 'Pallet' or i_units = 'Oz') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'lace' or i_color = 'papaya') and
        (i_units = 'Bundle' or i_units = 'Dozen') and
        (i_size = 'small' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'mint' or i_color = 'grey') and 
        (i_units = 'Box' or i_units = 'Bunch') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'burnished' or i_color = 'dodger') and
        (i_units = 'Ounce' or i_units = 'Lb') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'powder' or i_color = 'burlywood') and
        (i_units = 'Pound' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'royal') and
        (i_units = 'Dram' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


