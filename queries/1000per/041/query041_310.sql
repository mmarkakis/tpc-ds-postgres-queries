
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 808 and 808+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'firebrick' or i_color = 'lawn') and 
        (i_units = 'Dozen' or i_units = 'Ton') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'smoke' or i_color = 'yellow') and
        (i_units = 'Pallet' or i_units = 'Tbl') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'antique' or i_color = 'goldenrod') and
        (i_units = 'Unknown' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'chocolate') and
        (i_units = 'Oz' or i_units = 'Bundle') and
        (i_size = 'N/A' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'red' or i_color = 'orchid') and 
        (i_units = 'Pound' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'peach' or i_color = 'wheat') and
        (i_units = 'Ounce' or i_units = 'Each') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'saddle' or i_color = 'metallic') and
        (i_units = 'Tsp' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'lace' or i_color = 'deep') and
        (i_units = 'Box' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


