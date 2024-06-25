
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 756 and 756+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sky' or i_color = 'rose') and 
        (i_units = 'Unknown' or i_units = 'Cup') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'cream' or i_color = 'yellow') and
        (i_units = 'Carton' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'steel' or i_color = 'deep') and
        (i_units = 'Bundle' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'blanched' or i_color = 'powder') and
        (i_units = 'Bunch' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'peach' or i_color = 'goldenrod') and 
        (i_units = 'Pound' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'blue' or i_color = 'burnished') and
        (i_units = 'Ton' or i_units = 'N/A') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'pale' or i_color = 'midnight') and
        (i_units = 'Gram' or i_units = 'Lb') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'bisque' or i_color = 'smoke') and
        (i_units = 'Dozen' or i_units = 'Gross') and
        (i_size = 'small' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


