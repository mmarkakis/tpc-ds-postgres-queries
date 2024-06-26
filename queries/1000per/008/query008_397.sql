
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
                          '59884','52242','40453','84721','23467','70271',
                          '52287','91379','48139','22016','33373',
                          '84035','32983','48866','26666','50055',
                          '83141','76006','39771','58297','80171',
                          '48616','16874','46563','35935','51623',
                          '35184','40770','30433','57735','86960',
                          '54121','92477','92978','11363','52357',
                          '58051','64304','30949','54451','57339',
                          '35848','93407','77413','10775','60581',
                          '87523','16931','35319','68760','16882',
                          '12563','54246','53016','54238','75570',
                          '74391','11552','14404','73565','69966',
                          '79557','29103','68164','12540','26761',
                          '82124','94534','94643','10358','21679',
                          '41723','82978','73323','66219','26523',
                          '17205','55813','34199','28233','41159',
                          '89472','78874','79565','90433','90132',
                          '59171','21713','49727','63210','77242',
                          '52363','78667','57695','69002','57290',
                          '57172','86629','49599','71543','91791',
                          '69465','95626','23360','25797','53356',
                          '59678','57854','66427','10921','33323',
                          '89949','82146','22104','22034','67843',
                          '28763','19467','21565','93293','55765',
                          '73526','72021','16118','61811','29751',
                          '16768','39595','11447','23713','55275',
                          '73140','86216','53807','48228','97843',
                          '75703','41448','58636','19079','61644',
                          '56702','49401','50887','73499','47963',
                          '90001','72408','46758','60051','81378',
                          '63244','83225','20607','35925','81139',
                          '60105','90831','13047','50898','93757',
                          '44295','38296','39569','17755','66411',
                          '55050','83863','30853','16899','58963',
                          '13895','14790','92820','69267','66053',
                          '32896','59279','61623','73145','37045',
                          '73413','72711','36077','79175','83616',
                          '90974','43096','22316','74951','47534',
                          '24254','10718','48829','82511','48946',
                          '51745','98462','94810','54857','35574',
                          '69204','78262','70004','94403','67149',
                          '44541','81561','83744','27299','14557',
                          '81371','81469','46884','97912','19002',
                          '77702','98138','80617','93746','41721',
                          '46044','16057','14562','47157','84094',
                          '81798','57324','29095','65055','90990',
                          '55631','56312','40190','34184','98154',
                          '45665','95934','31101','71479','90311',
                          '39176','24368','25547','44015','78938',
                          '62201','18458','30507','99073','47539',
                          '48277','12252','24032','73979','83683',
                          '51511','59876','23989','47016','35672',
                          '66161','22009','63635','65654','17783',
                          '66662','82539','54926','41115','91020',
                          '20280','88129','75187','94307','54022',
                          '12685','20437','37874','83194','36795',
                          '25436','14731','73845','49580','87190',
                          '28372','94541','51054','86142','48747',
                          '69692','10203','29026','69007','23205',
                          '18936','50645','30731','45198','56247',
                          '52768','53649','25504','12066','30105',
                          '70405','72014','11096','45139','32024',
                          '72491','94511','57587','12875','82995',
                          '21859','18732','32696','51169','87043',
                          '45758','33235','48169','83709','87942',
                          '72697','42917','17843','76600','90494',
                          '46787','84656','76941','64856','42237',
                          '73159','59661','49654','13727','82490',
                          '35147','89740','49841','29394','55215',
                          '30111','54653','69154','50953','50613',
                          '72111','23748','14556','20232','87831',
                          '95065','59085','54161','22632','90189',
                          '40936','60251','47165','83130','27605',
                          '23541','99245','62462','43443','27307',
                          '54281','17566','86023','24992','13508',
                          '23676','21227','85662','74625','19955',
                          '55869','80873','59755','84335','81241',
                          '73082','30917','11349','51298','55759',
                          '62367','90889','12633','64024','49341',
                          '15110','79680','97505','29218')
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


