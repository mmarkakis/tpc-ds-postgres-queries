
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
                          '95305','90351','21444','77061','90361','41079',
                          '93534','32321','57430','11880','45258',
                          '18094','69329','53344','79229','93974',
                          '63787','40209','74867','99117','83545',
                          '38401','24058','17440','74912','46640',
                          '68421','19151','33855','87609','66294',
                          '71982','53333','63198','56652','22501',
                          '26986','47574','62202','88511','39135',
                          '90942','15219','99396','15550','85029',
                          '25370','89065','88758','61524','78249',
                          '29547','84840','62358','47600','49471',
                          '65187','34613','66551','66683','29656',
                          '36328','96767','88669','35101','20482',
                          '50221','77708','67943','15460','55754',
                          '92678','29244','54637','62086','72442',
                          '23061','46348','73453','76132','72731',
                          '52111','52308','47143','11213','43594',
                          '18495','12259','97034','72639','83111',
                          '13844','57673','98183','86509','52818',
                          '36221','87370','46324','89998','25215',
                          '89813','19504','43794','25237','86701',
                          '25588','84209','56457','56335','62305',
                          '92481','57755','66748','29046','51158',
                          '84493','70301','42452','37501','13927',
                          '27300','13354','51223','27983','12984',
                          '67436','28095','47248','70351','65391',
                          '80903','41418','68317','64367','28197',
                          '43733','58053','26668','40082','60727',
                          '58595','27477','98437','76843','32577',
                          '27364','60207','13329','79800','39253',
                          '10678','42092','61991','50937','12509',
                          '50224','67633','24482','85563','36194',
                          '65604','18771','36216','24589','98364',
                          '29659','71403','82402','45800','45130',
                          '52016','66179','87106','33997','88979',
                          '69474','14497','37127','73037','91969',
                          '76709','67093','83637','60488','88271',
                          '13249','12777','95840','25190','42412',
                          '68241','43211','19580','63398','12923',
                          '21449','19209','17199','70553','19598',
                          '90337','19251','24524','21531','91215',
                          '67712','87968','14853','38965','29441',
                          '15368','66545','95183','22223','65019',
                          '51338','81658','24695','55316','57277',
                          '58700','22464','29911','53649','76669',
                          '50779','59573','94611','12843','49828',
                          '99721','64199','34032','50780','64401',
                          '19310','51615','88417','10602','61141',
                          '75933','29964','70864','82305','70279',
                          '97497','71624','28596','24886','55018',
                          '84366','25868','13452','70042','57993',
                          '16445','82788','14273','14591','88793',
                          '48845','80359','71042','42585','84381',
                          '88021','57325','22367','67086','87468',
                          '27838','61021','66125','88995','16894',
                          '68168','96089','44869','80097','97379',
                          '25378','80033','83527','30357','57280',
                          '29350','74322','11981','27073','54796',
                          '79409','33456','35718','26288','69681',
                          '40431','55789','78987','86864','37567',
                          '61376','27204','25503','92925','68592',
                          '66543','43362','45053','45042','61288',
                          '12884','78341','98719','60990','70995',
                          '20251','19074','20994','68895','72492',
                          '78164','99149','72940','43945','50377',
                          '25814','99973','48906','28845','64557',
                          '67618','73073','12173','99044','36577',
                          '83746','30329','59106','54513','29555',
                          '43466','92720','42167','91954','76620',
                          '33619','62807','54763','61752','22846',
                          '15480','68354','80934','81946','26520',
                          '43300','35375','86788','45411','27602',
                          '14499','25457','16639','88362','42086',
                          '41077','57429','96639','67935','45673',
                          '61905','96410','29067','58310','18750',
                          '73390','28173','89357','55176','25213',
                          '43599','22220','22011','98923','38572',
                          '30504','47189','67824','52025','51771',
                          '10929','76962','23370','49684','85914',
                          '37799','29572','12300','49235')
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


