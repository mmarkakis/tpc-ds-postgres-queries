
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
                          '18705','65295','95999','39998','75738','94612',
                          '42674','73557','48233','54353','60863',
                          '53080','70186','89009','11698','80922',
                          '86892','99865','90327','86095','23014',
                          '64696','76417','49852','43552','74126',
                          '39889','27904','35323','11590','22594',
                          '20938','74027','10336','64915','78073',
                          '54269','99602','14156','58061','47790',
                          '61172','30191','78104','36628','48417',
                          '88102','28877','78195','13530','88100',
                          '22375','51760','99589','30362','35256',
                          '73567','57661','18474','21152','26002',
                          '93137','83032','67284','16537','31335',
                          '39501','17180','22088','81288','42099',
                          '38947','21934','54531','80964','11975',
                          '90422','65973','90093','94485','92053',
                          '98965','38828','91765','45093','28511',
                          '57241','79875','50911','84412','25366',
                          '68486','60866','87925','21181','59639',
                          '68530','18557','74978','64075','95744',
                          '38041','41663','19338','23165','72127',
                          '22734','88590','53639','33935','63215',
                          '41060','59329','65994','78728','71637',
                          '74465','81158','31259','30773','56884',
                          '30969','27493','91353','56689','53721',
                          '79403','42661','43303','68062','39495',
                          '19976','25309','98875','77527','56809',
                          '70753','58576','48272','78931','71897',
                          '87144','42547','57010','71370','44347',
                          '96088','90997','49925','24211','30941',
                          '53648','28927','78595','37709','28304',
                          '51341','22840','82799','28106','61134',
                          '56874','44178','19315','86713','79220',
                          '56121','76410','16637','62886','37771',
                          '10617','90582','36956','24737','68430',
                          '72755','78050','67343','16950','87027',
                          '47033','14006','43883','72054','68855',
                          '36634','80255','61049','22834','73480',
                          '89050','68593','13005','29893','81102',
                          '24022','63563','58545','32185','29673',
                          '62975','14005','97198','93629','86788',
                          '48987','12675','23083','28984','98302',
                          '46569','69545','70894','98113','92893',
                          '87358','47772','65217','64055','55858',
                          '27752','98308','44530','84805','68519',
                          '65341','59202','65836','91560','91659',
                          '93798','21323','28052','36488','57939',
                          '37573','10691','65738','45343','34255',
                          '53672','31860','65912','36540','24517',
                          '24625','75407','58911','47702','60373',
                          '31901','54441','30490','64209','55399',
                          '21954','20801','82763','53748','95289',
                          '87709','89710','29679','30664','84350',
                          '22534','56310','59793','68359','18000',
                          '76986','75058','51000','62471','79410',
                          '37004','86119','72902','53468','49898',
                          '49940','60338','72874','21158','92825',
                          '34943','88453','23347','26665','36246',
                          '54260','78047','78221','80421','63110',
                          '63295','32561','53487','17985','59254',
                          '39137','93669','12533','67688','62139',
                          '76094','88084','30739','41073','88937',
                          '76705','27052','40529','50365','77033',
                          '14612','36191','47908','75149','55035',
                          '75147','65343','58559','81423','97560',
                          '55994','12668','89852','31940','44867',
                          '92348','13766','39975','74321','90320',
                          '57246','42956','59653','36879','54916',
                          '22799','98060','37223','17404','85049',
                          '16978','77787','83350','25180','10475',
                          '13237','81248','21676','42221','55432',
                          '59309','66581','52931','69498','23453',
                          '60950','43854','38562','28506','85448',
                          '64678','41053','37749','56470','81077',
                          '69067','45188','52958','67087','37301',
                          '20035','99756','76624','75451','36490',
                          '16427','30803','59497','26009','13878',
                          '18023','73988','36428','10591','33911',
                          '77903','37064','90244','83370','90364',
                          '15676','19073','23374','13925')
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


