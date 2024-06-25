
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 782 and 782+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'steel' or i_color = 'khaki') and 
        (i_units = 'Each' or i_units = 'Lb') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'gainsboro' or i_color = 'frosted') and
        (i_units = 'Dozen' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'honeydew' or i_color = 'lace') and
        (i_units = 'Dram' or i_units = 'Ounce') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'sky' or i_color = 'dodger') and
        (i_units = 'Tsp' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'N/A')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orchid' or i_color = 'red') and 
        (i_units = 'Carton' or i_units = 'Cup') and
        (i_size = 'petite' or i_size = 'N/A')
        ) or
        (i_category = 'Women' and
        (i_color = 'maroon' or i_color = 'pink') and
        (i_units = 'N/A' or i_units = 'Ton') and
        (i_size = 'medium' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'magenta' or i_color = 'firebrick') and
        (i_units = 'Box' or i_units = 'Tbl') and
        (i_size = 'economy' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'salmon') and
        (i_units = 'Bundle' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'N/A')
        )))) > 0
 order by i_product_name
 limit 100;


