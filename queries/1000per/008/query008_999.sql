
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
                          '16108','99045','60578','48490','31122','68318',
                          '53058','88966','66527','38223','42811',
                          '68525','19002','27723','24456','91882',
                          '65214','62094','19486','38279','58388',
                          '56069','49801','67944','25400','61099',
                          '47345','51942','36614','86827','11812',
                          '25982','42188','60406','75725','53949',
                          '50062','53679','86261','47404','93284',
                          '48401','32608','16945','82540','87649',
                          '66216','70607','87849','35014','86448',
                          '97371','29431','78692','67860','12217',
                          '93860','10779','94178','94007','76175',
                          '58588','44520','74577','16970','59966',
                          '40390','25049','15043','98833','84471',
                          '67757','11307','59744','71891','69243',
                          '75366','91924','16335','99961','53156',
                          '50584','41431','84433','46870','89518',
                          '97813','17758','73115','45967','42447',
                          '50137','68842','51803','88446','10720',
                          '72065','99609','98829','94794','88244',
                          '59962','39986','57863','65879','71156',
                          '31870','72465','71675','94745','72742',
                          '42466','49368','58978','11831','55042',
                          '35813','80001','90599','63608','84127',
                          '46449','15057','42170','16401','85598',
                          '64960','15095','55853','24016','28814',
                          '83049','20453','68322','48558','44893',
                          '36091','92840','74152','68518','17358',
                          '61877','54422','56044','18540','16546',
                          '32756','61985','73022','66053','71691',
                          '73474','93124','49979','40723','85684',
                          '72941','90755','55076','56277','59336',
                          '88962','19650','27701','68849','72925',
                          '86237','46606','42367','41831','45647',
                          '95118','16538','94041','10054','77403',
                          '25021','99360','76129','84243','45217',
                          '50692','42428','62345','48352','72394',
                          '83039','23314','66513','78915','63148',
                          '68468','42065','80620','50863','84878',
                          '27153','53986','76919','23250','22304',
                          '62896','47379','81007','64368','37261',
                          '55635','13491','62538','49131','95498',
                          '74327','80499','33272','61562','96640',
                          '48185','12550','76783','50324','37598',
                          '77516','27360','37288','76098','46144',
                          '83151','49118','19858','76874','13561',
                          '88502','31225','72408','46187','51453',
                          '72423','93658','16998','25622','39451',
                          '98946','24880','55726','79100','34051',
                          '75810','39291','89490','80774','83104',
                          '11792','35369','20831','14480','42081',
                          '62735','23990','94750','61134','21066',
                          '20301','62064','19769','39600','49563',
                          '95273','86302','90163','72013','78888',
                          '30402','54879','37884','35641','47132',
                          '57395','30286','97840','90954','52804',
                          '72377','23485','65322','40645','86436',
                          '23405','64695','20059','86487','14535',
                          '94633','82819','98481','84232','92590',
                          '22870','31081','74687','80786','61835',
                          '38858','25935','71947','77338','11895',
                          '55954','61759','86801','70227','97455',
                          '23289','53437','43364','81983','80150',
                          '34546','58711','16776','73006','56043',
                          '17102','46135','58050','69071','76346',
                          '77120','79900','48588','15944','89157',
                          '12161','24478','33298','53524','89376',
                          '40677','46708','67859','20612','57198',
                          '32059','89411','97638','13772','50686',
                          '60667','75731','11194','71538','46871',
                          '59139','18251','43804','61358','30109',
                          '63647','20324','81390','99854','56861',
                          '77626','91234','67876','84805','96960',
                          '63879','33608','19932','36701','57609',
                          '62269','20014','31664','90202','52389',
                          '69964','70907','57750','90862','10419',
                          '65445','46382','63213','62861','12527',
                          '90568','67129','86045','77838','48961',
                          '41078','48118','82424','35099','60260',
                          '92016','88993','33746','75067')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


