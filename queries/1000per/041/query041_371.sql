
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 778 and 778+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'floral' or i_color = 'dodger') and 
        (i_units = 'Case' or i_units = 'Bundle') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'almond' or i_color = 'frosted') and
        (i_units = 'Pallet' or i_units = 'N/A') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'saddle') and
        (i_units = 'Carton' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'goldenrod') and
        (i_units = 'Tsp' or i_units = 'Dram') and
        (i_size = 'medium' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'violet' or i_color = 'powder') and 
        (i_units = 'Ton' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'mint' or i_color = 'turquoise') and
        (i_units = 'Cup' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'peru' or i_color = 'blanched') and
        (i_units = 'Tbl' or i_units = 'Bunch') and
        (i_size = 'small' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'antique') and
        (i_units = 'Box' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


