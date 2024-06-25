
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 830 and 830+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'powder' or i_color = 'chocolate') and 
        (i_units = 'Ounce' or i_units = 'Each') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'drab' or i_color = 'sky') and
        (i_units = 'Bundle' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'goldenrod' or i_color = 'sienna') and
        (i_units = 'Dram' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'maroon') and
        (i_units = 'Oz' or i_units = 'Cup') and
        (i_size = 'petite' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'royal' or i_color = 'sandy') and 
        (i_units = 'Unknown' or i_units = 'Dozen') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'chiffon' or i_color = 'linen') and
        (i_units = 'Carton' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'white' or i_color = 'lace') and
        (i_units = 'Gram' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'papaya' or i_color = 'moccasin') and
        (i_units = 'Pallet' or i_units = 'Tsp') and
        (i_size = 'petite' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


