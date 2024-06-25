
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
                          '79698','34698','15464','13801','79576','27944',
                          '79265','48522','94318','64159','49011',
                          '65469','43495','33409','48322','22528',
                          '43949','24978','24443','14429','70140',
                          '28477','16707','74360','92741','14078',
                          '70435','93480','73700','45821','22810',
                          '48822','30281','82560','10710','19236',
                          '70253','76405','76287','53599','32784',
                          '87465','89362','85471','29722','97975',
                          '81220','24316','65424','28555','20246',
                          '46650','98320','16049','69966','70937',
                          '34455','29331','23291','53083','48818',
                          '13310','80271','18783','92816','91291',
                          '50374','63849','12607','70181','15328',
                          '57486','97207','66531','40488','45227',
                          '21298','70148','66732','87563','70111',
                          '58196','96112','20373','35173','36169',
                          '60857','10374','26566','41636','63244',
                          '71605','86968','50490','40806','37541',
                          '67483','96488','12176','31173','99506',
                          '23879','96740','79493','23304','44551',
                          '55185','65929','86173','71585','79998',
                          '41308','96071','51859','61804','40242',
                          '11686','53160','25820','27142','54800',
                          '30138','70128','47911','91123','24003',
                          '38509','64083','32521','75384','81726',
                          '56881','22678','30876','29727','86355',
                          '88814','54919','44227','13480','38292',
                          '79201','86057','35462','75507','40426',
                          '32169','19336','52178','84424','39371',
                          '16202','70965','88070','51941','26423',
                          '12317','72204','70003','96727','28658',
                          '22088','57450','60355','79585','96887',
                          '27437','51919','18547','25711','76583',
                          '83958','27306','59707','11738','97616',
                          '93323','55315','80233','60254','61123',
                          '82701','70929','90574','14914','58571',
                          '14486','77000','77914','87490','30381',
                          '48938','24660','99125','83907','44614',
                          '52652','32599','30604','64981','28341',
                          '92592','93800','79575','81871','78557',
                          '59288','27569','91306','20358','48162',
                          '33579','97421','23347','96210','44941',
                          '45868','69140','82538','87796','54527',
                          '78791','70715','40798','32480','45181',
                          '19799','67970','29813','38229','59283',
                          '88670','51051','25330','32174','81921',
                          '36008','89364','23407','36469','52502',
                          '76669','80112','66083','39399','28259',
                          '95733','95823','94052','58164','18174',
                          '59595','92870','76977','35283','78086',
                          '52670','53363','82696','74708','83499',
                          '44616','99200','25256','76553','67035',
                          '60558','97820','52648','80910','98294',
                          '27718','56197','77694','61212','94210',
                          '36131','54012','70080','26761','14775',
                          '78299','22668','64870','99536','25218',
                          '61587','49654','47253','30104','33798',
                          '82382','77156','23474','44536','76622',
                          '59361','41593','94627','74809','96669',
                          '77443','21535','61271','65512','76957',
                          '41983','13914','11427','76382','97639',
                          '64441','82953','96019','12090','35376',
                          '81570','57544','82545','81322','41804',
                          '37747','18674','33613','42651','87997',
                          '83314','48972','21099','10604','41343',
                          '11244','54913','84812','17808','23652',
                          '42762','22919','64801','49569','31887',
                          '40888','76086','26822','57586','42234',
                          '36821','68526','56994','56419','82390',
                          '89712','29115','47454','45666','46960',
                          '36309','95237','13974','79044','90489',
                          '98348','57865','76255','74716','72102',
                          '49154','18670','19735','66404','33274',
                          '18679','11868','80844','15884','63871',
                          '13522','88099','59053','69591','29850',
                          '44801','28154','48118','28281','93606',
                          '85744','58001','92321','52064','79320',
                          '10988','72552','22429','84950','63605',
                          '49366','17783','61969','12573')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

