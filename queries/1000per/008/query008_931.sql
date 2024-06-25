
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
                          '22596','58362','27641','32732','13779','51176',
                          '60613','10584','92800','79911','96224',
                          '93596','68523','17959','77148','41342',
                          '52303','53724','17991','63144','43723',
                          '13754','27602','60819','11391','93288',
                          '15988','84524','47780','80283','47037',
                          '47933','73581','64264','11930','90282',
                          '47648','59787','25457','15312','42656',
                          '78525','89919','46630','70911','31434',
                          '66877','89910','63180','86067','62736',
                          '81870','61201','91416','11458','69301',
                          '33062','62552','20038','75047','50056',
                          '95259','66876','27580','27482','25365',
                          '90795','89264','44661','98154','73116',
                          '52476','69932','78646','94799','35793',
                          '56932','26412','53293','17002','71167',
                          '26420','14599','83204','41090','66982',
                          '21070','92170','33515','13235','96398',
                          '63860','68032','43811','33661','86351',
                          '96137','58588','21461','86121','53458',
                          '16443','68350','73895','22550','84766',
                          '78628','27235','46951','92443','65094',
                          '66054','85565','89507','14868','66454',
                          '81269','97016','67947','73989','73407',
                          '27719','89157','39358','22320','37214',
                          '51269','77870','15853','77766','10893',
                          '12676','87678','49306','94975','89310',
                          '56816','67536','73185','46734','28722',
                          '70540','34229','25442','75146','70037',
                          '93448','74585','34437','43064','41100',
                          '87661','48749','16144','19879','85417',
                          '92089','43828','74547','33386','90545',
                          '75996','16712','99907','94541','84380',
                          '69589','13238','41772','50911','27918',
                          '51268','56918','20837','80447','10950',
                          '98357','81835','34385','41571','45935',
                          '80887','61372','92997','50717','69276',
                          '85788','66852','76303','82169','78957',
                          '26494','39510','37432','28581','20173',
                          '10576','59819','74928','41512','19524',
                          '78287','90479','85102','57091','36022',
                          '83172','52304','39195','62128','34322',
                          '46592','45747','60104','74857','25967',
                          '29162','80417','49807','80872','82602',
                          '31574','53768','15116','39519','71520',
                          '19526','89095','70907','74186','20356',
                          '77419','10219','33368','44748','99288',
                          '92087','80865','82210','74014','75601',
                          '67839','67082','49800','79844','83526',
                          '89540','75478','31238','38593','33060',
                          '63354','98571','34788','89824','53122',
                          '15059','66641','67938','82351','49748',
                          '45209','56704','14035','15106','13027',
                          '81577','43962','63820','47345','84251',
                          '51770','58064','27139','49167','67342',
                          '19201','22444','74002','33618','49356',
                          '47533','88853','15540','56945','13380',
                          '17860','64973','11494','45057','12260',
                          '10100','76535','25261','97817','95148',
                          '31161','32166','32356','70621','53476',
                          '25811','94229','12655','45442','13995',
                          '63783','33713','74977','96597','46486',
                          '78551','13976','28455','63423','52208',
                          '75036','84029','70038','35292','99706',
                          '80626','35692','27140','56024','98231',
                          '77596','21311','76995','69450','21374',
                          '80487','63456','60469','53959','68234',
                          '24007','59190','78684','18132','34419',
                          '43993','11506','51518','64903','61255',
                          '85245','64719','84987','41633','69166',
                          '99508','48176','19047','35652','41240',
                          '28148','89772','73480','68693','77492',
                          '19172','87291','55645','40827','27414',
                          '30905','98787','88969','32599','74047',
                          '10125','29072','38605','36762','43719',
                          '91631','66336','29568','88029','69786',
                          '57276','16569','24626','46497','33131',
                          '99988','75919','10102','26094','28408',
                          '76113','71429','79689','18588','24773',
                          '60314','82282','87270','52270')
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


