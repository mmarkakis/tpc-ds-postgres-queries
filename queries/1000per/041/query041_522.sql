
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 723 and 723+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'white' or i_color = 'mint') and 
        (i_units = 'Ton' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'papaya' or i_color = 'orchid') and
        (i_units = 'Tbl' or i_units = 'Carton') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'navajo' or i_color = 'bisque') and
        (i_units = 'Lb' or i_units = 'Case') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'cyan') and
        (i_units = 'Dram' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'forest' or i_color = 'khaki') and 
        (i_units = 'Unknown' or i_units = 'Pound') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'steel' or i_color = 'indian') and
        (i_units = 'Ounce' or i_units = 'Tsp') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'rosy' or i_color = 'smoke') and
        (i_units = 'Gram' or i_units = 'Dozen') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'dim' or i_color = 'wheat') and
        (i_units = 'Cup' or i_units = 'Pallet') and
        (i_size = 'N/A' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


