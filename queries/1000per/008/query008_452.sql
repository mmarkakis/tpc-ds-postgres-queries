
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
                          '43003','78353','23189','28919','74374','75582',
                          '40471','64239','21458','18633','81013',
                          '82424','41837','99151','15350','91579',
                          '23297','37983','23354','42850','96380',
                          '28413','61072','52915','73084','16264',
                          '61457','15794','50936','55479','25284',
                          '69818','99025','81031','84291','69129',
                          '67507','11333','11304','17590','20226',
                          '57896','53918','42728','55882','75836',
                          '74720','41550','72840','11975','74433',
                          '82255','67605','85629','43548','29972',
                          '48733','58255','38444','92158','73469',
                          '90746','65280','16471','45030','54076',
                          '36767','55555','16725','18657','55511',
                          '54579','57859','31425','22817','41769',
                          '61929','27433','45122','72506','34004',
                          '76240','19492','26918','54961','70556',
                          '74461','66901','99148','46769','74913',
                          '87998','65832','24569','47738','49899',
                          '25048','59000','16099','68916','52029',
                          '95587','52760','23334','86591','76722',
                          '34221','80195','50679','89630','29656',
                          '46305','49646','90481','80932','48892',
                          '51567','95179','26102','25958','92611',
                          '55234','65912','27942','32303','40782',
                          '72120','48497','53696','58510','41623',
                          '51275','49729','51777','47853','65062',
                          '92379','78994','61292','13368','68253',
                          '55989','99398','12171','22009','10497',
                          '25143','46109','85576','97462','47338',
                          '71491','71966','76583','36580','10003',
                          '36857','29636','11103','31388','33803',
                          '39355','29428','65631','10205','34703',
                          '60717','17025','25082','37231','56157',
                          '18992','67518','32244','97414','39401',
                          '23985','77759','46243','28310','20209',
                          '34033','78837','90872','60732','49363',
                          '31585','43576','17989','78453','61202',
                          '82222','89624','88614','10843','10819',
                          '19986','84790','12377','74713','63317',
                          '43184','40085','79087','51421','60768',
                          '49147','23944','68389','20713','89194',
                          '60055','30630','91937','18056','50139',
                          '26739','36744','61195','11265','28237',
                          '47704','42234','41290','79571','32530',
                          '97094','76473','87959','80389','53449',
                          '43902','70533','25204','15697','72210',
                          '68377','62897','94770','48583','83573',
                          '38607','66519','49854','53351','53288',
                          '41198','84584','54457','20300','11034',
                          '20410','32555','28214','73608','60221',
                          '67292','56800','19298','14128','52751',
                          '89231','44164','70990','22722','35548',
                          '41172','85271','64580','99732','59319',
                          '15502','86764','31510','89463','54364',
                          '79217','95448','23007','88403','12588',
                          '74982','41991','69461','66455','92840',
                          '80530','27445','58588','45635','58547',
                          '75047','90814','50715','20529','86275',
                          '27408','21708','33435','41069','45408',
                          '28564','51479','21691','72173','63073',
                          '21823','59737','99545','87693','46321',
                          '91578','11688','16272','52779','27403',
                          '93401','58967','64413','59843','55022',
                          '54733','94896','16362','18099','40723',
                          '19885','62751','38923','41509','61294',
                          '59656','27639','47722','59428','14415',
                          '94565','54561','98575','79765','35623',
                          '76793','37908','10804','64883','43269',
                          '26577','20560','98894','84880','80765',
                          '76872','33839','27778','10668','55080',
                          '65657','70785','70183','56646','57735',
                          '49961','88486','41863','51409','68579',
                          '77742','92230','53189','78640','39442',
                          '98990','63916','42699','26543','95555',
                          '42279','58956','45734','91609','26722',
                          '81083','34579','92296','29356','58898',
                          '83225','62942','11424','51366','89520',
                          '48628','52333','57940','42260','19647',
                          '67697','99800','18362','47941')
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


