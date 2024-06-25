
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 743 and 743+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'deep' or i_color = 'grey') and 
        (i_units = 'Unknown' or i_units = 'Oz') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'wheat' or i_color = 'ghost') and
        (i_units = 'Lb' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'blue') and
        (i_units = 'N/A' or i_units = 'Each') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'azure') and
        (i_units = 'Gross' or i_units = 'Tbl') and
        (i_size = 'economy' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'khaki' or i_color = 'violet') and 
        (i_units = 'Pound' or i_units = 'Carton') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'drab' or i_color = 'peach') and
        (i_units = 'Dram' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'sienna' or i_color = 'turquoise') and
        (i_units = 'Tsp' or i_units = 'Bundle') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lace' or i_color = 'forest') and
        (i_units = 'Bunch' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


