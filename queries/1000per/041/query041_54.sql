
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 827 and 827+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'floral' or i_color = 'light') and 
        (i_units = 'N/A' or i_units = 'Gross') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'antique' or i_color = 'azure') and
        (i_units = 'Pallet' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'firebrick') and
        (i_units = 'Lb' or i_units = 'Each') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'plum') and
        (i_units = 'Bundle' or i_units = 'Dozen') and
        (i_size = 'small' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sandy' or i_color = 'chartreuse') and 
        (i_units = 'Gram' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'dodger' or i_color = 'aquamarine') and
        (i_units = 'Ton' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'yellow' or i_color = 'smoke') and
        (i_units = 'Tbl' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'sky' or i_color = 'chocolate') and
        (i_units = 'Dram' or i_units = 'Bunch') and
        (i_size = 'small' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


