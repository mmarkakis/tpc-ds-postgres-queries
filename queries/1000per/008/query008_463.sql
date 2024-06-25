
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
                          '39348','98301','62909','75126','10332','35402',
                          '43808','53603','27360','38376','13168',
                          '27506','65243','96846','32897','36249',
                          '56505','52414','16693','48989','24225',
                          '21583','87316','70257','70039','98264',
                          '67742','98018','75622','23743','82418',
                          '35281','19723','55462','33713','22327',
                          '91831','31388','15922','91978','94911',
                          '46495','16384','37320','98741','67468',
                          '60735','82056','90357','39713','94406',
                          '47228','84729','70112','72886','39870',
                          '29849','24960','29893','98344','35654',
                          '72964','75702','45175','63097','86144',
                          '37758','10047','13391','15701','50258',
                          '28184','10727','60984','28672','28134',
                          '85836','27828','10589','41808','60803',
                          '43756','25986','80899','43089','85149',
                          '21064','51523','52216','90068','52198',
                          '81153','73592','31955','12275','59908',
                          '41463','29661','49615','60704','72467',
                          '39519','20051','52850','21924','18156',
                          '91494','29412','96881','43335','44224',
                          '34607','73972','33876','66801','48913',
                          '33166','79879','99458','51624','15527',
                          '66541','67477','82088','13881','82811',
                          '32626','84552','55702','77203','29073',
                          '96583','98455','71883','99351','83274',
                          '69852','74467','94948','44788','95108',
                          '43282','46835','43376','99884','27862',
                          '51620','71500','75088','63910','41292',
                          '56968','16979','58784','21830','65423',
                          '69512','25241','69010','95522','44139',
                          '31951','43456','73090','87841','94725',
                          '66030','27724','42263','58567','64954',
                          '73066','24083','73698','43962','28438',
                          '21216','35269','89378','89288','55620',
                          '27040','70371','56971','51168','98705',
                          '31650','62513','22180','99163','92079',
                          '29437','99684','67821','74588','12032',
                          '39090','97883','36994','41030','16986',
                          '75391','44660','10044','26175','33297',
                          '57616','68962','64445','25144','16548',
                          '33698','68518','38024','74751','32402',
                          '70253','97113','96626','23535','27702',
                          '77817','18446','84061','67399','72394',
                          '32909','33357','53084','15544','91079',
                          '76832','95536','76561','64379','60480',
                          '90226','98440','84041','56090','52502',
                          '85709','74626','36721','61535','16316',
                          '28921','18944','16725','26119','82061',
                          '88062','76599','12058','69220','65761',
                          '79494','15005','63545','69352','91085',
                          '19997','69541','76609','46502','40507',
                          '65231','42696','27211','27469','10468',
                          '24991','58200','57497','31471','89949',
                          '62773','29187','75185','27223','95074',
                          '33099','45645','33735','42833','28745',
                          '67608','11323','61328','45001','21348',
                          '56210','83221','65086','73083','40870',
                          '54955','77678','43637','20196','74682',
                          '99750','31185','99985','45774','26997',
                          '88961','93969','89239','37285','88060',
                          '25784','44036','75493','43390','88617',
                          '44147','10486','37720','61768','33040',
                          '83707','56160','55146','42689','34901',
                          '78379','65594','20376','16073','87326',
                          '38100','59026','52842','89965','40007',
                          '51891','88107','13313','20510','61573',
                          '14159','76605','55681','55152','98008',
                          '13416','70578','77258','28605','36189',
                          '54351','83872','69493','22760','75281',
                          '59488','80218','21121','10260','86878',
                          '97685','73390','20206','89133','14631',
                          '29783','39342','97305','59515','92260',
                          '36430','38205','74461','33747','46211',
                          '65449','55751','40716','25274','23688',
                          '31751','80101','34681','67264','37154',
                          '12175','96018','18155','36328','62532',
                          '87934','32878','33936','60856','31302',
                          '64439','45412','48700','19321')
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

