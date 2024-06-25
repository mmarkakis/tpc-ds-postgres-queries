
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
                          '59259','13946','78647','83168','50649','91350',
                          '68456','67125','41705','99219','45492',
                          '97684','47644','19794','42279','61932',
                          '11966','15698','84588','57457','43608',
                          '67467','64614','42007','79659','82439',
                          '44767','56951','10878','35678','92081',
                          '92917','35815','97091','85948','63001',
                          '48629','84734','61143','23898','56461',
                          '62919','72248','23588','63003','39987',
                          '86182','49987','84677','34409','51118',
                          '48855','51392','25169','73140','10662',
                          '64304','91313','56531','77835','24287',
                          '74414','96971','11039','23653','73230',
                          '57774','27150','79199','82891','19158',
                          '42453','73824','38741','57197','45245',
                          '96053','37881','38864','76779','10951',
                          '78253','99911','39505','75406','75848',
                          '12099','36349','74932','57028','31086',
                          '65572','86993','71227','14338','44676',
                          '27249','95624','85720','97293','16907',
                          '58467','49839','45919','72164','43537',
                          '34574','58857','47973','34712','88149',
                          '17172','95911','84276','46132','35651',
                          '28645','82307','20447','29189','54678',
                          '67995','31127','31250','75170','55218',
                          '59721','43330','60316','89220','88434',
                          '39055','31205','91850','21495','34386',
                          '27509','85824','86812','48615','52195',
                          '76422','45113','52189','97964','74049',
                          '92117','40077','22901','99546','62721',
                          '94564','43447','10907','12955','88989',
                          '40522','22877','50270','11989','71194',
                          '80565','77258','14864','89075','45312',
                          '70524','35944','78540','26170','84359',
                          '23348','42783','83491','64932','94841',
                          '57460','41343','13872','65896','49605',
                          '19120','94552','71934','39185','54294',
                          '43823','71101','72835','14531','90561',
                          '86932','46567','43753','70528','58929',
                          '46569','75260','29283','80619','27688',
                          '66363','54363','97229','67291','56915',
                          '84815','29088','48658','93334','49139',
                          '31592','47686','97182','57362','45832',
                          '50521','34072','24667','22109','52432',
                          '50303','33618','78791','24183','81115',
                          '60786','75473','44197','84365','39166',
                          '81032','18036','49437','88383','72488',
                          '59017','70315','72682','17001','30645',
                          '67028','51114','84499','68621','41106',
                          '83644','62216','17913','44815','57055',
                          '32185','93035','48132','25520','23997',
                          '95345','99370','85837','66351','81615',
                          '18697','94970','36032','93459','59144',
                          '67637','75543','55282','23054','88343',
                          '27476','78386','59057','32039','73741',
                          '59381','48523','48352','92355','53884',
                          '30261','75745','87942','28970','32391',
                          '81278','26146','72768','55340','89624',
                          '52479','14730','14932','93708','63241',
                          '15884','24298','73722','83747','50476',
                          '86575','56498','10641','92260','33015',
                          '17670','10704','28346','15632','53577',
                          '53553','25156','51597','37061','52486',
                          '98949','26422','22914','17480','81923',
                          '63383','69729','24472','61512','91167',
                          '82429','29792','95045','23561','88721',
                          '55079','56315','73862','97554','86863',
                          '31594','53411','84738','25789','67478',
                          '13285','90614','68745','45901','32737',
                          '21773','60191','96227','85229','41196',
                          '30927','14979','40383','58927','98499',
                          '30945','73361','91527','58679','48233',
                          '85482','40457','30044','92028','97351',
                          '82323','87867','36358','11496','41283',
                          '46386','45546','60383','91962','29134',
                          '68667','41562','84667','69532','52603',
                          '27542','73035','97645','34384','87918',
                          '68452','70619','84649','26594','61063',
                          '66063','29135','15242','83378','56313',
                          '26191','71325','69639','11628')
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


