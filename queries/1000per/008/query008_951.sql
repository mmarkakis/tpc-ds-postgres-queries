
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
                          '71537','28492','71538','98610','44305','31074',
                          '18924','12968','33690','25754','60770',
                          '40921','61904','69244','40148','26321',
                          '32801','30016','75285','52003','85354',
                          '44548','32704','41243','79772','98737',
                          '22695','70063','82902','96078','27880',
                          '15795','99037','87663','65954','66633',
                          '16177','98169','64732','72270','49692',
                          '65239','27920','27975','35489','91072',
                          '70030','85836','70655','88763','22126',
                          '27038','21161','58231','28077','88214',
                          '53667','85530','51090','13908','23908',
                          '75312','69045','44434','89322','90628',
                          '21444','71717','96541','14790','31096',
                          '91778','34281','10215','10880','42623',
                          '91199','53507','62572','51064','95293',
                          '36582','32483','61125','54235','60672',
                          '87230','52073','71433','96978','67147',
                          '82898','81944','43580','31805','56164',
                          '72988','69857','18447','70873','91860',
                          '91328','43170','86900','17549','65535',
                          '22386','27873','33815','16851','66923',
                          '42471','93402','74930','28408','88843',
                          '80496','92995','34595','45223','75031',
                          '92914','15622','29669','79667','94709',
                          '54052','21578','75810','31594','26003',
                          '88633','85492','75256','65702','67042',
                          '93249','90283','95400','86742','61768',
                          '34889','35971','61216','70799','89705',
                          '16089','24458','12217','15105','92509',
                          '21852','69884','14699','56420','42188',
                          '30952','69406','81522','51356','49635',
                          '53306','41039','41547','33384','54496',
                          '79441','39593','17589','45526','65125',
                          '83128','43788','55622','37087','94222',
                          '70099','75064','63678','45442','21114',
                          '34993','82579','55065','89378','37334',
                          '27735','15973','99586','30371','41778',
                          '14857','20620','61876','48938','49076',
                          '84626','25002','52226','72016','38484',
                          '42229','57813','75262','38681','53996',
                          '30596','30370','12051','42260','53420',
                          '91659','29473','31324','79744','18013',
                          '81631','84964','14001','84131','91607',
                          '98418','35398','41773','96668','32636',
                          '11551','39459','23571','64691','65902',
                          '34542','29392','82662','25329','78179',
                          '25099','93657','63181','46025','50511',
                          '53352','91340','27895','16064','10453',
                          '59143','98319','33120','94595','64775',
                          '92412','99032','28280','91337','87701',
                          '65200','19634','46646','36502','55120',
                          '57703','18426','78955','79608','16798',
                          '43604','36753','71084','56136','12349',
                          '91299','97003','43091','31788','45978',
                          '69914','54313','79238','41468','71541',
                          '75558','50533','63648','91126','46748',
                          '82924','10263','36887','54193','49722',
                          '34077','77189','25139','91431','63320',
                          '56719','87494','20844','44776','26067',
                          '86510','28618','14183','53914','88681',
                          '99761','73017','51153','85641','75733',
                          '40195','78717','80367','75152','25517',
                          '79337','13746','46047','89272','44400',
                          '55080','51405','28242','63769','41840',
                          '55415','87377','59396','28263','68283',
                          '25692','86109','63599','39201','12060',
                          '96467','12302','55825','90984','87349',
                          '36778','76529','90864','98234','65394',
                          '84802','75083','39276','71865','55887',
                          '43093','29468','40193','92852','68654',
                          '40881','96760','85970','71044','83622',
                          '72812','83356','97833','56956','53804',
                          '20280','80778','94000','27809','41844',
                          '34016','42873','56511','10023','61543',
                          '45559','64717','13502','77874','99609',
                          '82480','97764','59527','77905','57493',
                          '98637','26201','31578','20558','41180',
                          '14220','91896','94974','77549','50557',
                          '22110','29790','18157','55922')
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


