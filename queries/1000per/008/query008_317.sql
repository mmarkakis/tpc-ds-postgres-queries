
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
                          '44672','68648','54707','10092','45607','69490',
                          '60916','40331','71740','37651','25224',
                          '84866','42512','68954','27957','50998',
                          '24588','36200','68449','78789','25134',
                          '29411','74625','29343','71167','82843',
                          '46260','77997','15680','17116','87408',
                          '26915','18746','84028','85461','78749',
                          '72296','78205','14838','37447','81617',
                          '28721','45932','51577','96407','26288',
                          '25305','65251','55391','76734','73864',
                          '74511','40394','63498','44249','94162',
                          '85164','99530','73589','28250','10868',
                          '70616','56010','29984','91322','71204',
                          '53923','28259','10383','29642','91329',
                          '97524','98544','80910','37866','17105',
                          '56059','68651','25747','50085','46980',
                          '48271','90919','88227','49346','49789',
                          '29966','50502','86589','39678','94157',
                          '86614','38281','36877','75272','69872',
                          '70147','46026','52456','74934','50108',
                          '46752','33743','62510','11929','80216',
                          '53918','99801','45484','95941','59582',
                          '93790','60875','47223','45386','48080',
                          '97252','81815','59910','69381','12194',
                          '32049','92969','32790','97154','11330',
                          '62252','64811','21670','20665','66285',
                          '62259','17686','44945','85770','78710',
                          '85423','85774','82643','78641','43448',
                          '27761','20471','87433','48369','37868',
                          '48631','47094','40794','56253','10926',
                          '87952','92705','65617','99646','76997',
                          '82964','90351','59998','18024','30881',
                          '63990','18392','14963','61793','92588',
                          '23354','51556','61034','45303','33632',
                          '99442','68055','40190','60905','41520',
                          '31640','16969','19502','36630','78047',
                          '14629','30909','84950','15474','62085',
                          '45385','47791','32033','67213','85648',
                          '93796','40066','47487','68885','75376',
                          '79269','33857','43731','91071','56728',
                          '45169','57095','61471','30268','19598',
                          '18418','87435','13928','98139','39040',
                          '70202','34784','95399','42082','10439',
                          '78624','35905','58733','60672','53188',
                          '14075','69501','36325','34375','36308',
                          '47012','76234','73010','30646','85553',
                          '99731','13238','55483','23311','33879',
                          '95047','30634','81777','44235','64101',
                          '79927','27659','52334','61443','58329',
                          '47034','89186','93630','29946','24427',
                          '15493','82741','82859','28102','90301',
                          '33506','57308','25214','81250','87833',
                          '89058','16722','54954','92019','85452',
                          '73356','50369','12865','36293','38258',
                          '74795','94044','66439','12020','34088',
                          '80475','91954','25266','54559','78848',
                          '85116','94144','91296','27932','93342',
                          '26745','81688','57541','77196','96616',
                          '49581','28403','11874','93764','96308',
                          '85972','11254','86154','16305','75579',
                          '87004','52535','11048','77406','16061',
                          '84964','77274','19171','50419','71783',
                          '64770','93005','38512','87060','42036',
                          '60253','28500','38668','76013','56380',
                          '71973','46676','59760','15274','19297',
                          '16399','36842','12193','18621','48817',
                          '58902','33886','82002','23597','15601',
                          '87732','60914','96380','83004','38426',
                          '97158','84216','84664','57951','63675',
                          '37900','43019','70043','24025','87776',
                          '14732','41860','31248','25702','90668',
                          '12315','98879','31753','23204','72176',
                          '81128','68415','82729','87370','95682',
                          '72533','57256','83463','62262','90459',
                          '95734','78218','29731','49691','74649',
                          '44971','33714','34213','96903','74830',
                          '45019','63602','43698','38182','54633',
                          '14385','23062','62908','55390','74935',
                          '94063','29559','85682','17542','98467',
                          '38043','47707','66444','39325')
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
  and d_qoy = 2 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

