
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
                          '72218','77561','76885','81690','12862','35286',
                          '67231','78505','86680','63412','53428',
                          '82432','83657','38771','26823','37178',
                          '15258','17265','56603','29894','85486',
                          '22117','93772','71331','98403','46809',
                          '58366','62521','42229','70246','30578',
                          '65866','33911','52521','11047','23005',
                          '24618','49492','89718','60404','48232',
                          '21232','38923','57373','88187','91725',
                          '99573','73362','49157','71408','93590',
                          '53956','73852','39767','64760','42809',
                          '91224','34223','24342','69948','24231',
                          '88893','59449','85000','11865','39614',
                          '96856','87516','59123','72135','56512',
                          '46553','62612','33983','47296','86628',
                          '23216','55443','36407','27224','93342',
                          '95271','79627','89281','88771','71607',
                          '57616','12014','47487','44401','58965',
                          '66644','40193','40341','98419','43027',
                          '81964','79916','65029','39204','59142',
                          '65314','47366','21541','36288','27591',
                          '83285','76768','82938','75523','69506',
                          '34216','56471','85643','95930','75133',
                          '88501','51057','48147','58169','34868',
                          '34391','59927','26837','30993','27257',
                          '43963','85026','95564','42038','20452',
                          '43663','55450','92399','41299','15886',
                          '18320','24014','45829','72317','36436',
                          '14618','81336','41076','77577','47891',
                          '85175','74856','66582','41712','86518',
                          '54920','86133','51381','12062','38671',
                          '15198','84379','92795','40718','75342',
                          '17414','11128','70604','15547','68655',
                          '96120','63401','98822','43598','73547',
                          '91193','79836','56392','35887','44768',
                          '25898','12485','13022','58962','75817',
                          '60367','48863','66696','43135','88596',
                          '90599','38587','78763','66686','97455',
                          '93188','62625','96231','15928','86925',
                          '50926','93917','16855','71072','24193',
                          '89102','22573','21349','94291','40496',
                          '15293','26056','92460','11905','27745',
                          '31961','38304','52269','69113','33897',
                          '97547','98932','44703','41424','85577',
                          '77834','44093','67542','79867','39194',
                          '77579','34212','58068','56271','82030',
                          '55244','73550','24161','29046','79668',
                          '63766','27455','42943','62044','91133',
                          '46535','47056','14495','52287','63008',
                          '21137','99027','20679','75621','60409',
                          '23533','75404','59452','37890','87878',
                          '41441','90382','94753','95669','62892',
                          '67878','80968','76237','25045','91901',
                          '23012','67445','58271','82700','70744',
                          '23622','61676','14840','62884','60141',
                          '79145','98546','22298','49026','72688',
                          '38837','14214','93061','92241','52664',
                          '61372','66830','17801','97459','28915',
                          '29065','43061','84573','74817','15670',
                          '25050','52805','75786','58821','52990',
                          '92377','68694','57729','66463','31853',
                          '84179','12396','79696','53570','16981',
                          '18427','11532','77125','95467','67724',
                          '40615','82263','41912','95817','81265',
                          '41103','70902','49064','79633','16503',
                          '47354','80199','45409','63736','80081',
                          '24922','97771','69846','85079','83517',
                          '89868','97020','56621','14966','78311',
                          '12521','31575','78074','75025','45542',
                          '48545','87376','14047','98082','49278',
                          '18436','51062','66120','57965','72650',
                          '91828','24962','56699','28221','23620',
                          '55318','17536','61083','27906','24998',
                          '33864','36735','81035','72523','53468',
                          '81348','52576','33178','35023','39477',
                          '36466','86839','76063','70159','78327',
                          '19362','40295','15473','15709','81460',
                          '74752','34323','71844','14672','29070',
                          '88924','46461','84001','96610','17644',
                          '74722','49429','58973','19498')
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

