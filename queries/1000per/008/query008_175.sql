
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
                          '34074','41103','46036','37680','57568','76048',
                          '77518','75637','33218','10474','17090',
                          '94418','18702','94987','44854','54951',
                          '82664','11150','12811','92951','55557',
                          '63277','57376','71992','22441','12959',
                          '27041','42577','68628','30227','36816',
                          '15527','80604','93039','63769','17179',
                          '30803','34660','44319','82069','77248',
                          '66011','35121','91465','46633','48482',
                          '36602','81994','57919','26833','24978',
                          '53381','97857','22750','34261','92734',
                          '93483','78880','98544','57239','65459',
                          '13085','77684','18022','97304','99828',
                          '21456','86646','62105','60570','68418',
                          '44917','17213','34132','39678','34112',
                          '44403','17049','93629','14445','40399',
                          '58587','23546','56151','61976','42277',
                          '65155','52087','86614','38050','85643',
                          '37397','72946','26916','95919','17784',
                          '29764','76672','12735','36361','68773',
                          '14755','42448','34355','58269','26135',
                          '84745','73604','69004','62516','77578',
                          '10040','70050','48333','38720','29061',
                          '48126','67941','25716','92921','37337',
                          '93420','76891','58169','44560','16110',
                          '27296','72032','79939','57437','41700',
                          '55630','13676','54848','23734','23245',
                          '81140','41564','47121','15466','10541',
                          '68568','46533','12004','29874','36279',
                          '38686','15623','90777','99124','88939',
                          '92496','35896','86098','97045','13613',
                          '71149','21340','79663','37677','32777',
                          '11529','77231','55772','39285','87187',
                          '82256','59479','71318','72259','63519',
                          '97221','78415','58494','70735','13217',
                          '37132','41579','15798','10885','37273',
                          '42427','45293','33700','15718','37148',
                          '24572','93092','20153','84380','21247',
                          '83387','73437','31704','72521','20110',
                          '60582','69681','41090','12688','94630',
                          '31925','93722','79972','94537','90534',
                          '61659','65292','24261','94335','81879',
                          '37804','27043','90037','20366','53280',
                          '83435','29196','55817','96365','49407',
                          '49916','91357','12605','20707','93020',
                          '94894','49089','79814','83110','73297',
                          '54661','16930','70480','70195','69170',
                          '15167','45625','70761','29835','65766',
                          '78173','25178','36547','43134','63860',
                          '31466','14187','73148','79331','94294',
                          '93323','86577','11781','70806','31232',
                          '75485','99672','20751','45872','30784',
                          '78358','63352','77608','23981','65467',
                          '79638','54764','43156','15088','61238',
                          '83869','13105','34926','10135','43010',
                          '74377','20085','41514','76554','97113',
                          '85372','20303','20435','91474','55329',
                          '82842','36510','71172','77149','11084',
                          '90491','89204','86852','12521','71817',
                          '62842','24368','53430','11728','65567',
                          '80516','54901','90480','22426','90754',
                          '11806','19443','74418','43645','80235',
                          '36742','66861','18429','81191','75977',
                          '12553','23082','52496','86733','93023',
                          '88462','52271','33646','45038','39169',
                          '89700','10722','39683','81258','83192',
                          '66742','48158','14226','52445','40740',
                          '80270','77757','28302','25381','46332',
                          '42594','89584','66084','88584','13941',
                          '72702','36805','65556','98308','94484',
                          '83484','43111','94702','39033','98524',
                          '60421','49160','88485','36689','33508',
                          '91472','15557','79162','48019','14477',
                          '51523','17871','27025','13321','22480',
                          '47731','89906','39477','25742','93583',
                          '23288','59012','66933','43722','45218',
                          '79985','21017','77309','85547','65251',
                          '62113','31394','64397','50299','92859',
                          '15720','82204','81891','42719','47219',
                          '57788','17907','58414','99669')
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
  and d_qoy = 1 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

