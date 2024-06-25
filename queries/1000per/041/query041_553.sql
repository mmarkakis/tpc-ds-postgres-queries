
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 721 and 721+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'salmon' or i_color = 'rosy') and 
        (i_units = 'Pallet' or i_units = 'Tsp') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'olive' or i_color = 'chartreuse') and
        (i_units = 'Gross' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'white') and
        (i_units = 'Unknown' or i_units = 'Ounce') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'floral' or i_color = 'cornflower') and
        (i_units = 'Carton' or i_units = 'Dram') and
        (i_size = 'economy' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'firebrick' or i_color = 'aquamarine') and 
        (i_units = 'Cup' or i_units = 'Each') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'mint' or i_color = 'blush') and
        (i_units = 'Case' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'linen') and
        (i_units = 'Bunch' or i_units = 'Gram') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'almond' or i_color = 'cream') and
        (i_units = 'Dozen' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


