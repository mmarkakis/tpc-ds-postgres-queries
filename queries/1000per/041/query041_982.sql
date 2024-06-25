
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 755 and 755+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'peru' or i_color = 'blue') and 
        (i_units = 'Dozen' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'navy' or i_color = 'metallic') and
        (i_units = 'N/A' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'saddle') and
        (i_units = 'Ounce' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'ghost' or i_color = 'pink') and
        (i_units = 'Each' or i_units = 'Tsp') and
        (i_size = 'extra large' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lavender' or i_color = 'olive') and 
        (i_units = 'Case' or i_units = 'Ton') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'seashell' or i_color = 'hot') and
        (i_units = 'Cup' or i_units = 'Tbl') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'drab' or i_color = 'orange') and
        (i_units = 'Bunch' or i_units = 'Dram') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'goldenrod' or i_color = 'dark') and
        (i_units = 'Gram' or i_units = 'Pound') and
        (i_size = 'extra large' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


