
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 991 and 991+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'drab' or i_color = 'blanched') and 
        (i_units = 'N/A' or i_units = 'Each') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'thistle' or i_color = 'snow') and
        (i_units = 'Oz' or i_units = 'Lb') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'rosy' or i_color = 'turquoise') and
        (i_units = 'Dram' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'orchid' or i_color = 'puff') and
        (i_units = 'Dozen' or i_units = 'Cup') and
        (i_size = 'N/A' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'magenta' or i_color = 'plum') and 
        (i_units = 'Gram' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'medium' or i_color = 'burnished') and
        (i_units = 'Ounce' or i_units = 'Unknown') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'linen' or i_color = 'chiffon') and
        (i_units = 'Bunch' or i_units = 'Tbl') and
        (i_size = 'medium' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'khaki') and
        (i_units = 'Ton' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


