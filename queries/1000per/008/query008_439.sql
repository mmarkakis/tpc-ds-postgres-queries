
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
                          '95630','63897','42929','54910','67342','10427',
                          '72424','62818','93895','39153','30765',
                          '59123','66806','20758','25982','42475',
                          '92673','71973','55251','59315','11483',
                          '62158','36056','89564','38233','31244',
                          '75074','81660','50383','31623','10603',
                          '11032','41428','95455','84279','44303',
                          '27446','50098','96356','43659','93562',
                          '59968','86659','68146','53852','83505',
                          '95460','76525','40444','76128','29653',
                          '98397','53379','19361','81256','58499',
                          '94684','81139','83198','21340','37328',
                          '24372','35997','53482','64500','13966',
                          '24475','99927','14398','78221','25451',
                          '29424','10204','79974','97666','83404',
                          '95398','51716','17660','61293','59168',
                          '81631','55813','64289','10983','18661',
                          '48707','73808','20492','50674','52983',
                          '68204','60568','26815','52948','29567',
                          '97607','30408','25864','41647','30910',
                          '53756','90922','48467','56790','38911',
                          '35274','14610','73148','94592','56282',
                          '16117','94660','27556','99324','14008',
                          '40565','66504','89923','31929','35173',
                          '80874','34565','29432','10772','69211',
                          '16354','91079','95453','87262','66667',
                          '53476','79034','15927','41055','45672',
                          '43190','69440','36914','35915','55501',
                          '49704','92355','59105','72002','66257',
                          '38885','62136','65137','82967','36844',
                          '56622','52929','99451','72515','84131',
                          '56025','51781','16389','52368','83418',
                          '27850','70181','32447','71864','26561',
                          '58182','65023','33774','83455','53035',
                          '89336','82283','66397','98400','64634',
                          '36432','60837','34126','69351','81316',
                          '82017','87504','15350','59344','92058',
                          '60836','72303','63436','42814','28999',
                          '39826','11478','76446','38566','30278',
                          '55923','58795','66719','57517','68631',
                          '71064','13511','62970','11179','94715',
                          '55429','46658','38373','76119','21723',
                          '78296','21495','61768','49524','88352',
                          '44752','44922','26279','46272','13958',
                          '30940','40538','14181','12774','59361',
                          '71771','53185','34077','97801','55491',
                          '23919','45770','70507','71651','59148',
                          '81066','57083','93567','61380','41577',
                          '92241','95114','88254','21353','54913',
                          '60878','11468','23721','38184','79877',
                          '36912','25125','87168','95301','25731',
                          '10984','96130','71376','84324','89609',
                          '79485','40080','80617','89020','59517',
                          '81527','65373','31498','56146','55973',
                          '76078','42409','32001','39182','55394',
                          '47414','37187','97998','59810','30784',
                          '41666','37464','31295','88381','37623',
                          '24155','16945','59442','69530','92004',
                          '60560','49564','53510','57474','85970',
                          '80321','96834','62765','87054','38078',
                          '11558','24376','94270','81492','80421',
                          '94934','72821','46672','20738','73034',
                          '78545','46258','98252','71863','83860',
                          '35607','47891','37562','36581','64757',
                          '65890','81735','51065','47695','40484',
                          '59860','94181','37066','80223','12245',
                          '37710','44254','27656','57739','14579',
                          '65955','23989','53908','20165','24862',
                          '99031','42274','11933','41078','96715',
                          '93253','77622','18957','72036','16701',
                          '70200','83364','78398','85593','17639',
                          '42660','78804','78182','38875','49552',
                          '34143','88947','41810','88555','69876',
                          '89370','23461','50070','95001','32167',
                          '86184','56531','92230','20849','26027',
                          '19046','19619','16691','81121','83281',
                          '20772','51942','71645','97593','34241',
                          '90086','39476','37546','14423','75098',
                          '21378','15573','96183','74931','95362',
                          '68291','97931','84119','98943')
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


