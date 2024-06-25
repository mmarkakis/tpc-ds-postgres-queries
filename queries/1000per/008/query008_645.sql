
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
                          '60093','32531','37337','37576','91636','68336',
                          '50025','13251','49108','41980','81885',
                          '12345','73960','36674','22100','20958',
                          '20506','25101','40980','84272','45245',
                          '55448','13766','55509','39981','76904',
                          '31557','98580','91309','95934','49794',
                          '36474','70816','97612','18755','58822',
                          '43393','59045','56296','19775','22998',
                          '62397','85696','88764','83234','77802',
                          '78080','56382','56604','84257','59516',
                          '85464','90375','25195','65501','95069',
                          '30297','64391','40687','95058','16418',
                          '90165','74475','76302','97375','72615',
                          '24034','94576','47585','10401','81855',
                          '77198','75343','39045','74381','42342',
                          '14050','59449','46329','90437','91544',
                          '73538','43699','67361','82486','99096',
                          '77598','77929','11924','42649','86282',
                          '16355','68903','78957','45096','50872',
                          '45887','50634','53077','76677','73704',
                          '49442','58895','75145','41697','24410',
                          '91631','17647','79266','10811','44882',
                          '46783','46332','11769','60865','30316',
                          '62965','84109','87394','31712','42287',
                          '79282','96637','12098','32842','55949',
                          '79745','99933','16208','35682','73407',
                          '40731','58170','55357','97933','25418',
                          '90020','71662','73714','46131','57781',
                          '70100','45811','86285','54358','84480',
                          '37059','88831','75641','51878','46205',
                          '64843','42058','20581','10324','73522',
                          '98349','75191','30325','64801','11423',
                          '70602','82205','93011','11543','16377',
                          '83902','48863','73262','77184','98161',
                          '52656','57946','41043','28159','49991',
                          '27440','50696','50859','41183','99745',
                          '96022','80319','24433','13632','53602',
                          '89716','24882','38260','39568','66637',
                          '14320','66494','44471','47167','53993',
                          '85346','19813','28888','84635','66278',
                          '75341','36101','93932','82033','48483',
                          '40455','70469','14374','99523','87112',
                          '33818','69976','41845','22786','29046',
                          '73114','10519','47653','16603','32569',
                          '45854','86966','49823','16946','51749',
                          '36339','17952','77624','93602','75268',
                          '19479','60883','73475','59064','43318',
                          '57803','54936','57820','83119','60582',
                          '93253','63787','99606','97575','36755',
                          '48168','21139','81980','35207','87935',
                          '87619','13777','75256','65728','78410',
                          '66076','60601','36086','33330','83931',
                          '66799','31913','58435','75838','59288',
                          '66287','69750','80706','26763','30636',
                          '59461','21261','27367','54095','76064',
                          '39726','95276','37902','11112','65527',
                          '74515','44985','19958','92499','14348',
                          '58875','39348','48808','82343','44363',
                          '72517','95711','44192','52328','28642',
                          '67076','20684','72598','71870','13140',
                          '51699','79958','34042','61670','24714',
                          '23370','39795','15261','70548','56126',
                          '78332','49332','33103','59856','77410',
                          '40274','42255','55415','53521','27139',
                          '34117','49081','76793','23588','73577',
                          '27890','87146','20051','10122','32551',
                          '53529','20783','93702','13025','11055',
                          '42899','95504','11066','33966','38650',
                          '59361','38651','20841','65356','87002',
                          '43014','12245','30714','52007','65969',
                          '29463','98201','73259','60399','58394',
                          '24194','22579','52121','21691','96204',
                          '76945','18562','65948','65706','20388',
                          '16585','95012','63898','22269','44281',
                          '75367','35779','13442','65837','20602',
                          '10650','81615','11408','77948','56093',
                          '35007','42162','23961','59486','18406',
                          '51084','82245','36860','61705','89434',
                          '11957','91798','86082','51967','15881',
                          '63265','81507','45658','72676')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


