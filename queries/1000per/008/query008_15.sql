
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
                          '51060','70473','91072','22370','22893','11462',
                          '27141','39503','54625','31992','88466',
                          '36064','63980','86611','85614','92801',
                          '53334','18517','17480','98791','22072',
                          '57260','24554','36828','76944','52493',
                          '57611','74643','31178','16852','60196',
                          '34891','20518','73612','56123','59459',
                          '16675','29969','98335','24475','61425',
                          '66854','65612','41303','25400','72100',
                          '54677','68628','85123','13784','83347',
                          '40595','11119','88991','47028','39587',
                          '85975','61112','42606','86113','36231',
                          '52404','47606','49188','21105','72836',
                          '34286','43248','79137','30826','67308',
                          '65683','79362','66932','72186','35273',
                          '10899','87640','31576','22441','37296',
                          '84611','21325','39184','48784','65535',
                          '90156','93593','53477','64277','76532',
                          '68193','76551','75417','38031','26606',
                          '90611','11065','25398','74446','99962',
                          '30141','30945','55621','86302','24167',
                          '37453','92900','98464','29565','31593',
                          '57139','67433','98802','48423','86110',
                          '67466','49222','16234','43660','23751',
                          '57453','23962','90897','67171','46736',
                          '21855','44740','44948','87668','69445',
                          '34990','59250','83138','27664','26674',
                          '14392','56267','12611','39738','10563',
                          '39003','45196','74356','57401','11765',
                          '48197','17619','56851','87548','52975',
                          '15028','85685','35410','39773','43091',
                          '55433','60815','35330','96060','25379',
                          '90592','34213','24243','81636','27604',
                          '92170','50903','96167','65583','13570',
                          '30130','46954','81013','25377','53880',
                          '52378','30518','76840','56262','51996',
                          '76571','45431','45668','48952','25050',
                          '60975','16276','42015','97107','50769',
                          '91041','21588','67218','27910','92656',
                          '46474','86801','50272','45664','45081',
                          '67135','72737','64853','88079','60427',
                          '56474','52460','40393','53167','41489',
                          '73981','36962','12077','89433','71490',
                          '68796','71098','63758','21714','49801',
                          '38105','83764','86276','28519','39212',
                          '54714','52421','62323','72001','15805',
                          '42664','21485','87669','20167','41637',
                          '29036','52013','49065','24231','81890',
                          '54316','39334','40804','52812','82406',
                          '18675','11949','26428','39532','28918',
                          '67436','18097','49399','67523','22660',
                          '68964','22065','98307','43274','71347',
                          '17547','88677','48980','79653','58107',
                          '98225','39363','89169','36159','50073',
                          '19501','24801','52886','67739','13032',
                          '25632','15829','60704','17962','22669',
                          '89827','70697','21364','14547','58308',
                          '57582','83697','44089','85120','93830',
                          '70609','34115','48921','37590','94446',
                          '65973','43209','30158','23834','88125',
                          '38180','69208','70062','41437','83898',
                          '10101','60733','92625','83406','16681',
                          '37863','34426','44945','31838','94450',
                          '24713','17118','67652','17533','53089',
                          '92719','31493','74750','34749','26735',
                          '57422','78087','82563','80510','82603',
                          '78329','64501','93420','44112','11403',
                          '94184','92110','56280','68929','33851',
                          '85073','23332','59368','82838','38641',
                          '40959','47611','13641','72384','48757',
                          '27991','17784','39605','17387','68538',
                          '87439','59411','87853','12519','66224',
                          '91561','29465','21265','10730','34207',
                          '92474','43271','20145','73923','44145',
                          '77040','96427','61840','78928','45439',
                          '63065','27956','38015','37224','71587',
                          '85739','88383','70259','14686','40893',
                          '62884','26107','27328','78227','79328',
                          '65358','81159','26298','83641','18667',
                          '14454','77439','75454','82551')
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


