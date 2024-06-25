
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 829 and 829+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'sky' or i_color = 'pale') and 
        (i_units = 'Tsp' or i_units = 'Gram') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'honeydew' or i_color = 'lace') and
        (i_units = 'Ton' or i_units = 'Bundle') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'powder') and
        (i_units = 'N/A' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'blush' or i_color = 'green') and
        (i_units = 'Oz' or i_units = 'Unknown') and
        (i_size = 'economy' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'midnight' or i_color = 'slate') and 
        (i_units = 'Tbl' or i_units = 'Pallet') and
        (i_size = 'economy' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'blue' or i_color = 'brown') and
        (i_units = 'Carton' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'cyan' or i_color = 'cornsilk') and
        (i_units = 'Ounce' or i_units = 'Each') and
        (i_size = 'medium' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'peru' or i_color = 'lawn') and
        (i_units = 'Dozen' or i_units = 'Dram') and
        (i_size = 'economy' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


