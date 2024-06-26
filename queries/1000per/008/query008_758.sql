
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
                          '56737','52354','50804','91019','32878','99613',
                          '94088','31297','43935','58140','48233',
                          '38459','92364','57025','28649','48487',
                          '57415','94893','37843','84265','25825',
                          '42681','23125','15528','12485','49480',
                          '98038','66108','84977','96945','21845',
                          '24847','10491','76593','89995','37981',
                          '11449','92563','47336','86304','50249',
                          '96986','19557','69834','71057','61375',
                          '79760','54666','58783','87753','58671',
                          '94575','59277','39143','65128','27745',
                          '27120','34051','86419','32245','65861',
                          '52232','49255','18757','66281','78589',
                          '40428','44535','61378','29497','91016',
                          '91779','10078','10673','33777','77128',
                          '48417','60798','56089','65470','99558',
                          '14624','30397','43437','64822','45366',
                          '42184','60338','52051','60506','90203',
                          '89869','84948','37075','35665','42969',
                          '82595','70017','91812','66056','50829',
                          '31004','62516','97972','88522','22418',
                          '58985','94673','80543','85109','35965',
                          '80787','85746','99234','50561','82550',
                          '31398','44738','87767','25808','80219',
                          '21106','40215','52686','22385','12250',
                          '73469','62269','29314','35551','27447',
                          '24486','56671','36281','93448','61787',
                          '81887','17993','29318','70383','22688',
                          '99822','26590','75198','78927','46827',
                          '73424','68866','56251','70561','38207',
                          '11193','48262','58280','51211','76711',
                          '23062','24994','85485','68234','37391',
                          '24618','22687','49277','24518','44393',
                          '30697','42451','66709','68091','96857',
                          '55688','60585','10631','95900','81063',
                          '11161','41581','41136','46782','56351',
                          '42192','64577','12118','74328','88316',
                          '63954','73235','97482','63018','40203',
                          '50507','78216','57290','73307','73534',
                          '65710','88150','58379','88952','71240',
                          '73448','31655','71895','10836','90703',
                          '87808','19897','85267','50095','61727',
                          '78159','76457','53155','77967','25897',
                          '49597','97700','62939','31713','67787',
                          '49832','69694','73309','93443','73241',
                          '88137','68323','40201','29324','55564',
                          '38185','99777','94222','35368','62144',
                          '41235','67392','10874','25778','13619',
                          '95422','86590','19270','83321','36547',
                          '15050','69783','16068','16443','75278',
                          '12958','18331','21308','34442','48955',
                          '40550','24643','78732','78694','72186',
                          '30898','64650','11739','37867','50475',
                          '43328','34326','79886','58311','65701',
                          '36935','55158','61706','76458','99165',
                          '45681','91861','69056','70936','13136',
                          '17994','87018','41779','96878','72480',
                          '36365','71913','85433','13547','34470',
                          '19399','37614','14387','81489','59468',
                          '99397','22765','83076','21866','85328',
                          '88007','53175','86602','72226','83127',
                          '27604','96426','16882','67500','36557',
                          '85493','68032','19206','96865','69599',
                          '29526','64583','68084','70819','60259',
                          '63639','12005','51554','51606','80785',
                          '95410','10391','21604','81962','15665',
                          '35868','24295','18429','80105','41482',
                          '86439','32910','65924','15117','86760',
                          '83717','95301','92879','43033','96486',
                          '78482','11518','99125','76646','77147',
                          '63664','47478','54633','97002','67082',
                          '84525','35521','10509','23896','19432',
                          '25079','58686','12573','90085','36376',
                          '22491','85353','36247','26326','70944',
                          '55319','81844','23739','61724','76588',
                          '86179','63075','30212','96768','98804',
                          '21349','52625','27026','75887','69758',
                          '74899','62167','56938','34489','79264',
                          '96135','88652','26810','20225','58742',
                          '32972','65974','77314','84362')
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


