
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 802 and 802+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'chiffon' or i_color = 'slate') and 
        (i_units = 'N/A' or i_units = 'Lb') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'pink' or i_color = 'peach') and
        (i_units = 'Dozen' or i_units = 'Pound') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'bisque' or i_color = 'lace') and
        (i_units = 'Oz' or i_units = 'Carton') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'lavender' or i_color = 'goldenrod') and
        (i_units = 'Ounce' or i_units = 'Unknown') and
        (i_size = 'N/A' or i_size = 'petite')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'midnight' or i_color = 'white') and 
        (i_units = 'Bunch' or i_units = 'Gram') and
        (i_size = 'N/A' or i_size = 'petite')
        ) or
        (i_category = 'Women' and
        (i_color = 'almond' or i_color = 'forest') and
        (i_units = 'Dram' or i_units = 'Ton') and
        (i_size = 'economy' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'peru' or i_color = 'snow') and
        (i_units = 'Bundle' or i_units = 'Cup') and
        (i_size = 'large' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'ghost' or i_color = 'honeydew') and
        (i_units = 'Tbl' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'petite')
        )))) > 0
 order by i_product_name
 limit 100;


