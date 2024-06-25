
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 868 and 868+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'red' or i_color = 'dim') and 
        (i_units = 'Oz' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'black' or i_color = 'ivory') and
        (i_units = 'Bundle' or i_units = 'Each') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'royal') and
        (i_units = 'N/A' or i_units = 'Dozen') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'dark' or i_color = 'powder') and
        (i_units = 'Tsp' or i_units = 'Pound') and
        (i_size = 'N/A' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'blanched' or i_color = 'peach') and 
        (i_units = 'Box' or i_units = 'Carton') and
        (i_size = 'N/A' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'floral' or i_color = 'grey') and
        (i_units = 'Dram' or i_units = 'Cup') and
        (i_size = 'extra large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'orange' or i_color = 'slate') and
        (i_units = 'Pallet' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'hot' or i_color = 'chiffon') and
        (i_units = 'Lb' or i_units = 'Gram') and
        (i_size = 'N/A' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


