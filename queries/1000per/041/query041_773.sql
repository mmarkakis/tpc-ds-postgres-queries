
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 881 and 881+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sienna' or i_color = 'violet') and 
        (i_units = 'Case' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'smoke' or i_color = 'seashell') and
        (i_units = 'Each' or i_units = 'Carton') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'drab' or i_color = 'yellow') and
        (i_units = 'Bundle' or i_units = 'Gross') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'metallic' or i_color = 'powder') and
        (i_units = 'Bunch' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'papaya' or i_color = 'almond') and 
        (i_units = 'Pallet' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'rose' or i_color = 'aquamarine') and
        (i_units = 'Tbl' or i_units = 'N/A') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'steel' or i_color = 'pink') and
        (i_units = 'Ounce' or i_units = 'Dozen') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'sandy' or i_color = 'thistle') and
        (i_units = 'Cup' or i_units = 'Ton') and
        (i_size = 'small' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


