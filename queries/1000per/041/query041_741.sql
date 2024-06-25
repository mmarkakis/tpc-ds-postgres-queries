
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 780 and 780+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'forest' or i_color = 'pale') and 
        (i_units = 'Bundle' or i_units = 'Bunch') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'burnished' or i_color = 'ivory') and
        (i_units = 'Tsp' or i_units = 'Gram') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'papaya') and
        (i_units = 'Unknown' or i_units = 'Pound') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'turquoise' or i_color = 'coral') and
        (i_units = 'Oz' or i_units = 'N/A') and
        (i_size = 'small' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'moccasin' or i_color = 'dim') and 
        (i_units = 'Cup' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'yellow' or i_color = 'blanched') and
        (i_units = 'Ton' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'maroon' or i_color = 'cyan') and
        (i_units = 'Carton' or i_units = 'Ounce') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'smoke' or i_color = 'violet') and
        (i_units = 'Case' or i_units = 'Lb') and
        (i_size = 'small' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


