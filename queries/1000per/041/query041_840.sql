
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 866 and 866+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'drab' or i_color = 'green') and 
        (i_units = 'Carton' or i_units = 'Box') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'yellow' or i_color = 'rose') and
        (i_units = 'Ton' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'violet' or i_color = 'antique') and
        (i_units = 'Lb' or i_units = 'Tsp') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'puff' or i_color = 'slate') and
        (i_units = 'Bundle' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'dodger' or i_color = 'thistle') and 
        (i_units = 'Gram' or i_units = 'Cup') and
        (i_size = 'extra large' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'chiffon' or i_color = 'wheat') and
        (i_units = 'Dram' or i_units = 'Ounce') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'snow' or i_color = 'floral') and
        (i_units = 'Gross' or i_units = 'Bunch') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'cream' or i_color = 'pink') and
        (i_units = 'Case' or i_units = 'Oz') and
        (i_size = 'extra large' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


