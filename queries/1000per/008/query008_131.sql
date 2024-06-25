
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
                          '39813','65156','87666','13162','16958','29835',
                          '29462','54359','28653','82065','90915',
                          '77587','17097','91879','36234','52330',
                          '23076','86160','34064','13257','70456',
                          '80722','74015','85456','52514','52948',
                          '41929','18885','85845','94632','87663',
                          '20699','34445','16130','36229','66992',
                          '91988','24285','51118','29372','54909',
                          '10239','30756','28427','15955','15104',
                          '50662','58959','66476','72091','17575',
                          '30085','94808','63055','86249','81889',
                          '80963','98574','22840','77986','31273',
                          '77255','81598','65639','63295','89355',
                          '22909','19027','75373','27538','94012',
                          '77632','67481','27313','62833','32603',
                          '93945','43163','82126','13418','82342',
                          '53661','93858','21116','60949','71472',
                          '28182','58127','26420','91550','85614',
                          '66887','11756','22629','74816','53494',
                          '51775','24311','68984','11530','14068',
                          '57595','34924','49335','33024','26277',
                          '82708','42765','39018','93186','31756',
                          '16789','66732','89082','99158','10848',
                          '17267','59549','21396','26666','45214',
                          '87695','61241','11353','40425','98277',
                          '19254','94900','24967','57867','37983',
                          '58269','70303','79331','74976','76149',
                          '41448','62585','22756','80124','25879',
                          '82456','56434','79646','73550','86434',
                          '14909','77643','58603','28385','11985',
                          '56616','19710','58038','79169','71950',
                          '69784','75446','55766','64872','11117',
                          '27436','56658','35553','86075','75399',
                          '22548','75544','69659','10847','11902',
                          '63085','50188','64538','15083','58011',
                          '29601','13665','84934','71015','85956',
                          '22256','38465','90956','20920','58370',
                          '64419','61513','48320','17260','93671',
                          '93889','86753','33004','39968','13228',
                          '17840','77741','52803','76305','95545',
                          '67657','51930','45284','86548','93157',
                          '31421','28739','42559','40260','53489',
                          '43190','58134','84622','82153','91096',
                          '31362','93720','71474','32914','76281',
                          '36340','91640','15098','59974','63651',
                          '53800','35558','24951','89253','12161',
                          '96526','11296','24010','81447','46146',
                          '15317','51881','48764','63372','82814',
                          '10919','66189','77207','67603','53366',
                          '13388','49909','18535','54157','70650',
                          '37122','91734','24128','54130','35715',
                          '88482','90436','44111','42760','70696',
                          '42726','38166','58964','71037','42304',
                          '49832','36719','93777','68529','65941',
                          '92709','75835','45918','51209','90669',
                          '16405','27909','68432','30866','53192',
                          '43668','59462','84595','65787','17418',
                          '54289','97148','70797','13857','68015',
                          '18124','70764','53531','66797','14097',
                          '16424','46837','95900','47055','77885',
                          '57421','33389','60712','97874','63968',
                          '18250','55633','68969','18590','75559',
                          '15548','60434','92728','45212','28996',
                          '74726','23287','78702','30530','47574',
                          '16612','37461','33308','63287','53203',
                          '16005','92900','51675','20896','99907',
                          '11717','34672','54552','93730','60304',
                          '90831','71466','98381','96541','10391',
                          '86602','10045','65929','48351','93870',
                          '64726','82913','86761','73014','12376',
                          '75380','15461','13691','40265','93459',
                          '36438','48464','12302','77912','49532',
                          '40893','22119','58444','11272','22942',
                          '51356','60921','92285','99482','80020',
                          '84921','92356','31734','15810','17973',
                          '96188','69916','83943','15126','17198',
                          '33776','25990','44653','51425','33032',
                          '20862','37314','82259','38055','34356',
                          '70035','94011','68202','71587','51899',
                          '24231','23530','90973','34184')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


