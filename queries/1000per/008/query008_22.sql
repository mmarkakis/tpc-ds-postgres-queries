
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
                          '85721','40640','73641','31525','82975','73103',
                          '38931','47809','51644','15560','57732',
                          '79681','75957','82587','71745','32773',
                          '29619','42369','48810','27849','13187',
                          '24730','91743','75901','92091','80022',
                          '76204','19573','24256','81539','67940',
                          '82236','79606','74192','85242','47731',
                          '34477','93794','43133','17151','60529',
                          '12016','30706','17668','21868','23608',
                          '58075','78402','91131','59131','94827',
                          '46798','82903','87357','15594','49651',
                          '19434','80910','65310','56750','36445',
                          '41403','33073','63585','76000','46656',
                          '58718','73632','98621','21266','78418',
                          '85076','71339','28316','78273','26139',
                          '71191','61684','91734','69380','31379',
                          '41893','51799','84681','32953','57724',
                          '56828','40453','75482','64134','51054',
                          '51564','47503','46016','38139','55738',
                          '35107','95323','14881','99377','99861',
                          '39772','26453','57238','56751','36897',
                          '90512','93571','76417','22244','84015',
                          '34683','92101','42518','74116','60337',
                          '57280','20351','79299','42596','86844',
                          '75892','14682','93822','16448','17788',
                          '65852','41396','30331','26253','32596',
                          '21671','90288','83437','61572','77504',
                          '53110','94019','49413','43028','28877',
                          '84137','18363','41655','70761','32779',
                          '66926','90491','19396','73333','13324',
                          '65775','12472','86760','97171','34195',
                          '17162','83384','36972','13126','27940',
                          '75601','56365','78846','71211','89095',
                          '69520','67882','69597','49632','84861',
                          '78889','66462','28645','68645','28855',
                          '35693','19005','30187','75037','74268',
                          '37401','64598','40887','33697','51103',
                          '88369','74754','48345','84574','51694',
                          '89502','49265','27382','95428','33728',
                          '19450','46684','53733','60035','99266',
                          '76652','53626','44870','75809','60776',
                          '79411','39603','93861','40230','48264',
                          '10819','53642','67376','75979','17452',
                          '45821','94747','61894','90347','81712',
                          '18483','60437','49717','85224','13139',
                          '86119','19627','81258','77126','48215',
                          '13649','45458','97949','53310','69067',
                          '49571','12866','51486','13035','26927',
                          '44026','25016','55686','80258','92670',
                          '58068','45694','54409','17586','54414',
                          '87627','50667','55014','79759','47534',
                          '34538','21175','59449','11439','39015',
                          '41032','85934','68902','62468','20762',
                          '80375','55412','78406','97333','23416',
                          '50278','42506','59571','16242','82731',
                          '46109','29602','75019','10143','66355',
                          '11518','37856','63732','20305','57541',
                          '86569','25901','28300','15208','49605',
                          '49811','50746','91730','43748','60990',
                          '97475','77169','20546','99700','44662',
                          '73275','36658','65440','59747','99307',
                          '82342','45803','96157','74838','63495',
                          '19469','11044','46064','51001','89332',
                          '40839','70734','56911','44522','21879',
                          '45820','33539','92375','84885','62414',
                          '49337','71138','37200','52319','11782',
                          '37826','66526','84248','11759','73112',
                          '94621','70886','91482','87772','10915',
                          '98855','23084','65618','21433','75203',
                          '32148','22187','47819','57933','54122',
                          '71655','30405','92128','56871','95709',
                          '31592','19852','15466','79703','10427',
                          '55996','31483','33603','85518','72235',
                          '42557','59592','77900','61216','54086',
                          '37841','79876','60328','66356','21950',
                          '46861','86301','35795','91359','26749',
                          '33340','46697','17314','77201','98929',
                          '38707','27860','67765','31717','74387',
                          '98803','95207','76940','85919','37477',
                          '75312','31641','23382','25879')
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


