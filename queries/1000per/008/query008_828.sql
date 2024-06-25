
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
                          '23597','85635','31504','21534','73991','68933',
                          '82594','32111','77596','35365','22451',
                          '41881','19016','27710','45189','59641',
                          '66764','50824','29119','36636','61638',
                          '71968','66457','51840','61012','25436',
                          '47954','19310','11042','97910','18014',
                          '62873','75006','95642','32756','71195',
                          '78849','58844','57272','32345','97505',
                          '24735','66603','91639','81298','89732',
                          '62969','49022','74700','37294','44121',
                          '51410','95949','55915','33754','55456',
                          '48091','83037','62940','78768','81348',
                          '72678','18334','24948','24439','83836',
                          '15736','37443','57536','66062','58197',
                          '73316','31174','97187','63071','68157',
                          '95859','20073','75510','98793','86891',
                          '30444','76192','10272','14858','13355',
                          '90850','83539','33690','74505','83913',
                          '70440','40851','11350','52465','68128',
                          '65339','43557','24085','41224','72957',
                          '82763','36703','69307','11731','26475',
                          '86853','41415','30229','95991','42018',
                          '77256','53962','81007','20348','96387',
                          '86379','12013','69812','89261','36491',
                          '32488','17088','99896','25227','12574',
                          '61615','41229','59859','13895','58537',
                          '69354','53518','51975','99103','53171',
                          '60629','42110','17831','29572','53312',
                          '66390','64579','10688','23385','18525',
                          '99659','70694','53686','94105','42670',
                          '75134','58240','83452','12932','38611',
                          '28967','39943','18667','39402','77742',
                          '94032','94118','54588','86028','89941',
                          '93773','59578','24015','40551','72022',
                          '49794','66978','83252','91851','77334',
                          '63279','18755','79149','34230','63158',
                          '28164','38125','44358','74162','64269',
                          '98285','92255','49682','70734','19414',
                          '31489','76336','39093','68826','68243',
                          '36202','53383','45528','46007','17480',
                          '87707','26916','49564','85459','39220',
                          '49950','37750','26360','85198','15504',
                          '36653','52213','56269','52194','75235',
                          '16247','83936','58516','21609','61420',
                          '55421','83749','12256','27282','20154',
                          '38721','71727','14230','54130','19713',
                          '64539','30074','80862','78334','96110',
                          '23519','75243','54344','79169','88188',
                          '37157','44012','46975','93755','51704',
                          '56960','56974','98413','76006','26312',
                          '19689','48883','66856','64225','65224',
                          '51847','69189','66776','36918','23850',
                          '13843','81553','30016','64740','45372',
                          '91416','41927','83211','21817','75168',
                          '73145','99155','61186','68859','64278',
                          '84865','62587','95906','90405','22049',
                          '64765','48076','69947','65444','77153',
                          '15466','67868','26922','91022','19379',
                          '32951','57556','15830','87011','78062',
                          '14231','20474','33045','13639','21496',
                          '42167','21350','29006','34791','97204',
                          '94796','18240','14580','43775','39960',
                          '32484','25517','51831','37770','44940',
                          '94149','49262','11073','66635','72128',
                          '78472','64366','63026','85015','96024',
                          '80826','37553','68732','60403','18131',
                          '77042','98058','20972','75407','65868',
                          '23674','42148','10286','33671','67261',
                          '35132','39437','61006','90888','67341',
                          '80766','69922','20229','77585','20459',
                          '34663','40447','54648','37120','24127',
                          '30548','17255','54157','48301','54621',
                          '24545','72618','36675','32516','58905',
                          '52339','19755','72381','74950','36541',
                          '19239','48046','68818','56260','38193',
                          '35845','15362','42185','95083','43320',
                          '35991','11662','89217','30801','16148',
                          '71040','97555','37004','52264','97484',
                          '53280','21228','52989','31406','43177',
                          '48535','92239','34617','47730')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


