
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 888 and 888+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'goldenrod' or i_color = 'gainsboro') and 
        (i_units = 'Tsp' or i_units = 'Oz') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'mint' or i_color = 'chartreuse') and
        (i_units = 'Ton' or i_units = 'Ounce') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'papaya' or i_color = 'red') and
        (i_units = 'Tbl' or i_units = 'Carton') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'salmon' or i_color = 'blush') and
        (i_units = 'Dram' or i_units = 'Bunch') and
        (i_size = 'petite' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'rosy' or i_color = 'burnished') and 
        (i_units = 'N/A' or i_units = 'Gram') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'blue' or i_color = 'firebrick') and
        (i_units = 'Dozen' or i_units = 'Pound') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'light' or i_color = 'dim') and
        (i_units = 'Bundle' or i_units = 'Box') and
        (i_size = 'economy' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'royal' or i_color = 'midnight') and
        (i_units = 'Case' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


