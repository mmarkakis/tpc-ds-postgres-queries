
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 772 and 772+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'grey' or i_color = 'smoke') and 
        (i_units = 'Carton' or i_units = 'Tbl') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'white' or i_color = 'blanched') and
        (i_units = 'Bunch' or i_units = 'N/A') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'peru' or i_color = 'peach') and
        (i_units = 'Dram' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'orchid') and
        (i_units = 'Pound' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tomato' or i_color = 'dark') and 
        (i_units = 'Each' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'forest' or i_color = 'firebrick') and
        (i_units = 'Gram' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'pale' or i_color = 'snow') and
        (i_units = 'Case' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'lemon' or i_color = 'lace') and
        (i_units = 'Oz' or i_units = 'Tsp') and
        (i_size = 'extra large' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


