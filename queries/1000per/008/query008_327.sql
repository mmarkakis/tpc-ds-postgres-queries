
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
                          '17877','45939','68947','96430','13424','77845',
                          '72792','11331','59776','61832','25332',
                          '46474','63749','50901','13098','63418',
                          '62142','40407','78011','33973','81400',
                          '53357','10738','54754','36458','18907',
                          '48110','81660','19523','15266','27489',
                          '85915','35225','42572','48545','19945',
                          '90870','68036','26500','93113','84316',
                          '76620','34271','45421','92443','71252',
                          '68712','56495','45527','65583','50365',
                          '28698','67755','37238','56285','11743',
                          '71064','10665','84701','19250','52692',
                          '23894','21626','54179','24851','84477',
                          '33766','22754','70038','56118','39010',
                          '68142','75214','91747','42295','98475',
                          '35819','18146','49108','78387','99156',
                          '57775','22959','13133','80334','58280',
                          '22133','62072','82057','56778','98539',
                          '11189','82546','71516','59585','57186',
                          '55469','82345','28153','73506','18912',
                          '74220','61191','57893','72894','39532',
                          '33843','76640','21808','76002','37087',
                          '25474','71012','32335','46215','92060',
                          '73549','46999','91287','91639','61619',
                          '47979','55346','86325','16887','49222',
                          '16892','93482','98647','40956','28302',
                          '88214','38758','55194','92913','29488',
                          '87682','94040','57645','81792','64090',
                          '45180','38663','51119','98998','24442',
                          '80923','75994','77079','44609','23477',
                          '67816','53211','71681','94760','53714',
                          '73412','17791','78568','24759','98291',
                          '51061','21518','13280','69046','46481',
                          '92871','68402','93393','64116','56090',
                          '12265','21540','40088','28543','23897',
                          '21918','26432','32904','77898','40304',
                          '44742','58788','64073','39454','69941',
                          '40529','39557','59544','81980','86427',
                          '75723','84584','46531','24395','27268',
                          '76975','21267','37214','97372','49040',
                          '58958','47999','55056','33848','87091',
                          '59721','88122','10861','32970','82207',
                          '81671','39627','12135','82425','35555',
                          '96009','47861','23977','57340','81397',
                          '23449','67108','60861','30254','22847',
                          '91185','70990','79494','77018','95795',
                          '26929','19900','63567','82768','10545',
                          '89077','59047','23736','33561','99962',
                          '93462','33046','76556','24855','98651',
                          '10715','44389','28181','15345','50074',
                          '21244','74382','56745','19225','89148',
                          '30915','89513','63284','80086','98919',
                          '90227','11821','14804','64665','45687',
                          '71524','21162','68299','23931','70258',
                          '30973','44583','92801','28606','82892',
                          '24644','43946','12967','96214','19350',
                          '17667','44700','82576','15494','54607',
                          '28916','15723','72149','82737','19511',
                          '83829','34996','86602','60911','81877',
                          '88791','24127','93093','77086','64842',
                          '13833','61532','58009','20166','77896',
                          '10795','76718','80244','30873','80175',
                          '34658','79990','87073','80341','87049',
                          '97964','39575','57072','58223','55092',
                          '69369','16866','34946','33298','61284',
                          '81131','69467','33098','17319','32259',
                          '78728','12859','63978','99219','57053',
                          '38097','11730','58183','87701','37659',
                          '92665','91044','40782','79316','82860',
                          '40677','47866','47771','55730','87118',
                          '65014','18552','23756','70325','63397',
                          '97861','82306','65431','63186','29313',
                          '29880','45356','53157','63772','84122',
                          '95924','14096','39264','59889','92059',
                          '53513','59631','47815','78580','90697',
                          '42543','25132','61491','63669','98486',
                          '11613','28691','10156','73836','61083',
                          '14602','32934','86252','74874','65467',
                          '49561','13000','46300','96335','74160',
                          '40169','21902','97989','23646')
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

