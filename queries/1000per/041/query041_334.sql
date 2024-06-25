
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 674 and 674+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blue' or i_color = 'royal') and 
        (i_units = 'Tsp' or i_units = 'Oz') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'lace' or i_color = 'saddle') and
        (i_units = 'Tbl' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'linen' or i_color = 'khaki') and
        (i_units = 'Dozen' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'firebrick' or i_color = 'cornsilk') and
        (i_units = 'Unknown' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'purple' or i_color = 'beige') and 
        (i_units = 'Cup' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'orange' or i_color = 'black') and
        (i_units = 'Ton' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'smoke' or i_color = 'rose') and
        (i_units = 'Gram' or i_units = 'Bunch') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'light') and
        (i_units = 'Dram' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


