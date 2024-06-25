
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 834 and 834+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tan' or i_color = 'aquamarine') and 
        (i_units = 'Oz' or i_units = 'Gross') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'medium' or i_color = 'magenta') and
        (i_units = 'Carton' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'rosy' or i_color = 'mint') and
        (i_units = 'Tsp' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'forest' or i_color = 'lemon') and
        (i_units = 'Gram' or i_units = 'Box') and
        (i_size = 'medium' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'cyan' or i_color = 'smoke') and 
        (i_units = 'Cup' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'plum' or i_color = 'brown') and
        (i_units = 'Dozen' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'green' or i_color = 'midnight') and
        (i_units = 'Unknown' or i_units = 'Ton') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'metallic') and
        (i_units = 'Tbl' or i_units = 'Bunch') and
        (i_size = 'medium' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


