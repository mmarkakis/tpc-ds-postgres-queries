
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
                          '48429','46038','66978','82052','34752','75770',
                          '72015','45090','68453','56363','77871',
                          '87162','58999','56675','45283','19342',
                          '33040','57612','91466','44771','89758',
                          '78698','92541','42796','42350','29287',
                          '88599','82306','27707','12251','43729',
                          '31916','37997','91817','12287','44409',
                          '22636','79411','50418','58031','22953',
                          '73319','78992','91200','93661','23177',
                          '54831','28667','67454','75564','97958',
                          '98194','76203','83631','43273','17734',
                          '50390','37499','32097','15234','51414',
                          '68248','81203','99628','45581','60562',
                          '30750','63776','46860','72603','38576',
                          '78897','63962','52876','89401','29323',
                          '62350','12275','40370','30112','74535',
                          '48584','67035','82050','74311','46447',
                          '96281','68440','58126','89715','55078',
                          '87033','83451','88123','82878','66708',
                          '95668','82889','57968','83703','34371',
                          '20296','86086','52417','80003','84437',
                          '79051','97208','35595','61033','45048',
                          '98945','77577','61599','83153','79074',
                          '99744','58336','33142','88849','11096',
                          '86427','36986','57255','88334','88260',
                          '13586','76812','40755','98053','69162',
                          '21502','36365','24591','63197','27110',
                          '16577','73952','99393','20733','54269',
                          '51725','39559','28824','25555','22462',
                          '39061','34410','67065','15859','28758',
                          '36344','27524','40676','62324','88174',
                          '85797','75079','27547','33510','37387',
                          '90163','59913','15719','86738','79228',
                          '24168','21848','18954','68364','55220',
                          '76702','71398','93920','37225','36254',
                          '55975','18248','19432','31744','65877',
                          '16980','12629','14982','18165','10438',
                          '22497','89894','59512','97715','12057',
                          '96306','68079','87917','84517','93975',
                          '63018','94087','32521','27917','62399',
                          '15441','28538','40747','33916','12297',
                          '15707','57954','71517','35540','69447',
                          '94229','12494','93716','68204','87541',
                          '73723','86919','86325','43115','38307',
                          '88268','24621','69096','66248','41189',
                          '22525','28522','86244','50456','37876',
                          '87382','28249','15513','37020','25712',
                          '81035','12992','84203','38405','36163',
                          '99734','87632','33838','73659','42505',
                          '41984','26930','82828','19589','80379',
                          '62279','49956','64342','90122','67097',
                          '85660','16759','79692','95338','65308',
                          '56701','41151','86706','78632','14628',
                          '26314','83158','13526','15744','44979',
                          '99653','13275','89866','36518','32775',
                          '90518','66871','93117','25813','71139',
                          '34898','34276','68200','47710','75431',
                          '98125','52100','31602','12005','40282',
                          '33513','79096','49866','99619','78721',
                          '48366','41083','83474','49390','49165',
                          '64222','74456','77351','63243','68903',
                          '82984','25338','44211','25550','68651',
                          '91298','31855','65061','23266','48252',
                          '19218','41253','46806','67500','13061',
                          '41725','31902','85084','68468','45122',
                          '36512','56564','12087','89596','45817',
                          '98326','13013','96748','94991','91284',
                          '22536','88336','68407','67271','90994',
                          '57276','83470','24987','28313','23425',
                          '76245','78643','21065','63744','86565',
                          '86525','35039','49032','14302','78709',
                          '36333','76635','11261','69592','79712',
                          '81812','19134','24869','14129','34525',
                          '87760','47351','75514','75057','46613',
                          '72258','32838','31008','53105','81994',
                          '14317','56607','95115','48637','99039',
                          '49134','21962','78573','12048','89488',
                          '13751','99655','74231','55687','36795',
                          '98878','80069','16956','87082','45475',
                          '49970','64395','26703','63110')
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
  and d_qoy = 2 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


