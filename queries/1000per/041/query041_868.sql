
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 903 and 903+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'seashell' or i_color = 'blanched') and 
        (i_units = 'Bundle' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'ghost' or i_color = 'white') and
        (i_units = 'Ounce' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'snow' or i_color = 'chartreuse') and
        (i_units = 'Ton' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'powder' or i_color = 'sienna') and
        (i_units = 'Dram' or i_units = 'Each') and
        (i_size = 'N/A' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'metallic' or i_color = 'frosted') and 
        (i_units = 'Oz' or i_units = 'Pallet') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'sky' or i_color = 'chiffon') and
        (i_units = 'Gram' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'linen') and
        (i_units = 'Case' or i_units = 'Dozen') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'blush' or i_color = 'puff') and
        (i_units = 'Gross' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


