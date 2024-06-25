
select  distinct(i_product_name)
 from item i1
 where i_manufact_id between 792 and 792+40 
   and (select count(*) as item_cnt
        from item
        where (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'turquoise' or i_color = 'aquamarine') and 
        (i_units = 'Gross' or i_units = 'Bundle') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'forest' or i_color = 'burlywood') and
        (i_units = 'Unknown' or i_units = 'Pallet') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'dodger' or i_color = 'chocolate') and
        (i_units = 'Case' or i_units = 'Dozen') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'rosy' or i_color = 'royal') and
        (i_units = 'Each' or i_units = 'Carton') and
        (i_size = 'petite' or i_size = 'small')
        ))) or
       (i_manufact = i1.i_manufact and
        ((i_category = 'Women' and 
        (i_color = 'wheat' or i_color = 'green') and 
        (i_units = 'Dram' or i_units = 'Cup') and
        (i_size = 'petite' or i_size = 'small')
        ) or
        (i_category = 'Women' and
        (i_color = 'dim' or i_color = 'hot') and
        (i_units = 'Pound' or i_units = 'Tbl') and
        (i_size = 'extra large' or i_size = 'large')
        ) or
        (i_category = 'Men' and
        (i_color = 'peach' or i_color = 'chiffon') and
        (i_units = 'Ton' or i_units = 'Gram') and
        (i_size = 'economy' or i_size = 'N/A')
        ) or
        (i_category = 'Men' and
        (i_color = 'light' or i_color = 'cornflower') and
        (i_units = 'Lb' or i_units = 'Oz') and
        (i_size = 'petite' or i_size = 'small')
        )))) > 0
 order by i_product_name
 limit 100;


