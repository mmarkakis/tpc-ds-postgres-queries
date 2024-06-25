
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 747 and 747+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rose' or i_color = 'puff') and 
        (i_units = 'Tsp' or i_units = 'Dram') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'slate' or i_color = 'white') and
        (i_units = 'Pallet' or i_units = 'Oz') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'medium' or i_color = 'beige') and
        (i_units = 'Bunch' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'dim' or i_color = 'grey') and
        (i_units = 'Bundle' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'light' or i_color = 'honeydew') and 
        (i_units = 'Ton' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'peru' or i_color = 'coral') and
        (i_units = 'Gram' or i_units = 'Box') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'cyan' or i_color = 'deep') and
        (i_units = 'Tbl' or i_units = 'Lb') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'sandy' or i_color = 'royal') and
        (i_units = 'N/A' or i_units = 'Cup') and
        (i_size = 'medium' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


