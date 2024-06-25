
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 884 and 884+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'hot' or i_color = 'sky') and 
        (i_units = 'Tsp' or i_units = 'Ton') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'smoke' or i_color = 'violet') and
        (i_units = 'Case' or i_units = 'Oz') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'purple' or i_color = 'goldenrod') and
        (i_units = 'Ounce' or i_units = 'Dram') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'pale' or i_color = 'slate') and
        (i_units = 'Gross' or i_units = 'N/A') and
        (i_size = 'large' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tomato' or i_color = 'rose') and 
        (i_units = 'Pound' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'thistle' or i_color = 'orchid') and
        (i_units = 'Unknown' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'brown' or i_color = 'misty') and
        (i_units = 'Lb' or i_units = 'Tbl') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'papaya' or i_color = 'yellow') and
        (i_units = 'Cup' or i_units = 'Bunch') and
        (i_size = 'large' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


