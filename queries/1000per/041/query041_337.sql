
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 975 and 975+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'plum' or i_color = 'slate') and 
        (i_units = 'Bundle' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'chiffon' or i_color = 'antique') and
        (i_units = 'Gross' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'pink' or i_color = 'gainsboro') and
        (i_units = 'Oz' or i_units = 'Dozen') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'linen' or i_color = 'pale') and
        (i_units = 'Lb' or i_units = 'Gram') and
        (i_size = 'medium' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'khaki' or i_color = 'yellow') and 
        (i_units = 'Ounce' or i_units = 'Carton') and
        (i_size = 'medium' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'green' or i_color = 'peru') and
        (i_units = 'Cup' or i_units = 'Tbl') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'cornflower' or i_color = 'azure') and
        (i_units = 'Bunch' or i_units = 'Dram') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'thistle' or i_color = 'goldenrod') and
        (i_units = 'Each' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


