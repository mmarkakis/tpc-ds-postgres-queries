
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
                          '35441','93239','15272','60880','15289','64709',
                          '54861','30626','79032','76878','53909',
                          '43926','20468','17512','11437','63363',
                          '18875','87253','85100','45330','21783',
                          '22628','24852','19118','73662','36189',
                          '49306','77688','22030','74101','14930',
                          '35509','26355','81203','79470','72022',
                          '54589','87645','18068','41618','63804',
                          '89349','33808','20030','38074','88915',
                          '25983','90246','53159','77299','56616',
                          '43684','90561','83926','98458','90630',
                          '29420','90533','77091','60778','92178',
                          '51741','79674','81099','97974','28190',
                          '27174','74846','31761','26812','81292',
                          '62116','35768','98576','72367','23891',
                          '36098','16921','34937','34259','32326',
                          '20824','61648','23955','59039','56002',
                          '43867','57536','89218','94301','89209',
                          '62954','97894','63455','79344','15096',
                          '55512','53399','14523','98523','58177',
                          '63603','11429','17104','44819','55151',
                          '48278','36424','62642','21840','66333',
                          '60766','94032','26632','70864','90868',
                          '68331','59996','52112','67121','38067',
                          '72663','47612','84275','10580','93290',
                          '57558','96847','81082','81859','19906',
                          '15937','74344','82315','60502','78994',
                          '11034','88743','71109','35342','32412',
                          '32791','19730','31388','23371','69893',
                          '47212','22844','11345','29751','34270',
                          '11563','55923','88921','21036','91363',
                          '53239','63878','30332','97295','91809',
                          '31104','40108','59152','60891','52581',
                          '67718','51586','59863','10529','97855',
                          '17492','94209','36710','37032','80914',
                          '53491','10656','68316','77378','18320',
                          '89425','60540','68729','23941','28032',
                          '33996','32470','60096','98989','79061',
                          '87744','75596','80783','99177','23822',
                          '57532','90158','64626','13732','61854',
                          '31288','75465','24330','43386','20417',
                          '96543','29022','31996','54280','67377',
                          '31214','54039','50064','55096','25415',
                          '47819','47272','74529','86292','23304',
                          '43214','37193','98391','84527','60974',
                          '18863','58185','25711','81916','48381',
                          '75565','26654','70275','77237','22453',
                          '97399','17352','16840','55165','94840',
                          '39182','30375','40938','35011','86148',
                          '75288','38380','41366','49972','80566',
                          '64421','39570','18277','15111','83662',
                          '10484','27113','31803','94496','50124',
                          '94693','48794','38183','28070','99221',
                          '51294','32605','34601','26073','92492',
                          '63944','52232','69682','85082','98324',
                          '82486','17158','32989','93495','11848',
                          '56655','20907','21419','94108','62748',
                          '86263','12334','80972','86752','38117',
                          '55080','69803','61288','45743','87207',
                          '21171','50314','64057','24926','44983',
                          '62374','14156','90811','64360','56887',
                          '90342','85337','27365','49685','57369',
                          '89870','42110','73153','73984','19084',
                          '62099','24996','38216','86369','79783',
                          '63369','43727','66619','44950','66189',
                          '80050','80599','58582','65819','22009',
                          '14754','81375','82630','39881','21059',
                          '78713','97215','71426','96094','99516',
                          '24084','16817','87613','83236','66910',
                          '19495','84755','70603','58996','94505',
                          '66537','44158','60695','47072','84129',
                          '32446','20022','50259','22814','36656',
                          '43998','49218','50196','14394','50730',
                          '59120','37257','17166','67282','32401',
                          '83185','35042','73653','30480','21959',
                          '33827','26726','24434','83999','91045',
                          '23920','69664','61081','40035','54104',
                          '79428','44043','54603','41289','52513',
                          '73921','52888','35880','16927','12951',
                          '65321','68043','17005','30936')
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

