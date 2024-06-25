
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 912 and 912+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'black' or i_color = 'lace') and 
        (i_units = 'Tsp' or i_units = 'Bunch') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'sky' or i_color = 'chocolate') and
        (i_units = 'Case' or i_units = 'Bundle') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'linen' or i_color = 'turquoise') and
        (i_units = 'Carton' or i_units = 'N/A') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'midnight' or i_color = 'navy') and
        (i_units = 'Lb' or i_units = 'Tbl') and
        (i_size = 'N/A' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'plum' or i_color = 'maroon') and 
        (i_units = 'Dram' or i_units = 'Pallet') and
        (i_size = 'N/A' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'hot' or i_color = 'burnished') and
        (i_units = 'Oz' or i_units = 'Gross') and
        (i_size = 'petite' or i_size = 'economy')
        ) or
        (i_category = 'Men' and
        (i_color = 'orange' or i_color = 'saddle') and
        (i_units = 'Dozen' or i_units = 'Cup') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'firebrick' or i_color = 'drab') and
        (i_units = 'Each' or i_units = 'Box') and
        (i_size = 'N/A' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


