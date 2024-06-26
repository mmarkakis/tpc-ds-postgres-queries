
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
                          '39952','22228','85093','70654','84576','42720',
                          '83610','80328','91862','88426','54294',
                          '67511','34684','92481','47602','85149',
                          '87889','12365','16769','81219','73597',
                          '89030','14308','64141','84763','16942',
                          '20326','18246','15147','78968','74282',
                          '56159','26275','42783','20164','55847',
                          '81748','53705','91918','76026','38423',
                          '30932','87758','22604','72232','83724',
                          '79761','18932','48712','52055','38317',
                          '41072','18024','34537','80797','38337',
                          '84930','59350','82531','86297','26462',
                          '91165','48744','41672','50819','71139',
                          '27410','51139','87256','92435','29915',
                          '87258','84025','36415','76241','47527',
                          '47705','39881','56989','83082','75838',
                          '28049','60901','39466','89527','45416',
                          '90178','62428','18362','39940','89375',
                          '89481','71249','83551','89382','58056',
                          '38754','57862','81717','29509','70979',
                          '88919','67060','76803','85748','76588',
                          '39382','98662','75239','23784','56722',
                          '85967','47217','42792','30863','47308',
                          '42170','65362','37545','50909','81829',
                          '45735','13801','65872','71285','25797',
                          '32528','13237','37208','99268','50803',
                          '43117','85084','69974','38960','56806',
                          '60787','12560','53394','26939','19751',
                          '43687','80826','68073','70171','92296',
                          '20265','88916','30104','79117','34541',
                          '44166','81563','19006','10021','17138',
                          '37176','65937','75053','19905','54948',
                          '36780','75010','66834','38380','17110',
                          '73809','42308','90128','42324','79260',
                          '35559','39685','51536','74521','50107',
                          '61860','41486','64646','12119','14000',
                          '71167','32525','90666','59607','16185',
                          '44593','44489','29497','75177','48726',
                          '17197','39620','58694','37063','89783',
                          '83192','10411','93233','52044','42174',
                          '79814','98712','34452','87315','53366',
                          '71408','51348','55446','23541','12885',
                          '20743','14911','97667','94150','96100',
                          '27332','64837','36860','27290','31525',
                          '65072','41194','11176','97739','39782',
                          '64428','91032','18473','73086','37776',
                          '91593','43109','88556','20317','89013',
                          '82582','37076','78440','11326','38828',
                          '29533','69775','49976','72199','13853',
                          '18579','54538','76537','78442','98168',
                          '64967','90932','21395','90188','94795',
                          '39102','31428','92782','31291','78322',
                          '67173','62080','46638','98025','39351',
                          '40268','78961','76320','89955','29464',
                          '17997','69552','28289','14027','57708',
                          '89728','49728','37002','24251','57668',
                          '94195','88358','88864','51514','37818',
                          '73577','45195','87367','95629','97156',
                          '58344','65484','89502','76385','72641',
                          '71505','13744','17445','57166','18064',
                          '88705','26687','45561','81622','84245',
                          '20145','51053','84663','70207','65022',
                          '89037','21048','61030','29506','16349',
                          '37462','56138','26226','65018','47529',
                          '14597','11433','26880','34041','73525',
                          '50104','57706','77742','11757','46917',
                          '91795','59829','23889','51198','98006',
                          '65741','30230','61592','50466','71401',
                          '78798','57055','67408','46846','26212',
                          '93069','51122','99592','35730','57080',
                          '89019','47027','75024','99662','56377',
                          '71368','80781','93149','88395','86082',
                          '50645','98787','29283','30282','75481',
                          '36144','30390','32049','76527','61839',
                          '35408','19621','16703','40872','88958',
                          '40631','62181','51336','50890','48264',
                          '76891','62189','77329','74369','45669',
                          '71847','56666','59287','66084','29084',
                          '92267','75437','87342','48393','39697',
                          '34633','79140','77069','61925')
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


