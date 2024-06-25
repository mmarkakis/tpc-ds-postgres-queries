
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 781 and 781+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'goldenrod' or i_color = 'chiffon') and 
        (i_units = 'Pound' or i_units = 'Bundle') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'cornflower' or i_color = 'orchid') and
        (i_units = 'Tsp' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'lace' or i_color = 'moccasin') and
        (i_units = 'Unknown' or i_units = 'Cup') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornsilk' or i_color = 'snow') and
        (i_units = 'Tbl' or i_units = 'Case') and
        (i_size = 'large' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'lemon' or i_color = 'dodger') and 
        (i_units = 'Gram' or i_units = 'Ounce') and
        (i_size = 'large' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'royal' or i_color = 'mint') and
        (i_units = 'Oz' or i_units = 'Bunch') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'violet') and
        (i_units = 'Gross' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'blue') and
        (i_units = 'Dozen' or i_units = 'Box') and
        (i_size = 'large' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


