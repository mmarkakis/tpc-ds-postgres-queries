
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 759 and 759+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'firebrick' or i_color = 'lawn') and 
        (i_units = 'Box' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'blue' or i_color = 'lime') and
        (i_units = 'Gram' or i_units = 'Pallet') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'chartreuse' or i_color = 'dim') and
        (i_units = 'Dram' or i_units = 'Gross') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'lemon' or i_color = 'dodger') and
        (i_units = 'Oz' or i_units = 'Carton') and
        (i_size = 'small' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'beige' or i_color = 'cornsilk') and 
        (i_units = 'Bunch' or i_units = 'Bundle') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'chocolate' or i_color = 'drab') and
        (i_units = 'Tsp' or i_units = 'Dozen') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'coral' or i_color = 'goldenrod') and
        (i_units = 'Cup' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'yellow' or i_color = 'honeydew') and
        (i_units = 'Ton' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


