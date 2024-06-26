
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
                          '50658','58278','97361','20299','94962','80744',
                          '55507','86582','13632','85731','66529',
                          '94017','20331','29495','67838','54211',
                          '54061','81064','49729','46180','11645',
                          '60997','32036','16867','56651','78960',
                          '87543','44980','45932','93872','74574',
                          '98686','12162','51873','60333','78205',
                          '30269','51267','41571','53878','52757',
                          '42226','43347','64742','86114','82097',
                          '38265','19568','85196','33805','77041',
                          '93018','10289','77776','95406','90328',
                          '65779','77588','72481','89852','82739',
                          '44911','94626','30879','81617','22291',
                          '90875','59830','20566','86725','45370',
                          '11487','63173','20457','85640','30313',
                          '71473','57241','95889','21094','84258',
                          '51506','66497','66431','22726','39406',
                          '50531','99966','18840','85527','71750',
                          '12385','21331','65445','75426','14772',
                          '10445','90526','17306','70627','73544',
                          '96826','51087','15996','31097','75191',
                          '76253','91531','26043','91880','72676',
                          '70692','43092','82354','53325','84734',
                          '44213','21314','98016','78691','85448',
                          '95670','66499','40595','22834','14045',
                          '40913','43530','93503','88310','31779',
                          '47510','80625','75320','55792','46205',
                          '61715','74145','27761','61790','72692',
                          '20197','29821','59416','49499','35182',
                          '47091','87561','66351','31759','43077',
                          '63752','39429','99199','34545','94099',
                          '63698','26959','25204','28051','38652',
                          '10757','64934','81575','89880','12449',
                          '12078','67312','58376','94854','96719',
                          '48478','28670','87999','82351','47250',
                          '52159','13164','65089','14795','35237',
                          '31875','87792','95052','29829','62984',
                          '52351','75330','77831','86310','23643',
                          '88292','98915','49095','34969','20909',
                          '69376','67907','58068','22971','60046',
                          '91318','61549','37824','48432','20178',
                          '15656','30811','83435','30660','24006',
                          '47531','33352','48330','82334','56965',
                          '20394','18400','61322','70180','87038',
                          '79705','76961','38415','75011','67164',
                          '66281','26488','48118','72440','15706',
                          '16578','63662','90591','21892','49419',
                          '11398','53052','94910','49416','52309',
                          '64202','94674','98897','83680','68392',
                          '70887','69637','50431','97304','81172',
                          '96577','84284','86368','82613','28970',
                          '31752','64076','82088','37568','55106',
                          '14924','78987','15277','76164','17088',
                          '34500','97196','14186','95845','90508',
                          '38470','66341','89525','18411','61130',
                          '77605','84500','99897','35686','26895',
                          '49772','53278','10845','25993','68807',
                          '76943','36512','87937','90269','27365',
                          '15663','42169','63139','10619','54258',
                          '30335','28407','16171','42259','15867',
                          '31909','16017','17235','58372','80588',
                          '61640','34532','71182','48474','97762',
                          '67289','50875','45709','16169','89820',
                          '27772','48232','81021','80998','36834',
                          '79860','71778','28735','32918','97000',
                          '18335','76595','30279','85292','78617',
                          '72641','86031','37854','50838','40565',
                          '25893','97933','23357','81313','56602',
                          '74862','27084','95896','66015','12819',
                          '37115','66239','68103','32776','92964',
                          '29903','29115','97421','99571','22657',
                          '50493','65203','76348','37442','14822',
                          '17246','37029','49723','13588','35426',
                          '29436','53287','17217','96374','48224',
                          '35658','54373','80416','71177','32912',
                          '68508','40069','67977','53720','74454',
                          '89434','36354','26901','89881','85173',
                          '51088','65736','79666','76006','57648',
                          '61008','41326','84754','15217','56725',
                          '61761','19370','39057','24706')
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


