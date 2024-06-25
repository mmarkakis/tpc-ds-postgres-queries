
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
                          '21057','37922','17811','35975','43709','40131',
                          '13494','32314','66991','29486','12648',
                          '86335','59357','56284','49925','27020',
                          '82187','59567','50097','74188','21544',
                          '55027','78468','50678','86954','77051',
                          '44156','86135','39474','42741','20258',
                          '80087','91447','84052','36503','46244',
                          '64636','49531','24269','62925','51308',
                          '42220','81296','36504','19910','97980',
                          '17975','78846','15547','35503','47575',
                          '16757','40242','39133','25476','76396',
                          '34843','76758','98986','28341','71564',
                          '21733','75343','26588','57927','55335',
                          '24883','38302','48907','96080','71073',
                          '43789','91208','76813','85766','31836',
                          '34757','90940','69256','27366','86026',
                          '87155','64870','66501','64607','76326',
                          '21006','46820','69785','18123','78164',
                          '26472','87178','21686','90438','42884',
                          '26363','13654','34577','33850','53294',
                          '89692','10616','23959','89688','65109',
                          '93038','65521','47256','65002','55755',
                          '85270','67448','39641','32391','94350',
                          '26189','54072','51311','99089','46798',
                          '97847','22393','53454','67254','50304',
                          '17941','95053','47880','13578','86263',
                          '73010','38629','28825','83735','37524',
                          '69865','43865','32636','95515','70160',
                          '25520','37761','26494','26224','93421',
                          '85183','43953','16159','80692','74405',
                          '14453','34515','69070','37854','31683',
                          '53702','44846','92496','71577','41398',
                          '27714','44414','73250','89045','22219',
                          '50488','51645','92922','61566','21473',
                          '52876','41382','83812','38285','99985',
                          '93487','53431','52538','82754','73626',
                          '89924','41317','90808','49466','11141',
                          '42862','65131','47865','31853','24573',
                          '31900','32728','17561','47590','90592',
                          '72028','21111','11580','96939','31063',
                          '92650','54379','28910','73091','38490',
                          '53562','73407','33943','94196','31814',
                          '14751','27538','80924','43050','89469',
                          '85620','69853','48267','46707','38752',
                          '56175','22221','85084','92435','68251',
                          '97729','60609','47500','85670','22128',
                          '71791','27968','81512','55183','42184',
                          '17348','79427','18674','90059','64502',
                          '27531','78159','19301','19797','96053',
                          '97774','84000','59066','27694','41333',
                          '20266','19668','63382','39285','39628',
                          '79999','56034','51744','83770','13263',
                          '98208','57329','62621','28213','71211',
                          '33119','97608','84951','32793','13664',
                          '72805','37777','34314','92793','94116',
                          '69198','36142','77665','58993','84466',
                          '38995','54068','59627','41006','82931',
                          '22547','10210','68755','53535','61438',
                          '49328','36761','36712','66004','12587',
                          '29602','48482','52855','87039','39067',
                          '25453','29804','35849','13107','73106',
                          '88042','50265','55522','48095','55578',
                          '31022','70949','62390','28048','29728',
                          '75271','25984','53226','74458','67154',
                          '28304','48550','92546','23002','58231',
                          '21560','32941','56671','96310','36405',
                          '16194','19234','63715','31895','65840',
                          '23515','99988','54201','32606','66905',
                          '45093','53514','50904','19060','87889',
                          '35713','23384','26907','24669','30356',
                          '35555','54539','71754','99548','95494',
                          '44043','36530','88970','72702','89297',
                          '21927','54949','17879','86009','77625',
                          '77212','31901','61673','41564','16752',
                          '20006','92665','70011','20710','91381',
                          '64928','10177','20747','69982','78394',
                          '74239','95074','62368','54193','38306',
                          '91152','23759','17450','79265','36374',
                          '85743','55039','12384','68408','99802',
                          '46004','31576','66219','33257')
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


