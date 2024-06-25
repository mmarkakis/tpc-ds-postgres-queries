
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 998 and 998+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'peru' or i_color = 'lemon') and 
        (i_units = 'Bundle' or i_units = 'Bunch') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'steel' or i_color = 'misty') and
        (i_units = 'Ton' or i_units = 'Dozen') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'thistle' or i_color = 'slate') and
        (i_units = 'Unknown' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'saddle') and
        (i_units = 'Oz' or i_units = 'N/A') and
        (i_size = 'large' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'snow' or i_color = 'chartreuse') and 
        (i_units = 'Ounce' or i_units = 'Tbl') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'blue' or i_color = 'gainsboro') and
        (i_units = 'Pound' or i_units = 'Carton') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'grey' or i_color = 'seashell') and
        (i_units = 'Gram' or i_units = 'Lb') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'chiffon' or i_color = 'lawn') and
        (i_units = 'Each' or i_units = 'Tsp') and
        (i_size = 'large' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


