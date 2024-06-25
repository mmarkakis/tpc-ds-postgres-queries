
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
                          '94645','85446','50847','21073','26502','25630',
                          '28534','72593','70919','37427','95467',
                          '32050','26217','52465','99102','95700',
                          '99272','17012','38861','12867','94918',
                          '12001','81031','95429','82311','54001',
                          '70601','95895','30620','95848','97769',
                          '30580','11853','93716','48593','15174',
                          '73927','85256','51078','88021','22932',
                          '49802','96354','77507','61327','87585',
                          '43435','60506','62039','33575','83631',
                          '83607','47925','50278','53894','98837',
                          '91429','69318','64102','71467','52732',
                          '87069','17906','78258','70927','36175',
                          '32944','39393','34533','63301','73334',
                          '44209','26319','41887','55052','19571',
                          '80029','82139','47034','47417','11150',
                          '34145','83380','77431','83069','39136',
                          '96141','71044','76761','32733','83486',
                          '37586','69616','71946','94638','39026',
                          '28851','41031','82474','67327','93766',
                          '32642','84675','11123','41029','23991',
                          '19071','74607','65985','25289','63690',
                          '99417','94782','24157','22615','90526',
                          '57392','35860','66005','62536','16367',
                          '42768','52003','14935','16004','96814',
                          '93684','69715','45510','45246','96174',
                          '55813','47205','80949','75218','11030',
                          '25390','45966','19411','86006','36854',
                          '59787','46701','12777','93459','20642',
                          '43971','27075','82671','53048','75602',
                          '64900','53241','33919','78787','87886',
                          '86506','15815','45895','78863','84629',
                          '30718','49138','51226','47407','28276',
                          '38678','91774','96961','18248','78335',
                          '10407','13024','15116','30138','78598',
                          '97783','29836','83136','54146','36351',
                          '29229','52856','46573','58184','81890',
                          '25198','98192','17248','69772','91310',
                          '29628','44097','44044','49559','48937',
                          '29703','96151','74808','97882','66058',
                          '83928','32656','25265','72279','19895',
                          '18242','57152','35393','62682','43483',
                          '99524','49764','26492','89511','79648',
                          '86839','75699','49100','96995','30993',
                          '60064','53630','45658','24387','34182',
                          '34936','82514','17907','98882','83231',
                          '31802','18951','15808','78885','83481',
                          '44067','47310','86089','63830','68236',
                          '66251','73948','66838','40220','65090',
                          '64298','34711','52530','69283','10240',
                          '73576','15332','73045','91101','70807',
                          '76544','27156','45915','54781','47606',
                          '81993','77006','84357','67099','42031',
                          '25930','43016','98229','19577','66065',
                          '49365','22143','79636','10796','28462',
                          '61700','27197','30542','11810','48935',
                          '24675','18401','49316','59588','45271',
                          '22231','56216','87917','30672','75157',
                          '84987','96398','13721','67402','17364',
                          '82320','89939','73662','88949','83724',
                          '56602','63945','28377','50685','93792',
                          '36785','85358','42841','85900','10889',
                          '85034','54597','51659','35661','96746',
                          '12703','17597','11806','55895','36706',
                          '23389','76741','16521','60459','33455',
                          '30122','16340','78679','82580','78737',
                          '40443','32880','95580','95574','62283',
                          '99766','80032','14524','90067','23175',
                          '37968','53444','49805','87903','39995',
                          '81481','98323','81952','45585','53231',
                          '81105','12348','98702','74756','23496',
                          '95660','71260','88368','23044','94595',
                          '10473','26202','20082','30313','83711',
                          '27203','83166','52726','64283','32329',
                          '68381','50203','73393','47625','48007',
                          '43354','82101','47967','25823','59757',
                          '30707','70286','92667','61757','27986',
                          '76115','76186','29417','66013','25184',
                          '69267','63956','23577','78858','93808',
                          '45595','13356','81362','37409')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

