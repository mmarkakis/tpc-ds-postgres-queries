
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 842 and 842+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'medium' or i_color = 'bisque') and 
        (i_units = 'Tbl' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'rosy' or i_color = 'lime') and
        (i_units = 'Bunch' or i_units = 'Carton') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'cyan' or i_color = 'pale') and
        (i_units = 'N/A' or i_units = 'Lb') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'sky' or i_color = 'chiffon') and
        (i_units = 'Ton' or i_units = 'Cup') and
        (i_size = 'petite' or i_size = 'economy')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'steel' or i_color = 'cornsilk') and 
        (i_units = 'Dram' or i_units = 'Tsp') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Women' and
        (i_color = 'antique' or i_color = 'snow') and
        (i_units = 'Oz' or i_units = 'Gross') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Men' and
        (i_color = 'almond' or i_color = 'burnished') and
        (i_units = 'Case' or i_units = 'Dozen') and
        (i_size = 'medium' or i_size = 'extra large')
        ) or
        (i_category = 'Men' and
        (i_color = 'red' or i_color = 'indian') and
        (i_units = 'Gram' or i_units = 'Unknown') and
        (i_size = 'petite' or i_size = 'economy')
        )))) > 0
 order by i_product_name
 limit 100;


