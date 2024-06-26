
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
                          '70094','40260','42857','48582','22608','71686',
                          '28341','36031','64826','96540','33001',
                          '45986','24772','79012','81628','43099',
                          '28460','10839','62312','71054','21972',
                          '14039','36114','92095','62120','59998',
                          '49601','56673','20619','89201','23749',
                          '55405','93368','29253','87672','31117',
                          '64935','42813','35396','42686','98121',
                          '10073','10979','30236','62874','16425',
                          '14942','56778','30873','95750','22594',
                          '39679','62731','53980','11017','48117',
                          '65639','43126','45937','88447','14726',
                          '13017','65631','22823','43363','71815',
                          '52573','48006','77902','80507','54248',
                          '26166','79449','69897','31021','74104',
                          '99904','80947','64887','70090','98604',
                          '91243','50602','69444','60699','25874',
                          '24535','23431','93718','47115','75901',
                          '50211','48614','28569','75135','71981',
                          '50120','71363','58137','51802','73315',
                          '45354','75322','65832','44246','80717',
                          '80346','79329','26135','95199','73610',
                          '34547','83466','35779','96848','47924',
                          '46577','50107','62835','48319','11826',
                          '26565','22609','88419','94048','39747',
                          '66664','12630','15029','82039','56940',
                          '70988','22306','75402','42919','34490',
                          '91457','83131','15249','45194','82168',
                          '94298','82499','52554','92966','31394',
                          '12222','28747','25072','64162','46079',
                          '84010','82661','47057','70359','86868',
                          '46625','68357','11098','12229','32598',
                          '26307','63825','43370','23294','81882',
                          '85228','73764','90651','70182','84674',
                          '23826','98870','31173','42987','90225',
                          '13791','57407','17862','94510','60939',
                          '22798','73907','30078','12899','20502',
                          '90608','79872','49116','10083','58098',
                          '65464','52263','96391','40368','33299',
                          '53234','84112','13889','95832','46579',
                          '92832','34927','12879','50203','27288',
                          '79021','26134','31604','33651','54560',
                          '53476','20028','88728','45719','40882',
                          '32894','55609','26141','29826','99693',
                          '87200','25221','97132','38951','37451',
                          '36762','38767','25448','67234','49472',
                          '28549','72304','38747','74436','62253',
                          '68124','39991','51932','42074','58289',
                          '77331','60786','13015','20922','35906',
                          '49883','51460','89944','86127','24100',
                          '51323','21575','49367','25205','45678',
                          '24139','73012','74542','70322','70655',
                          '65231','60212','57087','63989','87393',
                          '33529','39921','51407','34650','69525',
                          '37201','46925','49762','41353','57687',
                          '90125','30905','90323','39236','30388',
                          '43891','11179','57136','14105','30195',
                          '75339','97131','38516','52250','21187',
                          '37731','94665','96817','82167','56487',
                          '81079','29541','91801','50275','39394',
                          '93056','17311','82866','51950','65796',
                          '62518','57376','62032','86072','62820',
                          '53898','33290','37113','16728','36496',
                          '83513','88297','27194','99146','79807',
                          '61648','18897','51661','75288','19798',
                          '92602','68527','55597','15229','99566',
                          '16946','80680','74551','69008','61674',
                          '81379','26788','28591','78225','72290',
                          '38305','30110','99473','99680','26117',
                          '78708','68079','20607','11814','13432',
                          '57480','31752','67568','47526','74103',
                          '75639','86567','55486','34152','59561',
                          '59284','39046','52210','69368','51303',
                          '12467','73851','76382','90466','73081',
                          '55418','48333','61601','63488','72523',
                          '34820','79204','43643','75200','31602',
                          '51385','85027','14786','73496','79649',
                          '37427','84207','94341','12190','66437',
                          '78203','81409','90655','22467','74433',
                          '62307','23284','73838','53059')
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


