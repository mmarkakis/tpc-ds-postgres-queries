
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 811 and 811+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'slate' or i_color = 'deep') and 
        (i_units = 'Dozen' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'goldenrod' or i_color = 'medium') and
        (i_units = 'Ounce' or i_units = 'Pallet') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'sky') and
        (i_units = 'Pound' or i_units = 'Tbl') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'maroon') and
        (i_units = 'Each' or i_units = 'Cup') and
        (i_size = 'petite' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tan' or i_color = 'azure') and 
        (i_units = 'Carton' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'floral' or i_color = 'chiffon') and
        (i_units = 'Oz' or i_units = 'N/A') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'yellow') and
        (i_units = 'Dram' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'saddle' or i_color = 'frosted') and
        (i_units = 'Box' or i_units = 'Gram') and
        (i_size = 'petite' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


