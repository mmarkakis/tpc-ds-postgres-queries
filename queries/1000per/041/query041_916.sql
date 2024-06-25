
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 790 and 790+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'moccasin' or i_color = 'seashell') and 
        (i_units = 'Bundle' or i_units = 'Lb') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'sky' or i_color = 'mint') and
        (i_units = 'Ounce' or i_units = 'Box') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'chiffon' or i_color = 'white') and
        (i_units = 'Oz' or i_units = 'Dram') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'puff' or i_color = 'salmon') and
        (i_units = 'Bunch' or i_units = 'Cup') and
        (i_size = 'economy' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'navy' or i_color = 'tan') and 
        (i_units = 'Ton' or i_units = 'Each') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'misty' or i_color = 'cyan') and
        (i_units = 'Carton' or i_units = 'Gram') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'goldenrod') and
        (i_units = 'Tbl' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'hot') and
        (i_units = 'Pound' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


