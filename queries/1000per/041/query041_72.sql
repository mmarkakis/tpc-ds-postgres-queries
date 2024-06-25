
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 831 and 831+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'wheat' or i_color = 'bisque') and 
        (i_units = 'Gross' or i_units = 'Oz') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'sienna' or i_color = 'cream') and
        (i_units = 'Case' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'gainsboro' or i_color = 'blanched') and
        (i_units = 'Pound' or i_units = 'Carton') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'maroon' or i_color = 'firebrick') and
        (i_units = 'Bundle' or i_units = 'N/A') and
        (i_size = 'large' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'frosted' or i_color = 'green') and 
        (i_units = 'Dozen' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'mint' or i_color = 'almond') and
        (i_units = 'Tbl' or i_units = 'Each') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'blush' or i_color = 'indian') and
        (i_units = 'Lb' or i_units = 'Gram') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'azure' or i_color = 'tan') and
        (i_units = 'Pallet' or i_units = 'Bunch') and
        (i_size = 'large' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


