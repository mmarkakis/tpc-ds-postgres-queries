
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 889 and 889+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'ghost' or i_color = 'blue') and 
        (i_units = 'N/A' or i_units = 'Unknown') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'peach' or i_color = 'navajo') and
        (i_units = 'Cup' or i_units = 'Carton') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'burlywood' or i_color = 'forest') and
        (i_units = 'Ton' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'pale' or i_color = 'royal') and
        (i_units = 'Gross' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'red' or i_color = 'brown') and 
        (i_units = 'Bundle' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'lace' or i_color = 'aquamarine') and
        (i_units = 'Each' or i_units = 'Dozen') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'midnight' or i_color = 'blush') and
        (i_units = 'Pound' or i_units = 'Tbl') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'saddle' or i_color = 'green') and
        (i_units = 'Gram' or i_units = 'Oz') and
        (i_size = 'large' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


