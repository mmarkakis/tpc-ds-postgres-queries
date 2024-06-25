
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
                          '52188','88058','46632','95872','47258','72853',
                          '97987','27073','86395','91559','38732',
                          '14483','20975','73709','86257','78837',
                          '80324','94467','58332','80916','26317',
                          '57698','58587','14298','95569','58156',
                          '28835','43584','20489','87457','74627',
                          '30959','46847','85289','79035','53337',
                          '23469','57075','16112','32261','27343',
                          '61831','45270','24451','18224','47482',
                          '21062','81289','63566','94210','88742',
                          '35235','84116','60855','93897','66774',
                          '11260','79914','77875','71518','10992',
                          '35451','39630','64113','77281','91537',
                          '50481','96236','94237','11329','17406',
                          '24793','80888','72248','45544','97502',
                          '31191','20229','10797','89182','30844',
                          '19747','99166','72567','44485','99983',
                          '76275','18011','72874','76953','86671',
                          '10692','85326','74162','48837','79253',
                          '30974','98726','14492','33830','77142',
                          '58023','46236','91542','14113','55238',
                          '10444','74827','53559','63496','59889',
                          '87599','43128','22153','90722','84000',
                          '93931','30361','62447','42873','70162',
                          '49314','19235','96707','65327','30706',
                          '17021','69954','75572','74111','28530',
                          '83164','51450','12764','67127','53997',
                          '93829','68159','88998','33800','11140',
                          '94051','72871','62557','43393','85671',
                          '75499','19593','67299','54133','94129',
                          '75030','53949','66684','16910','26369',
                          '87047','97376','88238','73393','91104',
                          '82270','33879','76043','75110','53190',
                          '99397','55118','70477','89621','48081',
                          '26332','92486','77837','17278','30649',
                          '72002','66729','53606','22061','10190',
                          '73649','51219','65839','82561','18046',
                          '25503','27531','19538','60625','29297',
                          '23590','39400','26214','15314','41733',
                          '62455','33534','74395','94565','85167',
                          '99337','44307','35460','50926','73001',
                          '34045','88161','34932','83383','66776',
                          '46135','13725','77316','25842','84158',
                          '84337','24063','77749','26398','57700',
                          '22362','74590','52832','64780','76681',
                          '92988','30145','35323','13833','18252',
                          '95844','12795','68317','57832','11537',
                          '97257','83730','22912','13855','89126',
                          '48429','90303','22399','71185','10981',
                          '93005','53713','15062','26049','46478',
                          '65200','82193','57600','44799','57758',
                          '48575','19339','10220','78506','67692',
                          '45543','26144','30698','95862','69842',
                          '56971','23660','17351','96174','45221',
                          '35457','61749','76130','57371','26888',
                          '44700','27388','30719','66641','11599',
                          '38353','25001','99003','67749','87483',
                          '87742','85689','59934','25789','26286',
                          '31872','43145','46974','74557','74060',
                          '55914','70588','71422','93821','73728',
                          '78989','57357','66063','76575','13462',
                          '89485','19848','65318','30782','56192',
                          '23044','12181','51869','55129','15164',
                          '50496','11611','59301','37774','72627',
                          '11216','80740','88979','41754','17790',
                          '76573','75113','83225','14816','45475',
                          '49440','79361','18793','23947','47196',
                          '80675','52060','39595','90177','10926',
                          '55261','79062','63460','97555','17965',
                          '27179','83521','67489','92280','37980',
                          '41355','49792','86035','60415','51772',
                          '47942','60070','61978','53865','30524',
                          '51975','65606','37457','20369','56985',
                          '27985','94972','55079','26915','73519',
                          '45808','95632','51126','40525','62961',
                          '28741','27357','40111','22750','38313',
                          '71332','53350','79960','66726','70336',
                          '36806','32740','49555','38185','99509',
                          '90145','98243','38498','80818','45212',
                          '77401','79778','85537','80342')
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


