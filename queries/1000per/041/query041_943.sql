
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 849 and 849+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'red' or i_color = 'floral') and 
        (i_units = 'Gram' or i_units = 'Tbl') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'yellow' or i_color = 'drab') and
        (i_units = 'Dozen' or i_units = 'Each') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'papaya' or i_color = 'thistle') and
        (i_units = 'Gross' or i_units = 'Case') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'burnished' or i_color = 'bisque') and
        (i_units = 'Oz' or i_units = 'Box') and
        (i_size = 'small' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orange' or i_color = 'khaki') and 
        (i_units = 'Carton' or i_units = 'Ounce') and
        (i_size = 'small' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'black' or i_color = 'light') and
        (i_units = 'Lb' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'chartreuse' or i_color = 'dim') and
        (i_units = 'Pound' or i_units = 'Bunch') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'dodger' or i_color = 'beige') and
        (i_units = 'Bundle' or i_units = 'Cup') and
        (i_size = 'small' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


