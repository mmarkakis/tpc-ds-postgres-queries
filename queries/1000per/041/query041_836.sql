
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 764 and 764+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lemon' or i_color = 'black') and 
        (i_units = 'Pound' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'orange' or i_color = 'rosy') and
        (i_units = 'N/A' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lime' or i_color = 'steel') and
        (i_units = 'Gram' or i_units = 'Cup') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'snow' or i_color = 'grey') and
        (i_units = 'Unknown' or i_units = 'Oz') and
        (i_size = 'small' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'almond' or i_color = 'light') and 
        (i_units = 'Case' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'beige' or i_color = 'linen') and
        (i_units = 'Each' or i_units = 'Carton') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'yellow' or i_color = 'cornflower') and
        (i_units = 'Ton' or i_units = 'Ounce') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'dodger') and
        (i_units = 'Tbl' or i_units = 'Gross') and
        (i_size = 'small' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


