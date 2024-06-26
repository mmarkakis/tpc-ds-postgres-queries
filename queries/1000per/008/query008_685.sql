
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
                          '90395','80323','80657','26489','71057','43836',
                          '48695','90054','98851','15932','20608',
                          '47209','75221','71290','21189','87248',
                          '89697','52112','54599','78117','57084',
                          '32876','68198','22725','93320','12468',
                          '76653','84370','15430','18080','58488',
                          '77091','30402','74845','66796','54547',
                          '65370','71831','44098','70714','74168',
                          '98406','96947','51486','25294','65656',
                          '46490','54178','22548','97782','15589',
                          '71447','28481','11388','45053','46807',
                          '98946','34181','11667','12396','12793',
                          '94300','13155','64020','70348','10629',
                          '50015','12365','52502','13408','82899',
                          '31992','79841','66388','96731','54843',
                          '28280','99734','50663','52740','56953',
                          '46976','79853','37554','42541','10270',
                          '82181','30494','25035','63406','56697',
                          '22108','26742','25561','15587','34673',
                          '45319','44595','97463','63817','90311',
                          '98122','52217','69311','54033','39599',
                          '98132','14145','32198','60338','14901',
                          '99544','10038','61516','51142','74325',
                          '80145','56680','23725','26938','68023',
                          '54742','59021','16132','11825','45774',
                          '43750','33305','79940','77829','14027',
                          '90542','82432','15830','62378','62459',
                          '43675','97895','56497','65243','85705',
                          '64456','37520','88455','47643','59649',
                          '18779','51563','23313','75220','88206',
                          '96644','56021','47219','57523','69718',
                          '24638','97549','25346','20646','52289',
                          '16938','41822','83049','23577','29035',
                          '94749','16401','49252','54052','18232',
                          '45897','63803','74394','77255','52969',
                          '37805','58014','49230','31611','97910',
                          '80882','57007','95074','41299','33599',
                          '26152','61760','40688','80364','42540',
                          '35191','78602','39837','68641','36019',
                          '45353','77892','35042','21072','20131',
                          '18675','13567','44060','38032','54329',
                          '39675','20931','98940','32548','65436',
                          '31283','27762','38202','42957','24178',
                          '24237','24460','57741','84701','53049',
                          '14353','73907','16078','27838','29031',
                          '18518','44142','82544','82105','15156',
                          '75809','27923','60296','84361','49487',
                          '88511','49798','85991','31745','80355',
                          '61834','61868','85610','29733','26126',
                          '42178','92719','50148','59653','62369',
                          '16919','20230','18301','13817','22923',
                          '13291','53176','25267','63485','24885',
                          '48705','82064','69332','30180','98188',
                          '15780','24940','62637','22879','91636',
                          '85074','77527','15957','18077','49586',
                          '44150','28254','77940','59474','77020',
                          '97430','51825','21102','96484','51062',
                          '70798','61749','58987','72546','94980',
                          '69541','46103','97433','52800','89251',
                          '88200','59761','58608','75175','80383',
                          '53631','71080','39464','96388','78607',
                          '68960','32994','78083','58291','88739',
                          '88531','69189','48491','98569','89740',
                          '65671','75772','85309','49855','65908',
                          '64581','18842','69694','68315','50810',
                          '25799','60035','52511','69568','68958',
                          '77138','30563','68444','10279','96347',
                          '70331','52786','94135','95599','91373',
                          '51612','97065','37949','10077','47614',
                          '32859','95538','76937','61510','60564',
                          '49559','92371','44056','80713','65685',
                          '37986','99000','69976','28558','43239',
                          '45572','25439','77011','37059','75890',
                          '10180','36385','79084','30708','83746',
                          '31169','66807','16972','32476','59643',
                          '38952','53744','38698','69611','31799',
                          '20528','50760','38190','34647','66964',
                          '60109','55897','85879','41094','70894',
                          '24234','32923','44718','37734','78513',
                          '74885','95555','54168','32336')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


