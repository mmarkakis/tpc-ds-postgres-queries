
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 673 and 673+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'mint' or i_color = 'brown') and 
        (i_units = 'Dozen' or i_units = 'Oz') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'cornflower' or i_color = 'chiffon') and
        (i_units = 'Each' or i_units = 'Tsp') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'purple' or i_color = 'turquoise') and
        (i_units = 'Bundle' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lace' or i_color = 'medium') and
        (i_units = 'Dram' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'powder' or i_color = 'navy') and 
        (i_units = 'Cup' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'goldenrod' or i_color = 'wheat') and
        (i_units = 'Pallet' or i_units = 'Tbl') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'moccasin') and
        (i_units = 'Gram' or i_units = 'Ton') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lawn' or i_color = 'white') and
        (i_units = 'Case' or i_units = 'Carton') and
        (i_size = 'medium' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


