
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 732 and 732+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'magenta' or i_color = 'rosy') and 
        (i_units = 'Dozen' or i_units = 'Case') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'ghost' or i_color = 'blue') and
        (i_units = 'Gram' or i_units = 'Carton') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'sky' or i_color = 'slate') and
        (i_units = 'Each' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'navy' or i_color = 'red') and
        (i_units = 'Pound' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'medium')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'drab' or i_color = 'bisque') and 
        (i_units = 'Bundle' or i_units = 'Tbl') and
        (i_size = 'small' or i_size = 'medium')
        ) or
        (i_category = 'Women' and
        (i_color = 'papaya' or i_color = 'chiffon') and
        (i_units = 'Lb' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'maroon' or i_color = 'violet') and
        (i_units = 'Cup' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'sandy' or i_color = 'olive') and
        (i_units = 'Oz' or i_units = 'Pallet') and
        (i_size = 'small' or i_size = 'medium')
        )))) > 0
 order by i_product_name
 limit 100;


