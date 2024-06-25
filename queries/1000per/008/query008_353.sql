
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
                          '23657','53611','81674','70529','82017','60426',
                          '36725','73515','36286','84758','74479',
                          '12947','73272','72029','26371','80631',
                          '12925','91263','24444','54365','55217',
                          '13750','39582','20014','47112','40325',
                          '62297','72398','16917','85570','66321',
                          '20205','49732','37801','50684','56891',
                          '73900','64764','66360','54693','35043',
                          '88720','50535','12097','32750','75648',
                          '89769','86053','95732','96527','99856',
                          '89603','60585','80729','41470','60037',
                          '64304','90319','20536','80344','93411',
                          '47205','64185','29260','78676','26560',
                          '40421','65495','99912','84836','36879',
                          '12767','13184','46287','22862','39309',
                          '99508','90054','20251','60418','17160',
                          '25440','96993','64495','42088','97639',
                          '55411','24983','58686','47705','64477',
                          '31674','29740','23095','61340','11885',
                          '42201','70187','97924','77516','92667',
                          '78373','24468','42787','48987','31507',
                          '78662','34723','15458','56652','35666',
                          '69018','96421','28424','32275','89417',
                          '84060','53288','82492','59024','27916',
                          '91311','96463','65022','79096','64818',
                          '15483','81314','44396','49163','86162',
                          '23031','53829','62863','38209','52494',
                          '78206','30218','71303','11646','21161',
                          '48094','65801','62492','72747','68905',
                          '29267','62574','42949','78177','26573',
                          '71320','19532','93196','76429','87248',
                          '97576','61892','25974','86980','48297',
                          '25232','95704','28464','97435','38821',
                          '10513','58536','58842','50716','54582',
                          '92214','59851','78680','31696','67336',
                          '17702','74644','79475','80577','64002',
                          '92636','67076','23597','95639','71227',
                          '79583','73446','76024','51129','76522',
                          '44984','99116','66622','79757','10098',
                          '54910','79449','97973','94629','21426',
                          '97872','59391','42438','47541','41138',
                          '11360','12977','84684','62586','15018',
                          '97640','15745','23229','80127','69841',
                          '81096','86590','64027','14846','51987',
                          '54781','38269','51186','32326','49747',
                          '31373','44461','51239','86277','87399',
                          '31682','52934','78732','35598','95780',
                          '26660','88975','87044','75559','38098',
                          '17084','55907','48575','70520','79526',
                          '46628','67127','84844','44175','18013',
                          '29244','89063','93682','11216','36602',
                          '89975','25288','82654','43154','21934',
                          '90564','12907','78542','82939','21103',
                          '18609','51011','68113','53081','96650',
                          '44069','87730','87906','76579','45277',
                          '90179','57223','83842','31180','78774',
                          '36608','45325','17451','34446','71247',
                          '89275','45791','44777','99475','91446',
                          '42443','97236','79256','31845','22346',
                          '67736','36504','60246','67621','76527',
                          '25355','35421','27789','91406','78513',
                          '95179','92532','78112','49746','30424',
                          '39566','73779','96805','29065','22523',
                          '25344','33874','71475','91867','78963',
                          '74790','65539','70389','78332','24558',
                          '18197','21705','85210','60578','16416',
                          '74398','76671','34830','16353','79518',
                          '62210','10520','41572','92791','13038',
                          '17649','20325','59909','64766','72213',
                          '76731','41169','79446','62124','11969',
                          '73090','52027','11431','85166','30332',
                          '32293','29669','48863','94427','11154',
                          '81808','94058','90937','42115','73094',
                          '54539','95635','62284','42081','70560',
                          '65733','61522','93876','86114','36055',
                          '39117','30098','56130','86076','29255',
                          '15551','61173','61841','19745','92745',
                          '35012','30439','20769','22233','97440',
                          '40847','69169','92769','25756','86553',
                          '21522','54614','70055','13402')
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

