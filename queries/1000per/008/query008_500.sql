
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
                          '81324','39136','45619','77958','19861','56173',
                          '56165','81629','12200','26552','55576',
                          '64007','49176','81054','38762','62642',
                          '79958','61703','99896','98231','49097',
                          '98450','80259','55379','42471','25387',
                          '83084','33613','42976','39478','28518',
                          '37032','51794','72017','28895','10284',
                          '35207','26281','93483','98387','14105',
                          '29813','88738','49547','29595','13101',
                          '13669','29294','52083','13825','68120',
                          '13649','20549','12975','29203','64809',
                          '70958','31037','87466','96634','99352',
                          '44821','75289','91603','96753','36066',
                          '88439','73836','31059','26459','56973',
                          '27973','28630','75028','25750','87532',
                          '91328','61266','42835','15731','82612',
                          '59595','72087','48208','70464','62669',
                          '27117','87788','59862','12812','60055',
                          '80056','98587','77564','82295','10080',
                          '11721','61273','68872','87321','38591',
                          '21204','62403','94274','79821','10697',
                          '44614','10510','17250','29218','67503',
                          '77954','74512','67077','11533','68357',
                          '58736','63688','81664','70377','54347',
                          '46844','60193','65682','68208','85306',
                          '48216','13173','16348','84830','60064',
                          '67632','57201','20062','73619','69953',
                          '12059','39645','30134','77476','25159',
                          '72452','75983','40553','48735','84423',
                          '63327','91346','85846','36628','64884',
                          '79211','44371','35818','63135','29769',
                          '72420','18581','53989','79616','16279',
                          '90963','41474','40332','59768','33251',
                          '28066','21054','97096','47527','25240',
                          '21797','83061','95812','98778','18883',
                          '22153','72248','66022','62812','96743',
                          '95704','43901','90791','81535','85655',
                          '44811','38024','62364','89616','84810',
                          '79536','57223','17200','55574','88749',
                          '78641','20148','34414','95858','71909',
                          '84754','90484','15736','14180','39268',
                          '22413','33286','15051','45098','49601',
                          '10560','32985','43218','71666','30292',
                          '91162','87158','80124','88028','11800',
                          '19511','61949','44165','18020','63152',
                          '37581','16780','86383','99926','76952',
                          '54999','20829','55564','19531','96763',
                          '38758','86711','72983','11656','90731',
                          '14423','36425','66039','99777','75987',
                          '72320','58312','50905','67282','56404',
                          '40432','52834','66147','69090','12580',
                          '31299','68175','41743','53683','71032',
                          '87680','37150','28701','79807','90893',
                          '81689','26823','96934','97290','61664',
                          '51319','84764','87230','26617','11477',
                          '26403','71212','61196','75083','67835',
                          '68757','35054','87611','84989','81861',
                          '11275','22083','27511','54207','20582',
                          '40195','34129','48911','84027','55570',
                          '51900','47747','43665','16186','94097',
                          '90153','35722','68631','37540','87757',
                          '70024','37457','96250','88683','27392',
                          '94539','53510','40137','21149','63020',
                          '34714','64234','36471','62797','39080',
                          '31382','50619','52467','42628','80811',
                          '74182','92671','48253','73129','17467',
                          '39036','67633','40218','16151','58630',
                          '26566','10617','46830','28293','92270',
                          '79666','99794','49105','63872','61170',
                          '27785','85245','28828','18471','73517',
                          '31465','56871','44798','73634','87344',
                          '91268','42248','73437','71445','92605',
                          '62455','70800','79406','54518','28464',
                          '80614','37954','73275','73303','65309',
                          '45064','74002','84625','14671','59222',
                          '67543','81797','97303','98947','19092',
                          '31381','22665','50980','77652','40948',
                          '20865','96202','41602','91892','68462',
                          '40212','15442','24796','81451','55113',
                          '12653','89135','39742','69190')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


