
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
                          '73314','80678','30339','33723','74812','75130',
                          '71535','34550','13464','20654','11585',
                          '85096','53178','42621','28063','24704',
                          '82639','52392','89930','45558','67799',
                          '11483','28244','64225','98459','92434',
                          '35837','53084','72365','69843','42074',
                          '53626','78720','24342','99007','30824',
                          '86668','14837','96371','70586','49843',
                          '87709','85825','15323','82631','25720',
                          '77887','19366','46608','30664','15962',
                          '91346','23062','19235','23498','40249',
                          '15998','39135','83465','41852','21639',
                          '22434','48189','21397','31671','29298',
                          '42804','43969','51906','15635','81838',
                          '58963','12138','32338','50784','90794',
                          '37098','43942','63454','46322','70926',
                          '12619','20399','31675','38850','17533',
                          '75480','97092','34861','56217','53429',
                          '29060','54116','71325','60639','21217',
                          '58852','11802','69476','64552','68441',
                          '99937','49558','55918','77648','93047',
                          '94348','41742','75569','32670','48243',
                          '69763','44168','61267','94445','62849',
                          '28126','30909','95644','96641','88766',
                          '59920','68639','13878','90730','99174',
                          '60770','81224','83553','12923','36229',
                          '76262','87847','71409','27476','94537',
                          '32119','51360','94601','88675','91483',
                          '63728','93620','30163','63903','46966',
                          '71721','74016','85660','74511','88338',
                          '34714','27105','44758','71457','68689',
                          '54226','17559','11983','61625','37201',
                          '55809','69612','50958','83156','20128',
                          '65846','62578','99342','52450','24196',
                          '97826','53272','24169','54293','14856',
                          '55528','52573','45530','44944','38971',
                          '74946','43064','43882','86753','98860',
                          '38665','92611','91969','89172','15247',
                          '73175','39798','35260','47866','51201',
                          '73977','85468','65696','87326','58686',
                          '73072','32252','19664','71183','23018',
                          '16468','35358','89048','25137','60861',
                          '12594','56964','51043','57759','58156',
                          '79857','93419','72900','24722','56582',
                          '25390','88097','40710','93616','21770',
                          '45400','78281','21560','91271','59065',
                          '99830','30875','97735','29654','55613',
                          '21228','66747','40174','98088','44535',
                          '47232','25810','71238','58530','68862',
                          '42287','35221','58176','93791','31726',
                          '80098','19400','23485','26490','11994',
                          '96662','26913','32194','69675','83001',
                          '81222','85755','31037','93846','28420',
                          '43187','68122','50526','24785','99392',
                          '37228','29642','23391','32449','98931',
                          '31880','26723','54708','42755','81812',
                          '29161','68889','13748','22093','88270',
                          '38307','95258','60000','14131','17466',
                          '47977','47332','92974','67263','33225',
                          '58561','36027','64322','67487','31612',
                          '28519','76404','81170','47743','61842',
                          '40317','65272','86121','78198','70808',
                          '11462','47028','94263','10044','78807',
                          '32760','25160','50377','73075','91023',
                          '53895','40455','74715','87135','97059',
                          '43897','86018','90629','15431','47377',
                          '65919','93768','40436','31871','13540',
                          '92796','50736','75565','59094','17861',
                          '13123','26044','74772','47732','32280',
                          '94323','15713','59666','60776','58768',
                          '36580','22494','37573','49801','85585',
                          '22118','13525','18238','44402','20099',
                          '48313','82045','16768','21149','60605',
                          '75061','11495','62888','28621','62822',
                          '59919','87041','72040','89423','46796',
                          '90711','28112','49870','88166','45068',
                          '32144','18182','95744','81103','61843',
                          '15262','87713','42068','56178','44391',
                          '94041','84280','28146','94027','32417',
                          '66079','61799','31389','59375')
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
  and d_qoy = 1 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


