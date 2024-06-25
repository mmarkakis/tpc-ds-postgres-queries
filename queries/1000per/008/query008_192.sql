
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
                          '81136','88324','95565','81744','73920','96858',
                          '94667','52015','68359','82932','92538',
                          '30600','94271','48949','68433','30503',
                          '47934','16572','32262','33597','68621',
                          '52330','41374','83060','49419','80401',
                          '78693','38044','70818','78884','93049',
                          '97078','97433','15833','22817','19119',
                          '82235','18671','29279','35268','79210',
                          '88107','93550','51902','72437','21813',
                          '76139','31926','52959','84242','46836',
                          '36054','31974','65869','20911','89549',
                          '46803','42973','92423','83563','67367',
                          '42307','89936','52523','62302','62507',
                          '92253','52874','36233','19040','19549',
                          '62693','52449','97345','92116','15926',
                          '72662','66450','88731','30787','30227',
                          '17056','91318','76596','42066','26963',
                          '57105','95829','19216','76768','59621',
                          '27765','64221','32966','75328','52640',
                          '40903','14609','35936','20349','43145',
                          '52626','56470','21792','66003','63628',
                          '90163','59569','93612','67120','64441',
                          '84793','87385','57882','86922','18593',
                          '30524','60862','52999','69841','20025',
                          '73009','78557','86334','61301','53038',
                          '75292','26009','79850','61803','31102',
                          '29169','13410','48695','25671','18413',
                          '64942','47575','76769','49450','86126',
                          '50838','92921','68057','30701','58802',
                          '20212','87044','10158','54733','80995',
                          '82917','61458','42232','64862','44279',
                          '98378','54198','79793','21658','94993',
                          '72845','97873','18409','97142','75779',
                          '69898','90217','82898','79503','62729',
                          '84468','92419','91486','70059','36612',
                          '62284','81509','21418','14312','86289',
                          '74149','37885','96057','79967','16597',
                          '52886','44499','50883','92712','11246',
                          '19095','93173','11112','51582','17417',
                          '25966','44294','47144','27206','50927',
                          '41399','54653','50990','31637','94170',
                          '84789','14750','14342','47586','60437',
                          '80262','93560','19671','38751','94128',
                          '41154','50346','61243','86121','36488',
                          '32609','97814','27232','46038','29071',
                          '21656','30318','80688','32943','21901',
                          '64247','81404','57387','26599','88951',
                          '49046','79505','56292','51109','89219',
                          '96884','24837','94405','76945','88696',
                          '86782','95317','75072','31136','77828',
                          '63024','43294','21459','40953','45933',
                          '27921','75641','54573','92269','53611',
                          '23295','17279','80658','72546','75954',
                          '17660','58905','52030','31499','55552',
                          '89291','48111','57090','73544','75528',
                          '84310','59225','75620','59697','21793',
                          '73181','99343','15766','44292','71351',
                          '16691','66770','79816','79381','19423',
                          '48712','61234','37814','45645','43310',
                          '66475','41407','50599','95935','75545',
                          '71094','22222','62245','47317','18134',
                          '89204','40519','32967','43396','38297',
                          '27749','65620','20391','20204','27030',
                          '17650','48282','75105','89904','57054',
                          '21962','48950','73152','87759','54015',
                          '53345','36074','91354','10131','24247',
                          '47811','99302','41687','50541','92878',
                          '71091','43331','48355','50974','19211',
                          '35657','70131','23310','55093','61460',
                          '19853','19284','27388','32031','13440',
                          '21791','85559','79811','28892','39498',
                          '77933','34110','44226','37910','60098',
                          '22570','19409','38075','20147','30073',
                          '12582','49716','86040','39451','60901',
                          '46442','99561','57017','76956','43750',
                          '17624','55202','17933','68376','94261',
                          '59041','24053','19655','48141','19296',
                          '57480','76703','83311','92038','28695',
                          '33195','44230','71725','80411','14735',
                          '42225','16218','42448','16483')
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


