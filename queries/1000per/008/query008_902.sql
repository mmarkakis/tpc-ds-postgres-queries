
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
                          '47906','97026','13388','85891','10036','34931',
                          '18542','37134','78757','99676','32964',
                          '99119','63316','45089','25070','33620',
                          '89251','87375','59116','12192','32472',
                          '72694','52909','88092','65955','63737',
                          '99877','44709','37794','85404','27217',
                          '76930','12812','55900','66174','65817',
                          '33525','27572','51993','46865','43413',
                          '52969','78413','93767','73541','91036',
                          '74174','29223','42081','33912','16483',
                          '42214','92139','17594','19578','59509',
                          '87714','45036','59621','99296','71090',
                          '23561','10294','67170','20678','84213',
                          '46949','60390','14921','23856','97192',
                          '79076','68589','32703','76592','39999',
                          '37762','56300','94480','49296','66853',
                          '10293','19097','26842','96625','58493',
                          '94648','71940','35872','63446','64139',
                          '44557','53221','14454','38913','84590',
                          '67511','17238','79584','13706','66134',
                          '57673','43302','68886','13022','41353',
                          '46826','63961','14617','12079','58953',
                          '13431','78493','95738','34641','25742',
                          '43455','28805','78674','73988','36933',
                          '48274','49832','23199','81679','30284',
                          '18090','32368','99951','80845','86005',
                          '89834','39361','61189','40790','36192',
                          '18642','31877','22496','38491','27396',
                          '17833','11898','82498','25273','71328',
                          '80137','65016','24753','27639','64596',
                          '58349','38755','82377','77857','62000',
                          '93692','43897','46648','98697','53068',
                          '72511','13300','58554','76070','84858',
                          '74033','11553','30385','45118','27685',
                          '31347','62328','63453','65420','68387',
                          '96585','84745','76197','40829','45430',
                          '26607','44069','66802','74787','94614',
                          '42504','35499','14448','81144','14176',
                          '35309','39739','51970','81859','51636',
                          '98318','84500','64327','43481','37524',
                          '62108','76685','78055','60904','25654',
                          '83242','25124','65057','39610','82105',
                          '98087','25279','58879','46505','69709',
                          '25082','34996','47189','35400','27024',
                          '39787','77016','61413','62646','15505',
                          '87424','31199','32084','60405','41234',
                          '88648','17805','88208','74078','99409',
                          '49470','73688','96004','42828','81123',
                          '82160','73614','12609','55765','57481',
                          '67498','87444','18901','39057','32734',
                          '67697','85549','55355','47328','23713',
                          '91306','83312','24673','75251','55820',
                          '27322','95703','55906','71364','30254',
                          '73333','29984','48154','36133','33304',
                          '44769','52893','18525','56191','90265',
                          '89734','42069','70939','28713','99571',
                          '60127','91639','99503','72219','34267',
                          '61862','31088','71446','74448','93287',
                          '38727','45643','71240','37918','66613',
                          '80189','45970','22512','26594','83392',
                          '82111','57304','87810','60322','41151',
                          '20374','47673','61611','28264','41202',
                          '99806','31409','83759','22186','21413',
                          '39985','64772','15212','20065','25421',
                          '46778','56537','54668','58873','33540',
                          '16657','26255','68872','64125','77162',
                          '72710','63775','15798','89499','98332',
                          '43185','94657','39590','46358','39471',
                          '54578','32707','22416','78110','20731',
                          '94140','95833','36074','47239','18604',
                          '25415','83573','79742','39470','68538',
                          '99915','54464','28080','41416','83839',
                          '87176','61279','37487','25308','91729',
                          '38122','89334','14551','25988','27752',
                          '46099','99845','48296','99664','63308',
                          '13995','16715','88529','96846','15699',
                          '95474','85562','59957','86050','86531',
                          '88923','74139','81454','54300','81090',
                          '82842','18706','43008','46846','82848',
                          '98970','22217','94596','45194')
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


