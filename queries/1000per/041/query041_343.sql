
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 673 and 673+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'light' or i_color = 'red') and 
        (i_units = 'Oz' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'pale' or i_color = 'medium') and
        (i_units = 'Pound' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'dark') and
        (i_units = 'Dozen' or i_units = 'Ounce') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'royal') and
        (i_units = 'Dram' or i_units = 'Case') and
        (i_size = 'small' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'midnight' or i_color = 'sky') and 
        (i_units = 'Tsp' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'magenta' or i_color = 'gainsboro') and
        (i_units = 'N/A' or i_units = 'Carton') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'indian' or i_color = 'yellow') and
        (i_units = 'Pallet' or i_units = 'Gross') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'frosted' or i_color = 'misty') and
        (i_units = 'Unknown' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


