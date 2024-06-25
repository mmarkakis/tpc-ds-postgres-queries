
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 794 and 794+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blue' or i_color = 'peach') and 
        (i_units = 'Carton' or i_units = 'Gross') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'red' or i_color = 'smoke') and
        (i_units = 'Tbl' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'wheat' or i_color = 'ivory') and
        (i_units = 'Tsp' or i_units = 'Ton') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'dodger' or i_color = 'rose') and
        (i_units = 'Unknown' or i_units = 'Bunch') and
        (i_size = 'extra large' or i_size = 'large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'honeydew' or i_color = 'gainsboro') and 
        (i_units = 'Pallet' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Women' and
        (i_color = 'snow' or i_color = 'purple') and
        (i_units = 'Bundle' or i_units = 'Oz') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'grey' or i_color = 'midnight') and
        (i_units = 'Pound' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'maroon' or i_color = 'medium') and
        (i_units = 'Dozen' or i_units = 'Gram') and
        (i_size = 'extra large' or i_size = 'large')
        )))) > 0
 order by i_product_name
 limit 100;


