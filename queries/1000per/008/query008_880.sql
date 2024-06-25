
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
                          '93345','14787','23868','74059','79606','40969',
                          '22144','17588','24628','10700','55819',
                          '73450','59990','21905','22173','40709',
                          '66471','63933','73474','65838','47501',
                          '32594','87129','52041','11944','95476',
                          '95645','23712','36622','82076','17098',
                          '87436','39856','35621','97427','55342',
                          '30218','21798','92045','61736','53808',
                          '46840','68635','44128','51831','18357',
                          '97096','78416','16961','30240','89096',
                          '94398','27627','64463','62478','59492',
                          '46464','68547','97883','30752','20750',
                          '97912','72068','98707','91351','95482',
                          '18623','10894','54347','18432','59633',
                          '72921','89817','12348','39603','65607',
                          '56289','30629','86491','84224','92148',
                          '12037','83852','38857','25002','55171',
                          '34921','83002','36543','63808','82501',
                          '69841','20949','28400','77884','17666',
                          '61302','78302','62401','54503','46519',
                          '88901','73099','62077','92706','59051',
                          '85112','74070','90342','75424','85281',
                          '40062','51487','22592','62079','22382',
                          '56770','88817','76479','49109','62006',
                          '53236','91506','77523','93239','55473',
                          '46860','21817','10585','82789','99485',
                          '63655','24272','93561','83978','69856',
                          '74352','91009','11676','31564','22679',
                          '42836','26244','14264','52130','28415',
                          '51546','85838','57717','64021','99864',
                          '43477','27833','73176','97510','83368',
                          '49755','12172','48980','50559','76664',
                          '53163','45348','93215','88146','99250',
                          '47745','26196','47232','60273','94038',
                          '72319','90283','43581','97652','13679',
                          '59287','19465','23874','56528','27788',
                          '48287','17787','87674','35113','22081',
                          '12292','26727','61487','46131','10124',
                          '36727','88631','86385','60517','98418',
                          '69214','66700','34620','77513','97142',
                          '34101','31732','98117','66693','33386',
                          '69090','11372','88620','71326','48680',
                          '39513','35750','51156','51614','64528',
                          '56484','63597','70153','51396','14278',
                          '55181','12785','63780','10389','70083',
                          '88896','94217','90736','40175','76316',
                          '49845','54243','94057','71351','93611',
                          '68006','56769','68418','52815','17860',
                          '18537','58577','28269','24505','22706',
                          '61328','52576','81694','38331','49966',
                          '44366','23536','41378','34633','75542',
                          '20990','86167','49254','42255','72746',
                          '33272','91219','92724','80305','87684',
                          '58823','10652','86146','68197','32907',
                          '66468','70456','95791','88972','53451',
                          '75090','42610','75188','74764','46095',
                          '62356','24736','11887','93798','69819',
                          '82327','95054','49519','40813','70137',
                          '72688','49099','42984','56721','47756',
                          '33594','78406','92974','76600','39978',
                          '38965','50668','38260','47672','58644',
                          '77535','51954','46006','66634','79791',
                          '87464','60862','64749','96457','76165',
                          '32970','32758','58355','61769','78355',
                          '72135','49412','48712','70968','31876',
                          '14512','79902','89942','88277','50687',
                          '77942','37013','41489','93408','30080',
                          '38809','97454','17517','53660','13651',
                          '77534','41220','32601','86850','94891',
                          '62897','31206','83503','66271','16360',
                          '89035','67968','61246','15873','93639',
                          '49879','64710','31342','46472','12984',
                          '14476','10420','34909','66251','24342',
                          '34337','87376','60312','19360','32233',
                          '53962','56109','76280','24394','72793',
                          '45886','95472','11912','66344','77585',
                          '89415','69711','84948','35948','65946',
                          '92144','20485','76697','23670','16778',
                          '98059','89167','85357','63766','38982',
                          '17026','12779','56087','87473')
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


