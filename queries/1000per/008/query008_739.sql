
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
                          '72966','39728','62255','82122','90846','11079',
                          '13525','12942','70996','13733','97790',
                          '46735','68538','47323','84989','52557',
                          '55165','45728','98088','57598','52333',
                          '33960','90383','59103','36519','50771',
                          '96120','75004','66753','96749','20254',
                          '31811','58027','67965','64680','79405',
                          '24740','80234','59801','66994','57452',
                          '31209','40068','41430','53142','79334',
                          '48393','93642','10779','90684','11873',
                          '79126','97159','61471','11278','96962',
                          '55525','43317','46848','37652','12146',
                          '27978','98383','32891','36765','50003',
                          '43845','19342','81049','40196','11830',
                          '20079','83076','22179','62177','79588',
                          '96073','89901','48698','20729','61001',
                          '39386','98790','11732','70107','27058',
                          '36584','98528','17658','32952','30953',
                          '89326','41393','32179','50533','73953',
                          '13209','19350','90162','90081','56100',
                          '34434','18751','17739','73641','19747',
                          '90659','31010','49046','91502','23697',
                          '36256','97622','74738','95410','11076',
                          '11563','40157','14300','61712','57103',
                          '75086','12023','11118','19827','81889',
                          '28655','90813','34959','42283','61889',
                          '77695','32647','38983','75243','70597',
                          '31159','84524','90736','63138','13506',
                          '71490','51056','22626','82840','77047',
                          '78467','46838','67062','66779','71994',
                          '98154','98401','41114','50947','67221',
                          '24522','27275','68481','27089','98023',
                          '28501','61108','36761','52613','11733',
                          '24477','39606','35666','39272','44489',
                          '78179','20634','30142','60854','80028',
                          '74359','15758','45965','58519','49010',
                          '63322','40408','55512','18855','45436',
                          '47730','46066','30678','43905','10219',
                          '68732','78731','56354','65405','15976',
                          '68111','18478','30014','31580','44624',
                          '12853','99183','11042','88685','59191',
                          '64369','30141','94910','25612','94015',
                          '80380','92103','82793','68969','36843',
                          '99208','25288','49236','96804','88637',
                          '33573','29307','23812','12087','56707',
                          '28481','15929','66285','34969','34597',
                          '51185','33578','62772','77908','86402',
                          '38461','73734','81715','99242','67563',
                          '66665','30294','49838','96709','35098',
                          '94376','39619','57292','38675','62404',
                          '65627','70090','58037','23868','54553',
                          '43925','73253','70249','35949','12036',
                          '62052','32029','95501','27872','91861',
                          '39277','72822','33112','79967','50221',
                          '63176','63479','33095','27774','55939',
                          '50780','21206','98219','97220','46785',
                          '83500','36356','15522','82391','53845',
                          '54430','97181','30553','92995','77202',
                          '67003','59464','22199','92863','46956',
                          '63595','17564','10387','90987','38420',
                          '79983','39516','94699','56410','88626',
                          '25832','60401','94615','91043','25478',
                          '76879','30262','25324','52095','57511',
                          '22088','65700','69284','14764','77272',
                          '45032','72053','40008','26778','15713',
                          '19798','74011','21078','41775','63091',
                          '11673','55990','42828','45215','65067',
                          '86697','59398','33539','84553','82177',
                          '89784','77689','52913','99913','19941',
                          '87513','10038','41550','73297','26595',
                          '43039','14230','42908','10395','40811',
                          '23181','20495','41293','47478','24559',
                          '89569','82503','38429','44355','99906',
                          '16758','73624','44522','17412','30587',
                          '97683','99996','19215','86456','32355',
                          '85288','96867','71556','58468','19099',
                          '67446','91352','19177','10373','41978',
                          '52398','87483','68922','87909','30257',
                          '70233','21279','90468','86614','78437',
                          '94549','63613','15924','66344')
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
  and d_qoy = 2 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

