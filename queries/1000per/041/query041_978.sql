
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 878 and 878+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'midnight' or i_color = 'saddle') and 
        (i_units = 'Box' or i_units = 'Tbl') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'almond' or i_color = 'lawn') and
        (i_units = 'Each' or i_units = 'Bunch') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'plum') and
        (i_units = 'Carton' or i_units = 'N/A') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'royal') and
        (i_units = 'Dozen' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lime' or i_color = 'goldenrod') and 
        (i_units = 'Dram' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'chocolate' or i_color = 'dim') and
        (i_units = 'Bundle' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'burnished') and
        (i_units = 'Lb' or i_units = 'Oz') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'tomato' or i_color = 'yellow') and
        (i_units = 'Pallet' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


