
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
                          '87832','24552','50388','23712','46193','93826',
                          '35046','21172','56860','93432','18979',
                          '10702','81170','98932','74663','97380',
                          '31899','36905','65166','43895','43830',
                          '28208','67128','58743','28466','43260',
                          '99222','77004','39305','43965','96967',
                          '71019','26667','55936','97325','41829',
                          '42334','59355','84547','12340','32115',
                          '10826','70289','60409','49533','60802',
                          '66306','11573','14212','33218','87612',
                          '41181','69319','84010','33353','55062',
                          '21537','94533','92362','81571','52382',
                          '32196','99130','51641','81958','79365',
                          '75090','67530','40973','11040','27993',
                          '65248','65631','39201','22494','55931',
                          '26671','90780','51458','56867','13557',
                          '54771','35302','13384','45467','97428',
                          '56208','95258','73372','90387','81265',
                          '88659','31289','83500','77911','99394',
                          '28142','89904','33789','76706','50107',
                          '85108','63078','64514','67519','90024',
                          '27007','60546','16102','26462','68057',
                          '66328','15444','53992','78247','34043',
                          '49844','45219','40954','50881','60208',
                          '57364','59371','64798','98253','64497',
                          '76979','83169','56159','23629','72824',
                          '37392','14635','11327','46668','33896',
                          '20518','84346','21352','73479','73043',
                          '18041','66033','78678','50646','26576',
                          '76410','30178','56137','54779','61665',
                          '15703','72502','55420','22619','63653',
                          '97558','72998','91937','19484','86164',
                          '38522','15526','14668','53067','34562',
                          '93643','55619','78058','10389','73178',
                          '60442','72981','16280','55014','69806',
                          '94754','47488','56895','71316','79320',
                          '32764','80875','38800','71087','18186',
                          '32710','29480','37919','60378','19183',
                          '17486','76853','96921','58271','41912',
                          '79108','72572','91205','98871','78155',
                          '11949','33967','94078','26041','14828',
                          '44798','44009','69502','37023','32236',
                          '11246','44477','90163','44853','46072',
                          '86750','94121','20086','88538','35773',
                          '26914','48307','63173','67664','50589',
                          '89965','35887','49104','51005','27168',
                          '49353','87558','30197','29264','99055',
                          '37675','32835','77425','91020','83060',
                          '15466','47924','90069','88375','51861',
                          '33643','42429','69009','64619','55528',
                          '67176','74182','98917','74516','82810',
                          '58358','17083','20857','50605','35644',
                          '91258','43131','40427','93830','61005',
                          '41430','91436','38802','20141','71912',
                          '21399','33784','70582','51604','17475',
                          '19667','98746','14011','99282','27888',
                          '70887','86981','19855','60859','32655',
                          '47298','11083','18776','79512','82946',
                          '59168','22252','38793','33342','97142',
                          '71599','43229','74831','60370','97141',
                          '37707','26638','96055','33179','14189',
                          '44012','32240','31665','25919','50342',
                          '73905','53039','92777','33303','66843',
                          '29572','22727','16830','56640','64736',
                          '31545','87735','10238','11775','47123',
                          '23032','94451','52352','18363','49029',
                          '58980','59527','96402','24497','47542',
                          '94683','66098','19080','73702','72833',
                          '83459','24938','44752','27635','32969',
                          '36206','90529','35091','44010','28309',
                          '26750','80450','57254','78847','63245',
                          '98893','38585','53455','37966','55068',
                          '36128','73392','43768','41880','44683',
                          '46576','78409','70604','90839','23426',
                          '67055','25600','48153','52101','69119',
                          '26045','75000','52731','80774','70351',
                          '88078','83556','56704','69754','98577',
                          '23681','75354','38273','20663','94241',
                          '45285','89740','22390','69928','48048',
                          '78310','29399','23863','23572')
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


