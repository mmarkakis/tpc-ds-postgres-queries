
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
                          '81085','11995','95357','68402','29720','74762',
                          '67062','54919','53711','84795','17371',
                          '80716','81723','56888','23838','24804',
                          '79936','34981','16694','60894','49161',
                          '53404','43813','90373','94108','79507',
                          '28599','16040','41307','74287','98096',
                          '62369','59323','82221','40741','55765',
                          '35855','15481','13942','73962','45106',
                          '84571','32663','80293','56198','80816',
                          '71604','90804','63369','81486','70807',
                          '55779','40384','40292','52406','73084',
                          '37340','25253','36750','64597','56944',
                          '82465','32885','41472','23890','85002',
                          '16550','58142','68505','14616','95862',
                          '60174','62061','79693','46803','43790',
                          '81175','72095','36994','77858','56353',
                          '31968','49979','17153','89935','60548',
                          '96218','24782','76160','60302','23212',
                          '27090','27760','24069','41229','70927',
                          '38500','76525','48409','92936','83339',
                          '76996','29559','52427','19876','98015',
                          '53396','12785','95150','20335','11080',
                          '98176','47447','52490','90723','97603',
                          '93721','28967','69336','92854','84116',
                          '27252','60907','17071','13895','95198',
                          '55040','35369','95476','89173','11643',
                          '87389','93923','36529','17255','39757',
                          '54052','30708','79602','64349','46482',
                          '58583','42868','85930','21428','77195',
                          '62975','53481','18216','55555','60167',
                          '79825','58638','63325','10602','86107',
                          '87851','44112','10624','46404','81804',
                          '70166','17564','26541','45457','76603',
                          '19277','47467','43114','24923','42632',
                          '25913','23248','56778','49745','12372',
                          '52352','67127','42237','86257','81376',
                          '76477','65928','55629','22407','84983',
                          '47030','52875','76644','21427','62941',
                          '32409','79325','44516','66878','79688',
                          '89422','19831','71147','52495','95286',
                          '30370','38855','62641','43450','54838',
                          '12555','95502','28872','55507','99971',
                          '53424','29895','19688','55089','12975',
                          '12270','28741','58616','87745','34591',
                          '72123','61938','20690','80763','63902',
                          '58988','20816','34534','54881','85646',
                          '48892','82436','73605','78735','94663',
                          '25256','32728','93905','99016','49832',
                          '70070','38486','86620','78290','67903',
                          '53086','40380','40993','68395','65392',
                          '73910','39659','22995','69688','13981',
                          '23911','10128','28486','65498','15175',
                          '12797','72353','75911','79203','73011',
                          '54320','24135','85864','32034','60721',
                          '85206','18084','55778','56744','82971',
                          '99815','48598','77396','64403','97055',
                          '36260','63698','48663','65819','44319',
                          '32942','48801','25818','58008','52813',
                          '55692','16797','13167','20491','23550',
                          '90004','72380','95135','44558','89490',
                          '45912','89677','36834','91975','82705',
                          '71794','13701','81099','90314','39196',
                          '59772','81938','37532','73021','40926',
                          '27581','48780','47009','48200','22766',
                          '93145','26582','91257','80088','79621',
                          '89579','40688','47022','16405','42375',
                          '18322','91798','89461','50111','56385',
                          '60774','33340','28996','63238','37524',
                          '29459','44945','35671','74631','17058',
                          '43282','18512','39243','11121','41019',
                          '50000','13172','17979','13182','70788',
                          '71093','98746','52533','17504','19071',
                          '30751','17289','70503','17655','87775',
                          '93582','23887','26952','30511','24821',
                          '51595','88706','63539','83491','70599',
                          '31798','57832','68626','36357','31868',
                          '83018','27726','57653','27295','98046',
                          '15712','69838','55478','30940','55843',
                          '46802','86373','16983','91313','73519',
                          '55081','63167','50914','69657')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


