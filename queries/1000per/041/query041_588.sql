
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 849 and 849+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dodger' or i_color = 'lime') and 
        (i_units = 'Gram' or i_units = 'Each') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'frosted' or i_color = 'powder') and
        (i_units = 'Lb' or i_units = 'N/A') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'coral' or i_color = 'bisque') and
        (i_units = 'Gross' or i_units = 'Pallet') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'chocolate' or i_color = 'tan') and
        (i_units = 'Bundle' or i_units = 'Oz') and
        (i_size = 'medium' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'peach' or i_color = 'firebrick') and 
        (i_units = 'Dozen' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'aquamarine' or i_color = 'blush') and
        (i_units = 'Pound' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'cream') and
        (i_units = 'Tbl' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'brown' or i_color = 'pink') and
        (i_units = 'Ton' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


