
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
                          '18327','98252','29267','67989','50259','30721',
                          '22220','14974','69619','78985','58647',
                          '42942','46127','39399','37745','29245',
                          '42333','93998','19126','71492','89978',
                          '83808','93651','73604','21261','25525',
                          '54594','94006','10544','85954','54027',
                          '35928','52313','53176','81829','97773',
                          '16775','57676','87011','65136','37567',
                          '78579','81770','96910','41418','86647',
                          '82349','27702','19996','46911','13272',
                          '94856','26607','10332','83448','50848',
                          '81542','24934','75543','62273','60953',
                          '37519','56630','90359','84357','77735',
                          '51451','58518','66793','46533','32282',
                          '22952','72397','20425','83959','26129',
                          '72955','79702','42730','40776','65776',
                          '56691','98469','15543','98611','66987',
                          '73157','70027','13879','82654','13554',
                          '46073','84003','73417','35118','14202',
                          '20817','88436','36482','46359','96271',
                          '81415','84336','63869','47331','46164',
                          '22638','16176','89882','49238','75462',
                          '29581','33184','90952','10501','46625',
                          '84435','93247','78569','70470','92484',
                          '66891','36927','70306','98026','96278',
                          '36472','94756','87736','59951','19826',
                          '40093','41328','13868','52686','78654',
                          '46852','41828','42344','48319','81291',
                          '83950','67572','20478','76413','65816',
                          '10441','81151','97439','43638','33056',
                          '79172','75639','82735','82280','59499',
                          '16159','15800','88140','54005','37297',
                          '37092','79589','18168','24933','16232',
                          '69821','87575','80513','44050','36824',
                          '47170','69319','71484','25792','82175',
                          '92452','66359','70959','98149','11760',
                          '97014','35242','67885','78030','89411',
                          '83655','72094','31981','70807','85000',
                          '34128','47780','67101','99013','56775',
                          '77223','48006','53046','54551','54823',
                          '96402','83812','46091','96728','41041',
                          '69304','28614','78078','27663','45714',
                          '84737','51652','13553','15176','12362',
                          '20078','66095','29354','14106','20692',
                          '68873','12726','40945','97336','70962',
                          '91276','92558','43835','80914','84280',
                          '68455','75016','87485','90160','19196',
                          '60833','50871','21053','52764','12392',
                          '58371','13095','93590','61454','75460',
                          '57083','99137','55641','55313','54595',
                          '89085','69434','60459','89011','59842',
                          '25877','49572','34754','54310','31208',
                          '25481','67724','36883','41725','44325',
                          '60090','16626','85604','77007','41126',
                          '51269','44885','94927','28335','83797',
                          '73753','55230','51829','54212','16123',
                          '29086','92661','23424','48041','16421',
                          '70896','37632','41934','96629','56950',
                          '53930','71470','41149','74899','16464',
                          '58020','32852','78422','26353','41432',
                          '38457','80517','45893','12138','63847',
                          '13180','11244','36686','18720','24050',
                          '11778','58878','23271','68083','90616',
                          '45735','33162','77575','68594','13467',
                          '54207','16005','71299','31879','35306',
                          '43863','86415','26086','47260','75446',
                          '70734','63774','44598','96007','57415',
                          '36100','79693','43987','86447','31680',
                          '47636','97432','41747','58749','31752',
                          '31316','65171','74024','20109','48148',
                          '31465','28362','27278','91716','87446',
                          '66300','44803','87797','70587','57943',
                          '55913','30851','93166','62070','27520',
                          '36732','70997','12595','88719','56409',
                          '95271','34814','73465','90348','72703',
                          '37809','27189','78523','11979','17763',
                          '54862','91891','21760','59862','12974',
                          '21204','23803','38733','96901','49327',
                          '95793','77048','33850','97515','55569',
                          '44207','72675','43265','14617')
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


