
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
                          '10293','57794','41696','44220','26544','58516',
                          '85694','33346','63398','23742','28764',
                          '48747','85810','22655','33915','72313',
                          '69677','41619','65482','82089','99024',
                          '55624','17117','55759','29870','85038',
                          '22988','28963','94319','66791','66861',
                          '79310','23197','39613','13831','67340',
                          '57981','39565','19977','25375','86387',
                          '51424','43672','93351','25655','30242',
                          '10971','56057','96153','55211','14898',
                          '32237','89674','86605','24488','63196',
                          '63148','53663','72847','23321','52981',
                          '26339','73978','38689','79151','96024',
                          '39991','58811','15214','85023','62362',
                          '32720','47529','62107','90116','34609',
                          '22849','73242','94371','34860','79163',
                          '90575','26494','62161','97890','78910',
                          '15063','26903','47892','90149','20101',
                          '28805','79786','48839','76828','88009',
                          '55453','24755','17738','31296','62182',
                          '65499','16890','51974','57253','21952',
                          '67687','36178','38503','89814','37789',
                          '24248','93654','90054','79463','33259',
                          '50368','34368','48075','99043','99898',
                          '79589','31409','37207','49240','16642',
                          '79137','43282','33411','54874','90638',
                          '77162','42218','22954','40084','37364',
                          '88993','51574','72301','11266','28222',
                          '64921','37640','57578','53417','39552',
                          '56806','98218','59161','74477','22180',
                          '76925','73744','66304','62648','37804',
                          '77744','57625','57511','53194','23842',
                          '70507','89229','40638','20806','85097',
                          '81833','35369','31880','99884','53012',
                          '82797','36929','45139','73388','74064',
                          '92158','98725','92977','29847','61278',
                          '79134','10010','25503','40491','12671',
                          '60066','11890','99750','22274','96241',
                          '81521','41140','67221','68208','39413',
                          '71877','86572','23551','97106','13315',
                          '20496','70990','67498','89191','82606',
                          '19866','50382','75853','54387','56372',
                          '68223','15286','41812','89849','89259',
                          '64201','53667','68431','72050','76168',
                          '65883','72140','17868','26301','53775',
                          '54869','66826','23403','91153','53293',
                          '84430','40715','17328','61574','58025',
                          '87994','83587','93649','25477','76986',
                          '41280','25448','84083','82846','50316',
                          '34805','16322','19920','86583','84549',
                          '31219','83407','90065','80673','28507',
                          '34380','58788','48952','32503','23850',
                          '60298','49147','42870','67774','68252',
                          '81589','61899','88392','21635','19654',
                          '18270','81271','96348','33963','65466',
                          '15750','87914','50679','20499','34802',
                          '52337','59444','99160','59774','63297',
                          '44558','17098','27325','73546','60722',
                          '76607','50551','75537','32826','94920',
                          '12964','99978','55768','79499','82636',
                          '65160','71585','52356','32797','48541',
                          '57182','22085','41921','71956','50643',
                          '36436','42568','51065','85180','19441',
                          '71916','77485','50328','43049','92102',
                          '27964','95870','71065','43985','48733',
                          '56835','52929','60173','42115','66586',
                          '17683','55293','54311','75179','60650',
                          '31240','97090','15252','42012','16663',
                          '29291','22162','49607','26902','51716',
                          '13677','92629','88167','60028','73268',
                          '51844','68423','14584','94257','57324',
                          '94954','36181','82430','60866','90783',
                          '13158','90402','34519','79002','34072',
                          '92791','40143','89685','27886','37794',
                          '69331','42980','14265','15407','24754',
                          '58611','45749','50367','64397','41624',
                          '53209','36373','22183','17114','20376',
                          '78915','25217','95789','11626','69823',
                          '33384','37257','63252','38574','73576',
                          '43137','57658','81409','46576')
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


