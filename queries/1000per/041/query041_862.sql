
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 681 and 681+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dark' or i_color = 'blue') and 
        (i_units = 'Dozen' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'light' or i_color = 'saddle') and
        (i_units = 'Oz' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'spring' or i_color = 'white') and
        (i_units = 'Tbl' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'goldenrod' or i_color = 'yellow') and
        (i_units = 'Unknown' or i_units = 'Gross') and
        (i_size = 'small' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'hot' or i_color = 'gainsboro') and 
        (i_units = 'Cup' or i_units = 'Gram') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'smoke' or i_color = 'cream') and
        (i_units = 'Ounce' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'ivory' or i_color = 'ghost') and
        (i_units = 'Bundle' or i_units = 'Bunch') and
        (i_size = 'petite' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'dodger' or i_color = 'rose') and
        (i_units = 'Ton' or i_units = 'Case') and
        (i_size = 'small' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


