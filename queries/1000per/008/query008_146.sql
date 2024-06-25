
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
                          '36951','83013','24486','21035','14692','91835',
                          '75782','11291','23829','10311','37397',
                          '50239','56743','99969','34141','89378',
                          '72905','20074','56215','84822','41992',
                          '63092','48194','62347','19425','21511',
                          '28127','19958','64406','37823','73841',
                          '11820','27475','29013','88628','66463',
                          '80896','21802','52768','25566','98343',
                          '78043','59364','12068','89519','63563',
                          '91453','51424','35283','26956','84562',
                          '17733','61470','85430','44341','92487',
                          '52979','44388','11015','35896','64624',
                          '46610','31367','13783','63904','61804',
                          '69627','45948','25623','53233','13742',
                          '83902','66966','46198','61450','16623',
                          '33828','46596','91407','92768','53805',
                          '44600','14073','34038','86751','90477',
                          '94250','86336','20257','86134','75432',
                          '92392','50623','56242','73365','13929',
                          '61465','30933','86113','57921','13763',
                          '91431','47388','76207','69873','41284',
                          '81810','43539','83572','89643','55470',
                          '31599','31551','18849','96117','15327',
                          '88215','48638','41663','65383','14862',
                          '15299','89923','58915','64996','58608',
                          '74023','97306','67330','85545','68160',
                          '23073','72602','79564','43825','37753',
                          '71664','29286','42611','75030','12978',
                          '89750','29634','74429','49549','99788',
                          '54791','72730','32875','90311','50705',
                          '29827','49349','80993','30901','31664',
                          '97934','90426','52448','58161','73940',
                          '96602','57881','97617','58115','63555',
                          '52669','90988','49985','38873','27464',
                          '17011','54852','95464','18886','87733',
                          '27438','84097','94710','31296','53238',
                          '20153','36483','47700','62934','21421',
                          '39925','69289','97310','72376','23699',
                          '73641','58744','19101','91896','67736',
                          '54207','96029','49449','57963','15624',
                          '97718','22557','45162','61448','49263',
                          '54743','52332','77842','98782','94538',
                          '83903','15720','54050','49778','26926',
                          '74702','44032','72323','59393','54416',
                          '26417','37921','63976','58655','68366',
                          '10444','18048','60471','19769','79697',
                          '38208','45672','41371','56104','77807',
                          '14444','87202','57562','64705','36449',
                          '67236','66027','76433','51615','31210',
                          '46476','47768','66300','52710','14367',
                          '35878','74784','82788','36017','65678',
                          '86996','91072','99633','56997','69341',
                          '37276','60944','99599','63643','15442',
                          '89090','74013','41237','64439','99966',
                          '84047','11809','59051','83438','75617',
                          '64637','30578','93328','12606','89037',
                          '40500','40325','57642','35065','85776',
                          '76209','32194','83265','13864','68016',
                          '57790','86899','86056','15348','99802',
                          '18728','71857','22323','78247','93399',
                          '68552','67133','50290','57031','75242',
                          '84859','76465','65704','45989','84645',
                          '18367','15099','11651','43130','84535',
                          '50647','57769','28572','75837','88841',
                          '37125','85529','29753','49734','77687',
                          '81380','60386','88720','94627','77690',
                          '68129','80475','71174','60536','62836',
                          '12015','63432','10728','52147','94877',
                          '31356','21682','18314','43702','95089',
                          '23051','82609','77512','81878','19309',
                          '37866','97961','25973','44384','50708',
                          '59282','57781','27227','35395','92828',
                          '45393','12240','86509','11375','79742',
                          '75831','26870','78779','52977','63686',
                          '90825','16493','12376','94849','16666',
                          '92949','84987','17901','37953','38932',
                          '95130','83783','30803','25242','28740',
                          '16199','93441','40717','22291','89994',
                          '28662','60937','49597','77992','84669',
                          '13018','90153','58010','36733')
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
  and d_qoy = 1 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


