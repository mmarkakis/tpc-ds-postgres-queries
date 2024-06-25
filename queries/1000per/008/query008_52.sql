
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
                          '17522','51953','63415','42265','47309','85599',
                          '83793','44185','32916','23467','33800',
                          '68404','60274','61126','62223','36740',
                          '36701','58819','29940','68857','95556',
                          '94284','19539','15702','63595','63274',
                          '99073','57594','74029','30141','91952',
                          '29140','13744','49558','26915','55812',
                          '52504','48859','63597','55757','80821',
                          '84540','49019','98383','21931','71460',
                          '53542','44192','46284','20293','27991',
                          '28151','85420','55831','40868','39973',
                          '42250','15878','95403','37928','45358',
                          '73612','16951','78823','24202','23226',
                          '83837','94463','62145','82151','15487',
                          '33300','27785','75440','43822','30179',
                          '97872','71361','28562','93454','28241',
                          '77953','71579','17140','88410','65497',
                          '53454','16194','11959','20423','56914',
                          '81615','68918','85674','73814','83622',
                          '30216','86961','94612','74428','11303',
                          '36645','51252','73318','33787','24188',
                          '79086','75529','74955','20245','49341',
                          '23605','11794','44205','33380','25753',
                          '73120','77593','52078','13600','42300',
                          '40387','63746','66465','50339','41786',
                          '72351','65577','70268','64687','31056',
                          '51550','15134','10638','61960','77209',
                          '41218','51829','64183','97066','84379',
                          '47347','13709','21433','92750','86092',
                          '37913','28428','50078','94786','41439',
                          '34483','77261','54901','60732','94552',
                          '91929','18360','70961','45260','91965',
                          '17640','97866','30893','30978','17317',
                          '33114','82671','89737','78875','16745',
                          '79647','90801','71948','78448','61790',
                          '86154','69322','47117','34143','90094',
                          '98641','76983','45653','98088','31956',
                          '65936','51459','49132','83362','14671',
                          '63107','57274','46997','71705','15650',
                          '19020','36804','29106','39469','68283',
                          '38436','30671','56466','63174','52306',
                          '83994','13583','88960','13169','31351',
                          '17930','90566','39583','57268','36313',
                          '84115','77546','80700','30502','46559',
                          '88169','11173','90242','68782','55639',
                          '68752','49432','89072','28270','38006',
                          '82129','51214','71319','54200','34899',
                          '49145','15980','27024','58580','82363',
                          '63090','21813','57462','82188','12556',
                          '98855','56251','58406','92020','45737',
                          '75726','84054','75320','29211','83928',
                          '76872','94002','38425','77336','72794',
                          '17025','15485','64866','84004','24238',
                          '94039','40878','43113','75948','42752',
                          '17479','37847','82555','42646','68352',
                          '13062','52299','52350','15284','39059',
                          '87087','75137','55880','35262','81575',
                          '80422','76079','35044','36747','73885',
                          '20373','14722','74973','20275','68895',
                          '22906','65128','43088','21648','77089',
                          '42918','34908','72538','47839','98214',
                          '96691','71202','12757','89217','61368',
                          '70207','65649','66802','33775','35151',
                          '29381','31652','37488','78927','67659',
                          '46966','35799','67192','83963','64550',
                          '31191','20132','81268','81830','10041',
                          '33918','44875','80891','91181','76010',
                          '61659','30667','87041','35645','18466',
                          '23449','87861','22553','85306','48352',
                          '76174','88592','49645','23204','52845',
                          '78838','89520','57389','75280','39581',
                          '40360','61239','76317','11638','37664',
                          '15562','85925','65304','52765','96157',
                          '80449','47600','69744','74979','85462',
                          '87231','73716','61458','10655','73866',
                          '79839','16068','28089','74071','47855',
                          '93232','60057','22138','52001','39948',
                          '23885','89155','16838','84127','29627',
                          '70014','35630','70760','42606','55514',
                          '47063','78869','49284','98824')
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

