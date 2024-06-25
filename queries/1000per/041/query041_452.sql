
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 987 and 987+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'plum' or i_color = 'dark') and 
        (i_units = 'Lb' or i_units = 'Case') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'tan' or i_color = 'olive') and
        (i_units = 'Pound' or i_units = 'Gross') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'chiffon' or i_color = 'lace') and
        (i_units = 'Each' or i_units = 'Unknown') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'powder') and
        (i_units = 'Bundle' or i_units = 'Oz') and
        (i_size = 'medium' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'puff' or i_color = 'thistle') and 
        (i_units = 'Box' or i_units = 'Pallet') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'smoke' or i_color = 'midnight') and
        (i_units = 'Cup' or i_units = 'Dram') and
        (i_size = 'small' or i_size = 'petite')
        ) or
        (i_category = 'Men' and
        (i_color = 'misty' or i_color = 'forest') and
        (i_units = 'Tbl' or i_units = 'N/A') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'blue' or i_color = 'papaya') and
        (i_units = 'Bunch' or i_units = 'Carton') and
        (i_size = 'medium' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


