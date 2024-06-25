
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 810 and 810+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'light' or i_color = 'dim') and 
        (i_units = 'Oz' or i_units = 'Lb') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'rosy' or i_color = 'navy') and
        (i_units = 'Dozen' or i_units = 'Gross') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'wheat' or i_color = 'blue') and
        (i_units = 'N/A' or i_units = 'Gram') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'plum' or i_color = 'deep') and
        (i_units = 'Cup' or i_units = 'Ton') and
        (i_size = 'small' or i_size = 'extra large')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'orchid' or i_color = 'sandy') and 
        (i_units = 'Tsp' or i_units = 'Case') and
        (i_size = 'small' or i_size = 'extra large')
        ) or
        (i_category = 'Women' and
        (i_color = 'firebrick' or i_color = 'rose') and
        (i_units = 'Bundle' or i_units = 'Each') and
        (i_size = 'large' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'slate' or i_color = 'blanched') and
        (i_units = 'Unknown' or i_units = 'Ounce') and
        (i_size = 'petite' or i_size = 'medium')
        ) or
        (i_category = 'Men' and
        (i_color = 'medium' or i_color = 'royal') and
        (i_units = 'Tbl' or i_units = 'Pound') and
        (i_size = 'small' or i_size = 'extra large')
        )))) > 0
 order by i_product_name
 limit 100;


