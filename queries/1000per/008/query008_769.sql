
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
                          '12985','25983','39615','48808','64746','91714',
                          '22971','85885','20315','65335','54097',
                          '98409','44618','39859','69174','33625',
                          '60203','95817','58301','31144','73823',
                          '37042','25274','44368','49492','47135',
                          '16051','97054','56402','67979','36497',
                          '49282','29968','78677','61432','93513',
                          '47036','93564','89238','20158','80346',
                          '23160','61266','58842','56005','88137',
                          '65760','54975','48418','57187','23472',
                          '65364','32643','99976','10047','30706',
                          '44477','88600','15132','26951','19838',
                          '32209','77218','84248','57781','51764',
                          '77548','29893','55996','38077','89591',
                          '55981','29549','61362','50745','29215',
                          '22279','29398','93537','98257','98604',
                          '36377','63311','83217','32821','22730',
                          '19019','19659','65914','82163','91125',
                          '94014','15619','30567','94969','20281',
                          '84919','70188','45598','29910','98542',
                          '70481','77973','89994','43825','10401',
                          '52331','97021','30312','71216','35439',
                          '75208','95176','38667','48892','63331',
                          '11448','47713','70636','44591','54884',
                          '92974','81434','19947','72984','66045',
                          '52817','31995','44383','44670','22651',
                          '31337','53142','32085','90443','89152',
                          '21661','65961','11438','87573','97401',
                          '79784','80642','40092','71712','64926',
                          '12409','54111','38689','31958','92832',
                          '87718','33960','78802','44884','18590',
                          '17789','12711','34824','78092','22508',
                          '18627','91269','54682','84043','95108',
                          '13336','58246','73466','16478','84625',
                          '91223','13102','27992','69595','85358',
                          '38886','86023','23479','17684','40234',
                          '85286','18604','53988','41643','96184',
                          '72769','70407','28530','30932','51146',
                          '15185','20317','70356','43308','11608',
                          '71069','24492','18167','35177','88184',
                          '67438','40521','81067','49143','24620',
                          '63149','67616','35457','12889','80064',
                          '79851','95702','12442','84182','99338',
                          '33938','41493','75663','14489','62657',
                          '91484','92950','22567','21359','89069',
                          '71630','70026','65810','79019','87331',
                          '31222','76611','10653','75498','94283',
                          '75940','73886','76814','24839','71272',
                          '11121','63128','47849','60964','42002',
                          '34572','64828','63343','10295','95684',
                          '93618','26415','11631','70024','44714',
                          '71511','69733','68173','82879','20188',
                          '85880','32461','48155','58566','26710',
                          '59995','66926','26744','90167','63418',
                          '72617','52104','39782','73323','83227',
                          '10050','47460','87338','31831','40478',
                          '28746','78767','44078','58472','40653',
                          '62983','45486','38060','51216','46198',
                          '85483','57492','33266','83633','80629',
                          '51221','34121','75220','54848','74868',
                          '28564','18030','55433','17501','13850',
                          '83774','62652','96740','54214','99200',
                          '84273','66013','26477','76051','90706',
                          '25782','61172','55092','16323','19329',
                          '97899','94544','79524','31284','43983',
                          '64424','90434','11949','53409','99994',
                          '77400','43029','62353','74677','57023',
                          '11595','92520','90881','15905','51438',
                          '16016','97903','28467','11893','29470',
                          '43456','10635','56758','80154','60506',
                          '54265','86526','37887','72459','22640',
                          '89739','89714','95551','28910','79048',
                          '65553','11246','87952','29333','90999',
                          '67800','26148','80103','56633','38479',
                          '65762','30138','72262','44708','31949',
                          '94721','45096','54248','85469','47251',
                          '84695','17048','16393','84626','86269',
                          '20018','13842','40822','82190','75558',
                          '21150','69734','89781','21461','60201',
                          '28327','55633','25819','49100')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

