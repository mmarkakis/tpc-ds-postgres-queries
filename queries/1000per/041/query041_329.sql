
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 1000 and 1000+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'violet' or i_color = 'snow') and 
        (i_units = 'Gross' or i_units = 'Oz') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'red' or i_color = 'lace') and
        (i_units = 'Each' or i_units = 'Ton') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'tomato' or i_color = 'papaya') and
        (i_units = 'Tsp' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'firebrick' or i_color = 'ghost') and
        (i_units = 'Tbl' or i_units = 'Bundle') and
        (i_size = 'extra large' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blush' or i_color = 'chiffon') and 
        (i_units = 'Dram' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'brown' or i_color = 'grey') and
        (i_units = 'Gram' or i_units = 'Cup') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'medium' or i_color = 'white') and
        (i_units = 'Ounce' or i_units = 'Dozen') and
        (i_size = 'medium' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'frosted') and
        (i_units = 'Box' or i_units = 'Pound') and
        (i_size = 'extra large' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


