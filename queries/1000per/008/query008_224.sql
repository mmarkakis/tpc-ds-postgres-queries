
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
                          '76268','71424','24235','36329','44594','43817',
                          '67403','47351','54336','33630','93854',
                          '61041','86045','13003','25319','25176',
                          '88683','85202','89728','26975','76344',
                          '25624','41471','66825','31870','76330',
                          '24146','95154','98475','27230','58871',
                          '93367','48366','26955','79990','74712',
                          '73776','80985','90740','28071','50214',
                          '14928','98914','39310','80307','19095',
                          '17116','12462','22296','58103','22806',
                          '89410','92526','97025','98750','43215',
                          '67977','94114','81915','20031','99398',
                          '97364','83965','39147','21671','74867',
                          '85303','96473','54708','56647','52088',
                          '57801','37632','52302','32640','92776',
                          '37787','66038','13537','82751','72930',
                          '25962','47506','52986','58773','80387',
                          '27203','89325','14109','83267','87902',
                          '34617','85439','62819','39911','12946',
                          '48965','35043','93967','74502','74476',
                          '62990','56955','51309','40684','26523',
                          '64186','38965','43676','41856','30198',
                          '54888','88963','81525','70727','88845',
                          '89250','79187','19768','78963','94803',
                          '37741','96893','35135','42054','74568',
                          '20800','48777','95381','65219','73304',
                          '34470','57296','88961','88887','54886',
                          '37783','43823','94488','70603','20995',
                          '68161','42144','60358','33696','87323',
                          '27375','95621','10885','91071','52684',
                          '28526','14780','41123','50891','96689',
                          '67176','37891','46501','93697','97133',
                          '66867','50426','60146','48848','64151',
                          '21656','59461','75789','40837','73182',
                          '10021','35106','30113','13258','97707',
                          '29270','19491','56642','93515','71460',
                          '57219','99628','81216','93977','73756',
                          '16870','31162','57504','75644','38708',
                          '12281','98403','63036','53255','32018',
                          '62679','36810','42865','54230','12012',
                          '96298','11748','18034','73582','75156',
                          '14226','35960','90311','33124','58627',
                          '55862','41657','24672','20671','16486',
                          '57958','51010','47140','14890','66902',
                          '84214','86136','32023','54718','84267',
                          '36986','23090','37017','62312','60259',
                          '15552','93506','82965','91701','33108',
                          '20240','75709','13479','23068','22590',
                          '46022','61490','65376','24754','71573',
                          '59878','49407','47851','72329','92464',
                          '94128','47142','32598','43490','21204',
                          '66441','13858','58004','90686','61765',
                          '92774','68108','65709','88554','72071',
                          '32429','29442','69026','13481','65424',
                          '81024','96156','58077','41637','42462',
                          '66034','60048','87271','28905','42141',
                          '66408','27891','30663','70923','16118',
                          '71996','11772','32635','86345','74920',
                          '98524','11945','18726','25461','58163',
                          '21807','43654','61600','41156','81058',
                          '40845','60294','95372','19858','22465',
                          '51442','91943','22662','53025','28532',
                          '71299','49872','17466','76180','15772',
                          '27274','52508','83710','74891','57122',
                          '23569','63984','34512','13543','96904',
                          '47493','27307','65969','67468','93446',
                          '76975','15044','26349','71428','33792',
                          '58143','82930','24054','52660','51546',
                          '11097','49653','61786','69571','32315',
                          '51649','43906','30005','46678','39220',
                          '55037','65679','62572','57302','84180',
                          '79164','60617','48856','69426','83357',
                          '97066','55284','71130','56116','78743',
                          '63192','82276','77805','36936','84809',
                          '25086','70973','73235','51415','43844',
                          '39139','50176','41075','94483','65937',
                          '21022','74962','36748','81803','25552',
                          '72916','42645','61369','60643','86250',
                          '68787','29882','46274','70877','49170',
                          '16063','12445','94593','63836')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


