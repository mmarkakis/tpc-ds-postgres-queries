
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
                          '45537','67936','44171','39171','71030','46797',
                          '31296','19739','40135','12639','85861',
                          '40620','25613','66286','58058','53654',
                          '26338','94082','84394','49852','29297',
                          '35116','74658','83378','96854','46262',
                          '97337','28730','51041','17839','92080',
                          '63395','91078','96901','88302','88265',
                          '11593','46801','90356','39355','22403',
                          '81918','66834','94536','24873','82842',
                          '32258','70562','11821','62777','34907',
                          '88738','58303','80150','86821','41373',
                          '71628','54539','66315','48515','55911',
                          '50329','97867','18588','20229','20186',
                          '54918','72407','41331','23180','93598',
                          '36487','67538','79230','40991','30928',
                          '56491','41615','17403','59023','34284',
                          '97524','19074','94315','88435','34942',
                          '53820','23063','51639','32778','37591',
                          '25877','74056','47310','48885','40900',
                          '12038','13353','72947','51417','81844',
                          '17617','14008','53869','25989','32628',
                          '50929','21683','32989','90004','76220',
                          '27788','77713','87629','37641','90266',
                          '80006','71216','73340','34241','50099',
                          '94239','39654','88891','31142','10757',
                          '25054','38279','31956','91441','17966',
                          '77110','98561','10879','64686','62525',
                          '91007','20956','74421','89368','53577',
                          '41394','41285','83213','40671','69786',
                          '32157','99083','15854','66362','36044',
                          '85186','77854','66791','10307','91301',
                          '17172','52886','54219','19955','93086',
                          '42171','58852','80851','50601','55257',
                          '92834','66419','30187','13957','50596',
                          '16816','98249','45291','55041','68760',
                          '97285','68517','30049','94156','13130',
                          '23286','33017','85635','19561','42671',
                          '10133','83180','85060','91966','36691',
                          '70722','95957','42585','92560','69401',
                          '75599','60441','69845','25791','42228',
                          '37077','82111','79953','93469','10252',
                          '84344','16018','47464','18828','48451',
                          '57973','15202','80151','90691','33565',
                          '66646','50756','12653','31209','64993',
                          '17648','68800','62468','44120','70758',
                          '26325','97011','21270','77832','93109',
                          '42322','73361','80562','34769','12603',
                          '45052','51619','29519','22593','79858',
                          '35444','90073','13616','27796','44421',
                          '32173','14108','31159','15676','38460',
                          '62458','47693','71197','21080','64983',
                          '34568','30482','31452','89149','99952',
                          '74287','21360','66537','45741','57024',
                          '13172','59292','53357','10336','93147',
                          '49386','26168','79187','35948','55458',
                          '94693','37625','66927','51499','11735',
                          '88160','83714','92963','51724','58399',
                          '81197','25210','94299','97681','98245',
                          '92116','47868','23525','52799','95173',
                          '46198','36810','50012','23845','98106',
                          '68717','87741','70285','55697','31780',
                          '35103','33461','56831','69360','90006',
                          '45516','70040','84274','77422','58395',
                          '75633','24236','83930','73983','99420',
                          '65457','45136','77401','49571','22298',
                          '39657','88548','33126','53903','24212',
                          '99602','36375','48990','29205','38737',
                          '10634','36477','14718','99351','30893',
                          '33341','70259','10575','88534','97960',
                          '23508','84856','99814','56826','52127',
                          '48019','75525','91797','38515','77987',
                          '11562','86912','77420','57433','97205',
                          '74925','18968','12630','28499','56054',
                          '86820','67251','88725','64014','22942',
                          '56315','17400','74784','64430','85404',
                          '89062','76118','75540','28694','28618',
                          '49422','14701','65371','37484','59986',
                          '37197','14580','82428','96148','12220',
                          '19674','30665','26715','98915','31436',
                          '28166','51587','45726','83227')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

