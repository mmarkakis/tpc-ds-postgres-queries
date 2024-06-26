
select  s_store_name
      ,sum(ss_net_profit)
 from store_sales
     ,date_dim
     ,store,
     (select ca_zip
     from (
      SELECT substr(ca_zip,1,5) ca_zip
      FROM customer_address
      WHERE substr(ca_zip,1,5) IN (
                          '47886','39579','30751','34204','94966','70837',
                          '61413','67947','42116','65701','73113',
                          '96301','84483','27052','74418','60322',
                          '94032','25121','40853','93069','64541',
                          '40416','99924','98946','76850','83113',
                          '90756','22166','82596','77110','25218',
                          '66301','80264','73044','72742','13223',
                          '63510','46414','38355','63918','80628',
                          '39168','30559','87216','93597','11259',
                          '86657','89087','84343','64879','16266',
                          '50054','10277','33595','11294','32882',
                          '51405','78113','89959','12063','67324',
                          '70559','37485','17859','51483','46315',
                          '69829','60616','98157','94861','37935',
                          '59188','13757','46126','11835','88335',
                          '78631','86823','50933','86457','95974',
                          '66115','98528','83006','99702','57522',
                          '75216','42909','20452','50047','18562',
                          '58413','70814','43950','13565','12151',
                          '84250','12062','71323','21439','96722',
                          '44449','54371','91941','27632','12476',
                          '29036','22375','78838','63672','83321',
                          '43124','85154','48784','17089','99373',
                          '37667','77082','39816','92051','43907',
                          '91540','43279','92921','89147','31240',
                          '44310','63544','30091','91126','29100',
                          '54414','17479','54680','14136','49704',
                          '54649','76372','86950','92677','73012',
                          '89203','57272','30419','12819','71620',
                          '70179','73793','63542','38096','14309',
                          '45634','53755','42694','97408','39678',
                          '91033','25263','76868','20529','89341',
                          '28189','64060','33162','53061','76524',
                          '29450','78956','54362','97937','77009',
                          '24991','60669','29121','54224','28475',
                          '52830','54449','21032','97167','31155',
                          '41163','64840','30987','37848','21348',
                          '71875','12707','65638','16093','81069',
                          '92943','93423','34780','15358','16486',
                          '89800','49239','62697','86505','47960',
                          '88445','35176','19207','86046','32714',
                          '33130','91385','24858','42738','13101',
                          '56420','20804','82522','65006','29267',
                          '83559','39586','80557','46034','35619',
                          '12305','63688','21160','21751','43582',
                          '66273','47910','11497','26084','77319',
                          '79340','51037','16247','20515','31952',
                          '11688','31708','16119','87897','96297',
                          '18433','88180','69204','43655','36100',
                          '25074','47811','22570','82437','52075',
                          '68390','18826','43641','89011','96595',
                          '11614','92578','36758','55838','49598',
                          '25755','33333','77790','11589','99239',
                          '85395','83872','14863','49962','73984',
                          '57313','93224','50307','48375','88311',
                          '68375','30782','77901','62833','73539',
                          '10451','10647','45350','91525','57270',
                          '84270','20535','17199','49265','82395',
                          '14757','79262','67167','75772','12804',
                          '92220','90895','82999','54364','39585',
                          '69946','66926','39000','73457','31248',
                          '62392','17653','23907','74061','43725',
                          '94305','16341','81423','68855','48202',
                          '97622','52183','18101','39077','23036',
                          '96956','99386','58338','66747','67775',
                          '93408','63114','25327','91401','72857',
                          '29640','96968','59631','25019','70442',
                          '83370','68300','10055','80792','18633',
                          '87689','59260','90005','58825','49419',
                          '67808','39413','17517','42413','55926',
                          '55782','49678','48627','64251','85398',
                          '29042','86254','50416','51212','27980',
                          '37704','11767','12381','73863','45912',
                          '11539','25719','89840','50552','10004',
                          '35209','59974','20069','41074','43686',
                          '76246','11332','74145','40743','67422',
                          '75757','92713','59791','45195','50961',
                          '55630','48010','53582','42354','54987',
                          '77345','32863','95241','90947','58108',
                          '97800','97819','27311','23192')
     intersect
      select ca_zip
      from (SELECT substr(ca_zip,1,5) ca_zip,count(*) cnt
            FROM customer_address, customer
            WHERE ca_address_sk = c_current_addr_sk and
                  c_preferred_cust_flag='Y'
            group by ca_zip
            having count(*) > 10)A1)A2) V1
 where ss_store_sk = s_store_sk
  and ss_sold_date_sk = d_date_sk
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


