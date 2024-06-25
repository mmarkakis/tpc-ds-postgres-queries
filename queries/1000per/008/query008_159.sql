
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
                          '85585','20735','99183','97895','11488','48479',
                          '30039','98521','75945','56152','13429',
                          '65987','63220','14840','31647','35163',
                          '70240','86603','16178','38333','10659',
                          '70811','26343','17724','84660','79278',
                          '71030','85366','82892','65410','19418',
                          '59502','61756','34324','87448','70956',
                          '11555','13942','65840','82518','82204',
                          '68643','39543','54542','49555','85759',
                          '58079','18893','17389','92699','84524',
                          '38574','86071','72961','71486','57658',
                          '26418','76164','52631','83631','75277',
                          '95320','60505','64911','13539','92628',
                          '94396','30318','98185','88814','77056',
                          '58118','12331','60774','71928','72785',
                          '65824','96596','37072','51185','92683',
                          '47576','84946','57076','11068','60662',
                          '11743','80723','11015','21842','12201',
                          '82620','45880','87048','94945','96828',
                          '26727','13940','29929','78087','85058',
                          '45726','67673','87179','85124','52343',
                          '35476','87155','69852','30375','38711',
                          '24782','33360','94728','90189','25010',
                          '45869','59918','93650','59930','38203',
                          '25847','56781','48011','78790','29400',
                          '71973','92337','54598','41439','37317',
                          '96417','14464','14580','51091','42552',
                          '37676','98482','99522','81551','90381',
                          '99523','24901','62604','20239','79998',
                          '50885','94639','58803','90634','75405',
                          '10166','87184','63597','75090','60660',
                          '60387','24356','66562','73266','86363',
                          '45135','56418','20665','91434','48890',
                          '70264','68880','56208','62778','43586',
                          '61810','20768','59473','11080','78149',
                          '13551','54045','56373','13073','62645',
                          '86442','42020','25922','98271','49583',
                          '21417','31267','97856','86176','38055',
                          '89980','32405','86841','95815','36256',
                          '95346','97445','58506','85021','60946',
                          '41529','76133','19791','16715','43544',
                          '87597','32198','22943','84323','25441',
                          '53158','62631','14147','96356','35679',
                          '17077','53309','67985','38755','32431',
                          '30605','13165','16999','88302','98180',
                          '60089','89498','32111','70385','95887',
                          '34987','46394','67018','93337','24888',
                          '94885','55318','53169','66092','16916',
                          '19344','42744','82737','81405','32026',
                          '12806','76229','27178','98880','32884',
                          '15159','48595','58918','53026','39197',
                          '29585','47012','25704','83404','30077',
                          '72852','45500','81846','14907','85113',
                          '76434','42509','56819','15538','19059',
                          '20142','44302','30553','82053','35118',
                          '14805','34123','30135','53950','59152',
                          '42085','15015','62888','11624','56483',
                          '70797','19593','70695','79085','91142',
                          '44357','41289','44241','51816','30405',
                          '54210','74125','10360','32422','91646',
                          '80492','54512','18475','36498','99846',
                          '24527','48322','49330','85329','74403',
                          '30281','43196','56642','78296','15468',
                          '11983','24624','35542','17118','62280',
                          '30660','57915','89182','58726','43694',
                          '97443','47929','83141','27396','76011',
                          '97410','84085','80076','76928','66538',
                          '55450','97377','48577','19412','84686',
                          '64956','26383','15220','80994','67016',
                          '50784','50141','33267','80018','38623',
                          '49060','39908','53403','33518','30655',
                          '74858','66312','98919','43824','54892',
                          '88722','35704','94441','86604','47901',
                          '37356','31217','58048','89996','71595',
                          '34891','46029','71684','42245','17158',
                          '76543','67028','62687','83306','87431',
                          '45894','42004','15471','13053','86417',
                          '13494','15448','58074','28750','67428',
                          '12025','92772','68232','13576','98801',
                          '13615','93682','77778','66788')
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

