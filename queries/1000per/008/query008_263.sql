
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
                          '29239','20645','22824','37574','45438','66496',
                          '49796','88020','26777','32606','46186',
                          '80838','85437','60476','77834','94169',
                          '92154','50899','97019','28681','55295',
                          '87248','36651','13525','44754','35286',
                          '97142','88321','82563','31734','43766',
                          '71615','46711','20114','89105','48946',
                          '18013','21914','11804','38784','87914',
                          '19302','76752','16807','51688','68996',
                          '12456','10941','64439','13246','78506',
                          '28069','80899','96291','39418','98533',
                          '35562','54355','78072','89672','84132',
                          '23172','24137','27891','70564','23709',
                          '10672','80655','70952','30110','64610',
                          '28235','16999','28888','86333','91857',
                          '94274','37663','96485','93325','82741',
                          '99867','72376','80350','15536','67767',
                          '11070','63503','44413','25191','87811',
                          '80296','80637','73149','21094','78813',
                          '96237','28462','79615','94184','15028',
                          '66213','21609','47748','50677','83959',
                          '55799','30154','35002','75985','55905',
                          '57329','24962','50879','94069','49315',
                          '88711','67642','33323','34375','33925',
                          '59879','68365','75955','61134','37360',
                          '32237','39474','70976','35559','41565',
                          '79257','28876','37264','95366','95993',
                          '55202','44744','26926','67811','38872',
                          '79468','78375','16825','62279','58687',
                          '40862','30196','74792','78770','10323',
                          '66578','46967','90043','67986','81571',
                          '52252','82746','58576','60015','25183',
                          '59084','89929','51421','47704','79729',
                          '70871','69656','79629','90035','13781',
                          '85774','31271','19433','41005','34836',
                          '66655','92966','92492','26983','42419',
                          '60159','92311','20890','74117','51112',
                          '83069','89127','10677','92777','33179',
                          '62080','21915','32089','52598','36250',
                          '71215','86976','72694','28134','15616',
                          '90338','58829','32273','74439','78597',
                          '62637','91686','13896','93237','24198',
                          '68510','73446','30586','90595','44730',
                          '55216','19095','97357','26941','75967',
                          '83513','61927','47465','27926','74273',
                          '19861','95095','40558','24105','28634',
                          '13171','34406','38831','80193','60023',
                          '74775','61780','54807','28857','10297',
                          '89982','87936','37410','38104','22486',
                          '10863','69756','33454','58299','33980',
                          '90356','16755','79402','43932','40903',
                          '74409','62391','30390','89688','35214',
                          '84841','55466','23196','10785','69504',
                          '48833','77202','94466','34064','98848',
                          '20843','40747','80967','30443','37116',
                          '95127','67297','30240','93308','10393',
                          '87721','58870','35430','37922','78461',
                          '75266','36271','99092','32981','56341',
                          '61870','11141','35524','89524','89582',
                          '92247','36757','33103','54734','16556',
                          '63352','34963','39603','87795','15240',
                          '20129','49816','83178','20271','25116',
                          '97230','11564','14136','83305','31337',
                          '50609','35269','83569','37979','27566',
                          '45469','95078','44084','52204','55261',
                          '17691','88334','96214','63992','46829',
                          '32736','70951','16308','23895','51758',
                          '44513','20467','92996','39936','51526',
                          '86178','48873','66770','23021','70713',
                          '36402','27303','42198','19069','85582',
                          '50422','21338','12112','21088','33791',
                          '73270','19110','69302','77605','88702',
                          '69344','74357','76412','70493','22763',
                          '88857','66184','45972','94290','12609',
                          '74335','33972','51364','88094','12087',
                          '43760','66486','24026','50612','64667',
                          '26855','79298','45385','92133','25704',
                          '44078','71570','42546','65133','22603',
                          '95925','81725','16889','35625','25620',
                          '96860','79762','32775','41115')
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

