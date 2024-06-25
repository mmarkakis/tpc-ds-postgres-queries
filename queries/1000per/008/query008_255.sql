
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
                          '18084','41990','80346','41339','49036','26237',
                          '22121','95927','67562','61655','66847',
                          '76853','47823','17202','98313','68456',
                          '72286','73934','55548','95474','78150',
                          '86591','34125','11867','12107','50471',
                          '16629','82736','14399','85978','55938',
                          '38107','30277','29842','83362','32638',
                          '47877','72012','33814','46203','40805',
                          '78186','17244','63242','53705','83019',
                          '86928','88736','19874','29962','11357',
                          '39102','61155','16083','36814','86400',
                          '47677','10330','54436','29715','78197',
                          '14815','75875','39530','56108','90067',
                          '19371','35974','11686','43972','29745',
                          '68730','76107','41682','45447','40707',
                          '24310','73318','63048','45468','58181',
                          '82278','58775','41071','31623','48705',
                          '83575','25920','86413','89127','92603',
                          '15495','36158','33495','89251','41616',
                          '11384','28233','21598','51974','75184',
                          '26019','26336','45198','77401','86154',
                          '45558','67819','25345','76516','82979',
                          '46831','99535','10421','48229','92315',
                          '92228','94529','36134','44266','37534',
                          '99120','75752','64461','65658','37861',
                          '15991','16708','79992','91408','21444',
                          '96853','50656','22456','27589','68964',
                          '47485','65715','11586','24495','99676',
                          '11894','64463','36795','75799','93114',
                          '61138','50830','74976','99093','78387',
                          '55523','47239','14825','82083','47178',
                          '24845','85751','98964','85283','14639',
                          '84631','76378','67488','67991','38087',
                          '65029','44131','91605','13771','76026',
                          '93015','11921','28302','74821','84745',
                          '50713','61526','34477','33081','58439',
                          '47653','52274','92375','58994','43075',
                          '22491','42339','90355','85345','16127',
                          '39076','44756','41375','27914','28697',
                          '84635','45685','79640','68829','72613',
                          '74171','32900','17757','51167','95665',
                          '88487','92893','75839','95386','84456',
                          '58305','80371','39402','75818','44084',
                          '16563','86872','38472','68500','83982',
                          '91812','31690','37047','62249','99613',
                          '36331','65180','54616','85178','12355',
                          '42767','23459','78005','86118','72928',
                          '85235','34589','22625','20225','63790',
                          '32002','89429','16566','37930','74833',
                          '48140','42900','12254','85099','72879',
                          '52695','80299','88029','31896','44275',
                          '37688','86150','56983','54190','82782',
                          '50496','61968','48965','37496','37270',
                          '37606','74895','70149','59445','43956',
                          '76803','28200','72525','38840','86311',
                          '99590','40064','47991','92886','87624',
                          '92512','87754','73060','96603','33725',
                          '52441','39959','15074','67168','14298',
                          '80897','94963','96248','85921','85082',
                          '72958','13159','37993','66576','63476',
                          '63221','60255','41766','15175','75674',
                          '34921','63111','87832','21483','81359',
                          '19901','86975','74610','69871','27285',
                          '21445','95622','15295','47290','89927',
                          '36148','67015','11132','13223','86206',
                          '43283','86949','29553','56012','60100',
                          '72207','49009','55090','77763','58167',
                          '32384','55841','94512','53884','66294',
                          '66728','33926','68253','58745','64959',
                          '17954','34269','69105','35473','93936',
                          '19213','23374','41598','12099','57269',
                          '53826','80163','38157','69265','33014',
                          '55559','47106','73349','26254','41979',
                          '30203','72889','28934','82125','25067',
                          '19443','82002','40665','42215','41322',
                          '97288','10215','33319','49655','54090',
                          '36061','50026','82206','62555','10782',
                          '57877','68478','10569','25061','87592',
                          '20452','47409','92422','75991','33936',
                          '50768','45595','27558','30100')
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


