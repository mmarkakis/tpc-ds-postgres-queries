
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
                          '60497','39387','91636','28994','58262','28445',
                          '38662','68194','30156','50548','10330',
                          '29860','15374','82959','24953','55484',
                          '51201','55550','57744','58827','72072',
                          '70091','43274','90241','49553','62892',
                          '60019','89557','52108','31967','66630',
                          '55687','87500','38299','42455','31799',
                          '73895','57620','44581','70289','51109',
                          '98483','61005','30918','44704','27395',
                          '67610','19153','67030','71050','71351',
                          '27065','99221','16391','24670','34535',
                          '13876','32238','80526','78491','90475',
                          '65209','28326','19387','55142','16095',
                          '20677','27276','85087','55819','23048',
                          '35701','91042','65378','65113','41129',
                          '24381','24784','39606','86612','96873',
                          '35868','90535','25410','46542','24268',
                          '99110','37827','22955','58232','55362',
                          '44580','41104','37408','39313','85084',
                          '45081','81653','45837','81470','32812',
                          '61986','11819','32177','19105','57591',
                          '18702','65258','75947','82644','52273',
                          '26516','26363','19990','21669','42734',
                          '28291','35943','73035','47085','52050',
                          '58341','20168','92844','98485','72519',
                          '92910','35447','57621','78512','91668',
                          '63704','32846','50463','41752','51529',
                          '16136','32531','84834','31269','40686',
                          '71097','85033','70066','51821','35054',
                          '54910','12340','17401','47466','24091',
                          '80078','82987','26347','35655','33722',
                          '90543','83993','57539','20592','48374',
                          '29315','37798','40979','75479','83956',
                          '14532','28144','12901','85148','28333',
                          '26432','29014','83151','42566','69151',
                          '45615','23320','21747','86762','26146',
                          '14592','20805','79296','30638','56516',
                          '21167','58734','84338','19751','28097',
                          '82151','69050','78612','86714','17105',
                          '99405','12564','97493','64827','50348',
                          '80353','43837','80218','30923','53501',
                          '81461','23208','20011','70621','46511',
                          '59659','54285','96184','53800','41416',
                          '78917','58921','44388','79085','19930',
                          '73129','42101','68431','15735','29516',
                          '32700','98553','29455','26766','71080',
                          '36441','87526','33716','60554','39759',
                          '94968','70625','22218','37288','47670',
                          '89288','39493','77355','35255','25786',
                          '31139','90054','96504','99231','88657',
                          '52985','16183','59878','55921','34599',
                          '60474','84513','27088','21425','52380',
                          '65021','97272','33137','24154','12618',
                          '11273','60987','76197','38933','38084',
                          '75164','70408','60650','12631','57241',
                          '26469','99693','37705','98482','83894',
                          '75733','15496','95667','85517','77935',
                          '66398','74154','60054','43690','57269',
                          '25145','31045','75169','34314','75887',
                          '49089','56844','54361','73006','38237',
                          '27883','26370','35695','53375','88813',
                          '59796','51926','84493','23677','22092',
                          '74530','44690','48653','76558','82563',
                          '66805','68302','29023','94849','12876',
                          '32508','93156','42114','87137','81019',
                          '85659','12278','53770','52469','79945',
                          '65639','52922','85981','28342','78180',
                          '25224','70401','94303','46634','39794',
                          '42172','33818','20097','38071','95189',
                          '55088','19796','37671','41712','77371',
                          '37194','71777','70511','18537','23376',
                          '76855','36973','58102','80412','79735',
                          '64698','83561','10717','75997','37750',
                          '97679','47340','11380','91011','14310',
                          '89281','37239','69563','88106','85843',
                          '42244','39795','61285','50061','76150',
                          '33791','94315','64584','96432','36693',
                          '58432','81139','65036','85268','81721',
                          '65959','22488','30666','79126','34963',
                          '94057','22381','13240','80937')
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
  and d_qoy = 2 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


