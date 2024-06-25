
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
                          '57555','65112','65379','57504','20831','36418',
                          '56935','50039','13499','24565','79551',
                          '12293','75732','91131','36966','17548',
                          '71515','27126','35129','90916','37745',
                          '85412','95322','47497','51937','61981',
                          '26429','83416','91169','93335','24954',
                          '88575','23679','58539','69146','53076',
                          '95506','25713','60758','61396','74922',
                          '42628','72785','73356','53500','99912',
                          '26586','64679','77222','97769','27175',
                          '21760','13410','34721','10726','43951',
                          '38682','99074','94326','76557','57059',
                          '41310','57026','74160','87947','25668',
                          '93309','61414','85383','93362','16001',
                          '21528','46972','20078','15150','38480',
                          '27853','83724','94912','44593','53320',
                          '12751','26604','44695','90486','82384',
                          '82037','66355','33424','41987','96378',
                          '41145','26023','36370','40068','64419',
                          '12115','88904','73745','65156','71593',
                          '18092','80620','67908','33186','46597',
                          '80246','46536','17423','80234','94684',
                          '53585','63291','46273','49892','95427',
                          '97460','45603','54974','36988','48955',
                          '50507','97915','90659','46414','70396',
                          '13885','54493','71604','23972','11649',
                          '11852','42873','31229','44581','46151',
                          '30792','94559','50377','14590','35001',
                          '96894','78535','14121','42005','67723',
                          '95635','35509','23335','14079','32922',
                          '77538','79264','75109','40998','28893',
                          '74320','93878','32277','57674','29797',
                          '51154','97949','95447','78017','75813',
                          '46521','87295','27644','61189','85619',
                          '39072','54857','24863','94229','79536',
                          '62506','34978','11048','54242','42658',
                          '14721','36161','60253','84045','88014',
                          '49864','92541','31080','14736','72069',
                          '40780','81403','64395','90889','77605',
                          '71413','88604','98124','22752','51989',
                          '94992','85248','12541','87129','36071',
                          '91389','45671','58938','43717','17387',
                          '68232','19349','81870','41812','36021',
                          '25276','50098','49006','12383','16294',
                          '85164','32167','96305','75001','26399',
                          '76669','56658','52588','58334','75967',
                          '39740','69217','23688','54076','54971',
                          '23051','29405','22550','81863','73886',
                          '49145','58739','84125','71352','21285',
                          '55035','92512','92925','38397','90954',
                          '40385','13742','94970','26742','12561',
                          '93480','32261','14299','69567','76038',
                          '95697','99775','95683','38406','48523',
                          '82267','26607','17557','74283','84489',
                          '87154','66333','55302','96478','90756',
                          '48660','38847','99072','51543','48175',
                          '50955','41150','99973','77041','66053',
                          '65514','49942','65326','72082','77769',
                          '45220','26781','96163','18293','65280',
                          '65758','10778','32298','79613','91151',
                          '22957','31047','62053','75362','93516',
                          '34729','80963','85061','85455','80018',
                          '90448','83619','94116','70940','62961',
                          '96797','92914','24368','81139','65392',
                          '44333','77132','46260','70777','41178',
                          '60578','65337','91949','91781','47126',
                          '93812','95629','17641','23578','50891',
                          '27489','18005','92815','96992','62485',
                          '89276','74671','24757','45486','73710',
                          '26246','82339','79930','35471','67701',
                          '81158','27421','95787','65865','32087',
                          '71666','39551','76786','92060','15010',
                          '35251','28048','35981','45154','24404',
                          '55627','20291','85764','44545','93916',
                          '35187','14925','27640','16004','79692',
                          '23048','26785','76897','46826','30537',
                          '76948','20648','76440','56250','32980',
                          '93123','11865','55592','46577','60492',
                          '61227','73776','50066','65986','76627',
                          '16747','18677','44495','63941')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

