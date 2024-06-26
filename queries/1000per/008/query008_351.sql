
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
                          '59464','65147','47712','69913','57091','44967',
                          '75651','44853','36484','48008','20715',
                          '95040','16358','11583','35056','20899',
                          '78150','19165','98243','61533','43810',
                          '82896','40268','45964','77938','62941',
                          '92626','30774','19196','44074','66752',
                          '25083','35125','12381','41519','48435',
                          '30476','64215','70973','92678','73547',
                          '16095','76522','62642','83615','59294',
                          '76805','69440','13320','14405','47939',
                          '49917','77555','21595','23960','84365',
                          '14791','56541','71583','47197','13460',
                          '93533','24898','99646','98405','68102',
                          '36282','89478','40125','46637','38171',
                          '84951','36866','86716','43058','64181',
                          '59571','27710','51397','39499','14004',
                          '93659','75752','80628','49300','79645',
                          '43916','55919','51845','46914','90894',
                          '72701','88186','19385','33176','96019',
                          '98904','54130','47944','82973','23644',
                          '42982','15570','41657','60572','12719',
                          '54511','87145','18579','64807','55127',
                          '74770','62295','30180','51190','60489',
                          '36391','81921','81524','94341','24900',
                          '43381','33591','30695','82693','21379',
                          '92623','48924','71799','53171','75313',
                          '74619','40966','23200','94057','45928',
                          '54249','78975','89538','29420','28053',
                          '96672','98832','72574','76863','23805',
                          '30096','75912','35803','52264','91852',
                          '82778','53314','66567','33491','67498',
                          '83288','70867','74085','83370','35538',
                          '69450','81084','43335','53776','59004',
                          '11077','37373','61926','37461','41092',
                          '27101','43842','61636','27664','14998',
                          '65915','18767','15353','90636','40357',
                          '33382','33472','59651','11631','74301',
                          '51546','53715','19956','26984','44867',
                          '79982','37007','91060','21756','26960',
                          '99169','31863','56197','52202','45531',
                          '42961','61170','52195','23883','71060',
                          '70617','44177','90922','64293','80866',
                          '80143','80560','17769','50139','37126',
                          '34130','13925','39490','48481','76202',
                          '57467','86119','40633','23781','38159',
                          '13854','52388','96474','91250','81214',
                          '69954','13226','33750','98727','53480',
                          '66162','79641','58816','69632','42108',
                          '71005','92356','89984','45098','23029',
                          '94484','73781','95414','59667','55136',
                          '48705','35089','55662','57604','12423',
                          '91755','25759','43197','94994','97760',
                          '45254','91845','46959','89783','40108',
                          '10078','15815','82275','97510','60323',
                          '18369','91280','84383','38034','87226',
                          '50208','62616','45147','80443','11161',
                          '53527','61873','54126','36645','39154',
                          '50415','29148','56086','44078','84506',
                          '92335','56400','42087','97966','63172',
                          '14724','71182','27112','69486','29111',
                          '91662','77160','25711','44983','59300',
                          '33822','34678','88117','49735','78145',
                          '46423','61517','76762','29610','51315',
                          '73065','28895','96345','89933','71845',
                          '67899','43400','72879','53573','86286',
                          '83503','65408','40109','66945','69555',
                          '22873','11618','82377','67197','46393',
                          '18216','95182','65204','70215','29331',
                          '41203','17174','17324','99954','12281',
                          '84590','70925','83545','27031','21218',
                          '67345','72414','34766','82460','52145',
                          '98822','98086','31013','20428','97078',
                          '78483','39965','94142','65627','74737',
                          '92228','47925','14741','94253','54334',
                          '52508','24596','35703','33997','64947',
                          '90100','52291','75237','57854','11016',
                          '72902','59653','80483','78794','52279',
                          '80992','39343','21500','61427','75665',
                          '81066','86264','48829','71124','58156',
                          '39286','12141','58351','21509')
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


