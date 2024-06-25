
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 731 and 731+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'yellow' or i_color = 'midnight') and 
        (i_units = 'Dozen' or i_units = 'Case') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'misty' or i_color = 'sienna') and
        (i_units = 'Carton' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'turquoise') and
        (i_units = 'Bunch' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'orchid' or i_color = 'lawn') and
        (i_units = 'Unknown' or i_units = 'Cup') and
        (i_size = 'extra large' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dodger' or i_color = 'lemon') and 
        (i_units = 'Dram' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'honeydew' or i_color = 'royal') and
        (i_units = 'Gram' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'drab' or i_color = 'orange') and
        (i_units = 'Ton' or i_units = 'Pallet') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'plum') and
        (i_units = 'Oz' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


