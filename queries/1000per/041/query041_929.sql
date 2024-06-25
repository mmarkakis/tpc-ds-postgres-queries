
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 753 and 753+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cream' or i_color = 'purple') and 
        (i_units = 'Gram' or i_units = 'Unknown') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'spring' or i_color = 'mint') and
        (i_units = 'Box' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'burlywood' or i_color = 'sienna') and
        (i_units = 'Oz' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'metallic') and
        (i_units = 'N/A' or i_units = 'Gross') and
        (i_size = 'extra large' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'grey' or i_color = 'almond') and 
        (i_units = 'Pound' or i_units = 'Bunch') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'goldenrod' or i_color = 'beige') and
        (i_units = 'Dozen' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'bisque') and
        (i_units = 'Bundle' or i_units = 'Dram') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'puff' or i_color = 'blush') and
        (i_units = 'Case' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


