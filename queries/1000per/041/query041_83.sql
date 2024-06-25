
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 847 and 847+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'white' or i_color = 'peru') and 
        (i_units = 'Carton' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'tan' or i_color = 'misty') and
        (i_units = 'Box' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'metallic' or i_color = 'saddle') and
        (i_units = 'Bundle' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'thistle' or i_color = 'powder') and
        (i_units = 'Tsp' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'chartreuse' or i_color = 'violet') and 
        (i_units = 'Ton' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'plum' or i_color = 'yellow') and
        (i_units = 'Lb' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'goldenrod') and
        (i_units = 'Case' or i_units = 'Ounce') and
        (i_size = 'extra large' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'blue' or i_color = 'burnished') and
        (i_units = 'N/A' or i_units = 'Bunch') and
        (i_size = 'large' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


