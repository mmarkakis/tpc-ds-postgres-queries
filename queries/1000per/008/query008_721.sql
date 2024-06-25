
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
                          '90228','56922','96803','82814','80701','39902',
                          '61813','60519','33076','76426','62801',
                          '61899','24643','97801','50555','76028',
                          '31691','22450','91120','35311','55659',
                          '73226','98271','84941','48766','76253',
                          '76103','64303','84705','43516','47255',
                          '62860','66746','34418','55359','76489',
                          '63097','65796','22892','50735','61715',
                          '40382','11987','48301','24822','58726',
                          '88264','91407','36657','31459','34533',
                          '58270','74117','89839','81594','54574',
                          '25405','43104','37551','45903','61139',
                          '89030','29487','11504','30159','31019',
                          '91620','89868','11001','85967','86942',
                          '16975','80885','89248','76095','34046',
                          '53446','54396','42918','10725','85361',
                          '65238','78433','33908','96026','97053',
                          '36695','67803','58188','15315','92226',
                          '52819','13576','53489','31277','44908',
                          '10465','81058','64550','22814','79662',
                          '66542','96176','44714','21362','44236',
                          '36364','35780','29207','97916','48552',
                          '90891','19198','87158','50919','70555',
                          '14470','38705','13619','62849','15273',
                          '35520','19570','94772','47081','69419',
                          '53005','59190','89312','46044','49215',
                          '13325','27341','32636','55790','73681',
                          '58250','54810','48651','16744','21917',
                          '34844','14673','61810','99912','39961',
                          '25596','22275','21286','22991','46228',
                          '10038','44194','44129','91013','61172',
                          '39777','81951','70707','69040','83799',
                          '84008','18355','66586','89921','69668',
                          '44556','40260','10703','96940','64497',
                          '67376','10417','36596','17707','31216',
                          '88161','41840','73455','11684','62332',
                          '99021','24825','37127','74440','61858',
                          '19301','83634','72706','11653','91029',
                          '11638','39149','23337','69429','66588',
                          '45789','39218','55185','11348','12719',
                          '95256','21168','51508','39559','66502',
                          '49383','67271','38385','10212','82519',
                          '83925','65351','69876','12239','84535',
                          '25881','83083','44343','97367','93050',
                          '51062','39759','86657','32586','80068',
                          '37832','72371','70925','37561','11575',
                          '25607','60512','64689','10296','17726',
                          '62365','78584','53061','31028','90046',
                          '71630','58529','99917','68530','83822',
                          '70287','41153','99507','85867','44396',
                          '47613','46819','56722','78215','74363',
                          '51405','96252','14043','81272','92225',
                          '98583','49713','91361','47854','57843',
                          '49561','25783','31704','90528','58524',
                          '54817','51813','22018','28583','20927',
                          '32192','69914','64034','38798','52006',
                          '44789','34117','97756','89091','22866',
                          '42823','38361','25336','58918','31495',
                          '72486','84550','30114','29046','34416',
                          '30035','54937','66262','53460','80359',
                          '52271','64153','79703','79294','17259',
                          '48182','46346','30217','94321','86323',
                          '34204','43814','77861','24849','94864',
                          '11202','26973','29537','10472','59593',
                          '22993','43491','30433','25282','36872',
                          '16089','36563','58682','12749','10632',
                          '46037','90814','55755','29593','85685',
                          '97284','76912','80531','46575','61206',
                          '18066','79033','59696','54122','37053',
                          '69393','15606','26770','80948','67362',
                          '96376','22784','86073','12689','90581',
                          '24515','88599','56543','66751','54915',
                          '35339','94014','44187','91235','51054',
                          '24911','72414','31591','16157','70955',
                          '11629','16620','64482','83764','83685',
                          '41345','40318','84692','73085','39329',
                          '21790','46088','99039','29765','67497',
                          '11875','18720','16207','74850','50175',
                          '83865','28299','88018','17629','64963',
                          '17662','97545','49026','10927')
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

