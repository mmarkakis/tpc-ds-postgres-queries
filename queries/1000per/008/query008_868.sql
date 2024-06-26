
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
                          '96267','54137','30152','50916','75390','62347',
                          '32147','44942','95022','88049','24094',
                          '61138','76711','94168','46915','82642',
                          '96679','49938','64600','19094','71974',
                          '12303','77277','94090','23647','29459',
                          '23800','14455','18821','16472','83844',
                          '89827','59111','66617','51588','82891',
                          '48366','54563','64753','19954','77165',
                          '74585','72306','28093','66815','75837',
                          '53213','69070','31088','19101','29853',
                          '14745','71480','48861','18025','92068',
                          '31649','43380','44790','54723','93295',
                          '86197','40994','41542','79890','81754',
                          '84653','87440','75761','51235','27214',
                          '96408','57603','21702','95665','42700',
                          '56771','98244','49566','29349','48635',
                          '33051','94075','14139','25761','54221',
                          '23496','95803','87746','45083','96960',
                          '28451','37999','37190','40450','20635',
                          '87028','73086','16679','54997','54253',
                          '98827','13287','11589','63261','82684',
                          '18815','92158','43762','37813','76797',
                          '34606','40106','67095','99391','87035',
                          '90501','56989','32605','89574','46620',
                          '74330','43642','92493','94624','18719',
                          '52265','87624','85385','65048','90773',
                          '18681','13984','29305','93196','33944',
                          '26853','24675','66506','57094','93447',
                          '18272','25695','92845','86127','20997',
                          '20168','78532','81860','49036','51120',
                          '55984','71216','13959','52294','59930',
                          '13551','78553','15031','37076','84290',
                          '76232','57942','80806','94504','34886',
                          '73978','18797','22728','21198','55471',
                          '69733','27502','23698','22511','47482',
                          '21466','86378','50609','24263','90067',
                          '88691','90469','60615','96528','64960',
                          '68578','22814','85950','86467','68051',
                          '50156','70810','33879','64610','48759',
                          '33871','42783','84145','75090','79611',
                          '75579','74839','54131','40685','24701',
                          '55463','63263','97424','30913','82000',
                          '40194','93881','62370','75170','15411',
                          '95175','69717','57060','99630','25191',
                          '56609','21616','71572','16971','59177',
                          '14351','16980','88613','16428','77738',
                          '24779','16165','35807','47354','44093',
                          '89791','80683','49850','72499','23554',
                          '64234','61306','15398','62499','89393',
                          '53006','51401','87252','53134','37372',
                          '75836','45207','91747','87731','61919',
                          '91229','48574','56931','25932','74917',
                          '43093','52366','32309','73725','95619',
                          '91775','99451','69431','94503','56253',
                          '84256','41081','66503','63152','79186',
                          '96931','36829','48106','96336','49580',
                          '42073','12295','41582','19017','97438',
                          '23410','31702','17101','19664','75325',
                          '88017','71174','86790','10214','19291',
                          '59040','42401','78146','38777','54595',
                          '10578','45900','27688','37716','55032',
                          '60918','20861','26623','33286','80841',
                          '66427','25921','52720','34979','92972',
                          '93813','97697','27592','29366','65018',
                          '30563','53379','50834','62750','50320',
                          '73862','66053','28480','23176','82931',
                          '35799','20725','93759','62932','55954',
                          '11259','84703','18289','63921','34015',
                          '96037','34538','24635','65783','41375',
                          '48942','51089','65929','89045','42281',
                          '55429','93063','89141','79287','89140',
                          '35172','18061','44586','71770','19959',
                          '29971','14716','43348','46399','87825',
                          '86049','51254','37064','79097','22388',
                          '53253','79673','44426','25949','30503',
                          '73145','15637','22619','53176','52308',
                          '82246','94419','74488','31658','89280',
                          '64056','51438','58444','91432','70449',
                          '48722','33062','31317','18344','55960',
                          '74265','47442','71315','37299')
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
  and d_qoy = 1 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


