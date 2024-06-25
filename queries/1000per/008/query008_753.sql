
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
                          '69352','47745','79799','94438','45411','98945',
                          '86449','52163','58535','64607','70188',
                          '98797','11010','59752','16838','65103',
                          '48478','48265','27495','22248','56944',
                          '46357','51830','98500','67871','20673',
                          '27971','98256','36530','81639','26514',
                          '81168','19472','37805','49002','40089',
                          '20949','30344','81916','52689','98199',
                          '69318','52967','53434','31757','98286',
                          '65862','63969','89639','76096','50080',
                          '43522','16927','55749','81967','89756',
                          '80234','84591','64487','42656','14123',
                          '15055','72868','66894','67664','76591',
                          '65420','82152','36627','35526','20187',
                          '32905','48520','31743','37534','74435',
                          '73337','99196','31646','40656','20271',
                          '22071','48737','58736','29177','61554',
                          '58459','45807','46939','17843','45878',
                          '80401','24741','97061','11033','50250',
                          '38196','46256','58948','37869','86080',
                          '16766','50215','68655','85207','60083',
                          '70748','97282','99407','43296','49523',
                          '69020','79348','48344','36338','86996',
                          '43024','57872','12336','46584','18364',
                          '28116','15209','70792','95504','49667',
                          '41719','69872','68090','62862','13539',
                          '97855','88283','14815','47230','64280',
                          '21760','47485','62924','46145','76349',
                          '99243','12550','21402','42757','29118',
                          '12353','95779','51038','38526','91658',
                          '62894','70906','86820','64200','86110',
                          '88130','22182','81899','13406','69776',
                          '90485','73025','30791','64413','62427',
                          '59655','95942','60456','16232','62948',
                          '26014','29452','65338','22984','27385',
                          '51083','43415','92171','89377','51116',
                          '94268','21592','50218','22739','91363',
                          '91169','51062','92059','82109','61504',
                          '12345','13257','39971','13887','31401',
                          '18527','27852','65239','98888','19387',
                          '10547','21506','17377','48535','11040',
                          '75301','83805','56338','58616','86697',
                          '88510','48409','29739','72985','71275',
                          '34627','48170','19142','68885','76060',
                          '46626','68859','21770','95250','58517',
                          '27979','24921','94773','29457','54493',
                          '21497','46472','59551','65885','58677',
                          '20600','57008','60258','58985','91314',
                          '19189','75904','28665','74518','63834',
                          '93641','48935','10462','27929','52361',
                          '57129','40747','78196','53476','78384',
                          '27665','78827','97424','58075','68214',
                          '53157','71853','42492','96590','59677',
                          '32538','77124','50235','59387','59892',
                          '43511','15029','48366','69723','38208',
                          '28831','34625','69166','66952','21726',
                          '73466','30403','26186','64343','37584',
                          '48835','66019','11997','86895','70317',
                          '93644','11535','11873','19026','85563',
                          '50482','36721','68441','84355','24853',
                          '57056','41648','60273','76345','64835',
                          '74817','39473','74717','48803','32934',
                          '24312','91181','50372','64049','17755',
                          '42520','88760','35013','67355','76071',
                          '81698','39246','54836','52428','93729',
                          '24299','80845','85953','77775','13358',
                          '95118','63386','19284','47020','57736',
                          '10405','36983','15456','33424','16964',
                          '69383','68244','11899','19428','72007',
                          '94682','51550','66963','13029','53342',
                          '72082','97045','31382','95350','91427',
                          '11173','92710','30189','61326','65529',
                          '86137','18128','31933','50053','11344',
                          '69160','67348','69457','24581','74544',
                          '23089','28935','63722','24493','31922',
                          '55901','17463','15536','14450','35772',
                          '46820','14044','51584','46423','39245',
                          '44276','86437','37767','99363','15296',
                          '77722','43936','10069','44830','87240',
                          '57703','20745','42619','94401')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


