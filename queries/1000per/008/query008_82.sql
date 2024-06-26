
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
                          '42556','84268','96310','63763','37727','12253',
                          '39312','83587','32521','46840','74376',
                          '15299','27835','32242','24037','77228',
                          '86035','99003','48503','84232','35648',
                          '40766','52121','13263','83266','81807',
                          '90439','94490','92347','54194','78890',
                          '36115','13474','44928','62109','17683',
                          '87092','38604','34921','17686','39248',
                          '41131','45294','65778','67967','32284',
                          '27289','70486','93831','27336','69637',
                          '11721','44142','34796','89482','60915',
                          '24698','43293','15778','74243','26442',
                          '72030','75408','23024','36761','49931',
                          '83896','19506','29046','55371','17757',
                          '77007','23879','59942','12260','29295',
                          '67527','13181','15537','94790','47842',
                          '11767','55163','88086','48311','22706',
                          '13636','33322','63596','10633','26155',
                          '93811','34557','69141','10598','72614',
                          '62900','61196','29933','62013','18693',
                          '76345','65015','68349','18303','57204',
                          '62339','82357','49411','59503','65486',
                          '96538','85020','29151','46326','12040',
                          '14386','41177','86452','19349','23334',
                          '75691','51152','40198','77679','39918',
                          '45888','73149','91634','60750','70379',
                          '84636','19710','69612','16955','15783',
                          '11668','91074','68017','47730','98956',
                          '57166','24265','40130','46715','56602',
                          '83624','65714','48446','99628','56678',
                          '34575','68914','64664','76507','63807',
                          '11120','97351','11385','54614','54813',
                          '76928','85326','46087','88255','52933',
                          '54389','85473','96883','76100','55126',
                          '22690','39933','78173','81742','72635',
                          '56586','16038','10281','46369','23535',
                          '49762','63978','25363','98212','15054',
                          '71632','28770','78832','48421','13403',
                          '18268','22666','40503','23520','72108',
                          '84535','70804','54879','63239','58658',
                          '14835','29912','43328','41077','98881',
                          '10468','99608','76560','26160','78259',
                          '34262','36937','71265','74450','97797',
                          '37049','93639','35974','84066','60101',
                          '53228','95461','93621','14142','34983',
                          '52081','73180','75556','15230','42764',
                          '25951','21110','48993','32817','72183',
                          '50695','75343','64707','47432','13051',
                          '24803','31239','40744','11950','57297',
                          '47713','50189','19282','96592','51978',
                          '17489','90795','45649','52090','99896',
                          '54819','22652','25591','98739','90334',
                          '46268','95220','50567','57873','15393',
                          '32433','35066','65295','98392','91093',
                          '92124','65422','91104','53403','72742',
                          '11948','49370','81836','27997','38301',
                          '96932','54675','38356','61119','53417',
                          '97796','97907','94245','37019','37182',
                          '98155','57528','75260','23501','97181',
                          '12109','92670','25523','83411','78965',
                          '19035','61204','77950','49587','73730',
                          '99356','81525','79162','98449','49653',
                          '21022','12057','42342','65727','34979',
                          '19773','19161','58583','43080','22681',
                          '95608','61383','76140','85497','66405',
                          '55239','28099','99454','49693','74495',
                          '72743','60430','28506','27216','34712',
                          '96785','19643','34905','91271','10243',
                          '78276','44132','46446','23238','38737',
                          '82807','96237','17597','86882','41724',
                          '24460','26221','67093','33281','27794',
                          '64590','71751','49851','15457','60761',
                          '47269','68371','30301','95110','13443',
                          '42223','83734','73706','58698','54148',
                          '94196','75987','66671','90756','79464',
                          '66570','62969','68341','50962','43756',
                          '80881','59032','87508','49351','41700',
                          '61671','85391','89840','36978','80101',
                          '47667','84635','41969','92405','98581',
                          '29143','51342','73026','17214')
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


