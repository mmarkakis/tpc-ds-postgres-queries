
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
                          '67744','95388','58802','72519','62976','61808',
                          '87153','63744','82614','10790','61152',
                          '73597','28449','84216','38757','85617',
                          '55971','85652','97394','68246','62406',
                          '50909','29145','37776','12244','23829',
                          '35500','29861','44895','87580','96855',
                          '98304','22921','84668','21591','33533',
                          '10431','41781','67235','59610','28724',
                          '57314','48622','39486','46673','56992',
                          '33077','40665','19489','59602','19126',
                          '13911','42342','12260','70542','59559',
                          '58932','17579','90431','43525','94887',
                          '65064','56602','86103','68397','28086',
                          '81113','96063','61430','23132','33716',
                          '81750','15133','48911','70753','20645',
                          '62187','35363','63850','37744','90504',
                          '56530','25986','27611','79767','67379',
                          '27553','16223','42065','66156','47567',
                          '68782','45795','67157','65816','50618',
                          '73888','60111','30301','10295','17308',
                          '88488','32387','45131','96062','61781',
                          '14723','74326','41659','52001','62848',
                          '53354','41569','52501','75297','79847',
                          '20316','86350','63054','52254','92369',
                          '46196','33679','28557','11289','94739',
                          '65963','91930','51028','54667','23089',
                          '18975','57094','20944','63372','93025',
                          '36998','37081','12043','60355','14196',
                          '66435','78483','29069','83046','87796',
                          '85372','58392','86146','73081','12078',
                          '21056','45974','97980','20061','42818',
                          '69842','39229','58111','77411','79549',
                          '34868','72206','44415','29641','41950',
                          '34306','65353','93413','81456','38225',
                          '55928','96044','50730','61268','96661',
                          '53623','44729','19034','25202','62028',
                          '70105','49511','81042','46817','64798',
                          '98483','51762','41975','89576','71788',
                          '36912','51568','69895','17266','16007',
                          '49360','68511','54055','70496','45739',
                          '80859','31360','25121','75685','47456',
                          '53927','13708','99429','66578','83446',
                          '62143','16339','82902','17398','32663',
                          '62571','28180','21404','37953','88721',
                          '84989','32080','37053','61495','93858',
                          '76565','98037','16876','42058','30315',
                          '80570','58651','78362','98593','14259',
                          '42851','81946','82248','30596','72923',
                          '57870','35655','20308','17574','34763',
                          '36059','26657','84946','73103','13179',
                          '26249','70733','43135','48526','63733',
                          '94132','75092','82466','49185','65565',
                          '36550','91737','41733','93325','40212',
                          '55504','26607','87945','78911','59044',
                          '46335','31617','12082','68627','16495',
                          '81163','53765','57496','57645','42636',
                          '30920','71162','40779','23510','78533',
                          '76640','13356','63815','24709','60478',
                          '70161','62962','27350','33614','44368',
                          '87776','43484','71471','62448','84920',
                          '48047','26220','68546','86996','88048',
                          '51604','68716','15535','92205','73890',
                          '62811','65688','59785','68362','18442',
                          '49818','12330','88784','76510','29535',
                          '72824','59393','90011','27865','53819',
                          '81403','16933','90285','40443','32212',
                          '66667','18536','47797','28346','98230',
                          '41634','64916','70197','39752','36297',
                          '41576','95695','91693','25846','92142',
                          '32223','77118','68781','41602','31417',
                          '77371','51828','71838','83821','97452',
                          '60575','21988','39774','20268','85099',
                          '97046','50866','21084','37295','64322',
                          '33057','24874','55260','25727','11739',
                          '72905','70608','64179','15294','97126',
                          '70000','11305','22386','79960','89900',
                          '99824','98490','97004','89167','81838',
                          '17260','84163','94930','92297','57456',
                          '61387','41023','35802','82489','69588',
                          '44713','52129','41011','86836')
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

