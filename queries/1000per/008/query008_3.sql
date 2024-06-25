
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
                          '55641','65242','94981','85648','53844','23794',
                          '33983','92931','78867','79190','29659',
                          '75761','62501','24696','16323','78229',
                          '20494','81117','38308','14413','58789',
                          '76856','73053','43280','72630','54819',
                          '95775','29872','36804','53239','54458',
                          '62028','90180','14108','69114','55454',
                          '11589','60631','48981','16837','12224',
                          '51090','94489','66557','46498','64913',
                          '47072','78585','77082','52654','35707',
                          '10516','33902','38058','84075','53145',
                          '68438','86143','48504','59753','34783',
                          '46570','30400','41956','92510','23207',
                          '37391','44202','15055','62134','78747',
                          '95192','93113','39393','56491','36663',
                          '15745','48935','87514','14130','53028',
                          '85058','51404','21560','61323','63732',
                          '25000','11268','97871','88847','10033',
                          '13702','54187','12764','10709','27261',
                          '22804','46189','65710','29152','75512',
                          '16385','22886','41085','67860','77126',
                          '98809','19208','36505','92267','24561',
                          '65072','40376','63385','36721','93992',
                          '90061','19509','95786','92781','47192',
                          '20336','39502','18497','22333','51130',
                          '58549','37676','53935','11250','86101',
                          '75255','23319','97644','75559','24988',
                          '25494','63592','48094','73093','93713',
                          '96111','63196','62083','38653','80300',
                          '29552','61348','39149','64079','17410',
                          '30562','94600','17590','25709','32630',
                          '88376','35546','71201','71396','60863',
                          '13123','80102','66836','28348','88213',
                          '21320','21497','88026','90040','16658',
                          '18262','56769','90188','15294','82832',
                          '63462','39810','57277','31548','39735',
                          '12726','58767','85761','60026','31406',
                          '87330','94315','10847','91870','83245',
                          '31408','27512','22188','53209','96028',
                          '89114','29799','56039','45890','24019',
                          '76901','79489','78850','84594','58282',
                          '82343','67652','56167','93533','80566',
                          '30396','24271','27682','64999','42169',
                          '48284','31138','58472','14444','43290',
                          '90744','79873','74966','86439','23393',
                          '56033','86490','91190','34977','86423',
                          '58695','67413','98200','13128','76423',
                          '39759','54772','15304','74391','12231',
                          '36492','73585','22725','35991','86113',
                          '24222','92685','87944','49538','32483',
                          '76678','46054','45765','69080','22938',
                          '85544','54316','91288','67420','56626',
                          '19120','99359','36799','47693','97975',
                          '81806','85504','93348','39622','27380',
                          '31293','48992','87922','35831','38387',
                          '10457','31179','28490','44535','50489',
                          '80227','19469','34414','47837','22426',
                          '44124','43577','70673','44653','43912',
                          '57676','41767','75296','30566','70936',
                          '21708','92649','53379','20117','12205',
                          '75406','17743','73277','53251','88942',
                          '11760','69361','94797','46506','66512',
                          '56123','40509','18529','43928','74193',
                          '45318','17425','62189','27582','65607',
                          '20095','73801','20280','42893','28935',
                          '18593','70051','21145','55373','61012',
                          '33354','59945','23140','27794','62898',
                          '24469','68795','17703','84704','22551',
                          '79418','68762','26652','40624','24196',
                          '17729','64138','85308','10388','44628',
                          '55929','45084','27545','57780','41287',
                          '34908','40998','57319','38483','54690',
                          '97585','20415','72782','15240','61773',
                          '93181','93365','58975','15804','62386',
                          '15197','15434','21840','25334','63957',
                          '19664','83898','65551','21430','55932',
                          '49681','14532','15002','67425','11631',
                          '86009','95668','96675','60058','95662',
                          '20558','79167','11531','53082','75858',
                          '75616','19747','25506','34796')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


