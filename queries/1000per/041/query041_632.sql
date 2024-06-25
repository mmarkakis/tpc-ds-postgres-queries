
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 868 and 868+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'tan' or i_color = 'chocolate') and 
        (i_units = 'Pound' or i_units = 'Ounce') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'brown' or i_color = 'dark') and
        (i_units = 'Tbl' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'almond' or i_color = 'orange') and
        (i_units = 'Pallet' or i_units = 'Ton') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'azure' or i_color = 'royal') and
        (i_units = 'Gross' or i_units = 'Dozen') and
        (i_size = 'N/A' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'moccasin' or i_color = 'sky') and 
        (i_units = 'Oz' or i_units = 'Tsp') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'dodger' or i_color = 'green') and
        (i_units = 'Lb' or i_units = 'Each') and
        (i_size = 'large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'deep' or i_color = 'lavender') and
        (i_units = 'Carton' or i_units = 'Unknown') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'coral' or i_color = 'lace') and
        (i_units = 'Bundle' or i_units = 'N/A') and
        (i_size = 'N/A' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


