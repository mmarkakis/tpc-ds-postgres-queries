
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
                          '24280','20698','59977','99944','17963','15607',
                          '71877','33272','54255','87846','61103',
                          '85761','25075','67482','64977','21244',
                          '71609','34623','68418','76352','37520',
                          '93053','20027','14019','30696','38036',
                          '93983','29199','53297','40912','97307',
                          '76470','91710','29292','69728','82065',
                          '41668','47459','43475','17781','89289',
                          '41707','85842','25396','91070','46777',
                          '35054','81348','54573','86503','58532',
                          '15213','59515','28465','20881','18664',
                          '80848','26187','51834','74973','12483',
                          '55399','36151','77044','26551','38168',
                          '33394','81855','78882','50905','55371',
                          '90324','93248','72502','15229','78960',
                          '46721','18989','99289','82798','34860',
                          '22691','95373','57139','72844','95347',
                          '83681','74281','18573','73139','36915',
                          '59041','40503','34378','18824','64740',
                          '32445','20455','21616','55440','67600',
                          '65685','71057','12594','88054','99055',
                          '51999','12076','69516','76298','31996',
                          '73256','85418','74200','43037','83591',
                          '66421','51443','54484','57184','59862',
                          '29847','61354','44718','94466','15257',
                          '84998','41743','11502','63321','47331',
                          '81174','67783','95949','92157','17639',
                          '49806','20129','43994','93026','22857',
                          '34510','35403','51784','97442','10730',
                          '22172','37874','33994','78154','11972',
                          '83148','38838','55937','16610','14188',
                          '92443','73702','20456','17862','29484',
                          '94063','85718','94312','77895','42906',
                          '41151','35760','26726','95179','24231',
                          '14633','62108','47058','63351','67950',
                          '19744','17977','75823','36788','59612',
                          '43960','59857','28301','90635','61560',
                          '65011','18561','48034','74166','89895',
                          '89899','65424','11726','56885','34132',
                          '99562','86569','72634','97572','84257',
                          '60827','67155','11721','33162','82964',
                          '12630','96477','20966','17498','89294',
                          '14956','93762','80615','36802','29669',
                          '25161','77685','53001','12312','53451',
                          '94886','29535','10918','17029','73177',
                          '97130','18156','47420','51259','83458',
                          '46543','33636','73429','51538','39173',
                          '10512','99075','25399','96842','23517',
                          '70517','51878','12481','87674','36675',
                          '21680','14970','24290','25192','33532',
                          '42191','51852','49040','29285','47094',
                          '61656','90624','44763','66489','68727',
                          '54896','88243','69156','61240','75836',
                          '69346','79771','59081','78376','20002',
                          '93135','49821','63976','86544','54960',
                          '43741','91199','16407','66698','11998',
                          '20148','18582','19683','43513','19908',
                          '41182','34380','95550','78147','37937',
                          '58970','31105','61030','37487','19590',
                          '76236','65562','13506','51397','24126',
                          '85202','99812','23404','56528','31345',
                          '53000','77061','64700','73447','53393',
                          '42343','80482','76105','47689','50598',
                          '41834','31165','73645','81640','33671',
                          '51731','55961','69150','56191','89425',
                          '58363','42486','34169','61843','18117',
                          '89609','91686','63150','43135','88144',
                          '36174','26455','11157','28867','73404',
                          '48436','95972','66779','29109','71690',
                          '47064','64832','37323','69153','84057',
                          '94093','54109','95378','64163','72072',
                          '20674','28102','95156','48968','72147',
                          '55042','52797','75814','63652','61344',
                          '61816','87029','80840','77151','39575',
                          '71879','87501','43747','60316','52363',
                          '86720','86045','14555','86894','37319',
                          '70588','98744','78123','20054','49008',
                          '25811','95882','96024','80196','50848',
                          '78179','34808','58811','32946','76022',
                          '93358','25029','88744','59717')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


