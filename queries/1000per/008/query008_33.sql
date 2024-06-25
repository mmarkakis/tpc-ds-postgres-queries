
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
                          '76560','73575','37981','11712','94257','96108',
                          '65551','31212','92137','24954','11855',
                          '32929','64280','29634','59841','30893',
                          '97132','20107','59481','91219','81863',
                          '48846','61204','66748','48126','89208',
                          '67994','23322','41489','68258','73196',
                          '84986','66666','34501','53893','33405',
                          '26450','99328','30293','38467','31394',
                          '37774','25558','62379','81751','53645',
                          '86353','77723','71164','25705','16878',
                          '45853','48381','65705','94424','95599',
                          '72656','29433','48619','69027','63287',
                          '76479','91227','92782','72947','87916',
                          '34581','14209','80730','20684','52404',
                          '25376','62665','91099','71737','57702',
                          '28291','84106','65289','76943','95253',
                          '51860','91030','41704','40763','35229',
                          '36746','61404','49620','98571','37743',
                          '35143','93869','52637','15629','28209',
                          '14522','89157','74770','11981','11803',
                          '44228','14094','82701','93627','37403',
                          '45381','25128','35015','97089','43091',
                          '59548','10421','14984','55002','72866',
                          '74203','64611','39222','72978','18531',
                          '64838','65545','82622','39424','60729',
                          '17152','14603','30274','96354','73581',
                          '42398','56769','95907','27146','89243',
                          '48434','15463','96093','20357','44022',
                          '67242','33030','80501','38906','13640',
                          '87379','13489','78870','12236','26639',
                          '92455','59397','60445','78337','69781',
                          '65679','39220','86344','65878','42066',
                          '33845','63241','13997','75932','24169',
                          '83371','49151','49719','17911','94337',
                          '22905','74362','93950','20309','47310',
                          '76567','91625','30078','99133','26681',
                          '23159','54491','15203','55310','89856',
                          '76367','34326','57826','62878','95335',
                          '71812','13311','25527','32203','71979',
                          '32057','66702','26241','75030','33376',
                          '44548','13061','67258','51369','25550',
                          '71787','58353','54354','75350','28547',
                          '57503','28756','79316','95896','17290',
                          '77827','47029','62322','11235','48442',
                          '41141','89833','30402','64544','34461',
                          '24429','38807','18250','57918','53358',
                          '45077','22395','18150','62171','35777',
                          '63687','78862','84134','62911','18432',
                          '45929','82476','30153','56068','75609',
                          '74681','43267','16924','47645','52338',
                          '28042','42473','92500','14243','38971',
                          '10479','14879','38741','20416','96796',
                          '33497','17414','38738','78773','77041',
                          '32753','92762','28409','72073','40270',
                          '83526','88699','68312','10378','30412',
                          '14216','70115','91519','92617','15301',
                          '42557','33807','21442','52208','36463',
                          '92670','25164','16467','43482','89735',
                          '12051','72838','69955','80721','22563',
                          '56510','49551','55547','79318','50491',
                          '35390','81402','55822','55148','87723',
                          '18407','89954','38205','47921','70839',
                          '20473','79488','50313','50138','32155',
                          '22673','12399','69315','87652','53822',
                          '77182','36735','79458','93986','44185',
                          '36323','24550','31067','22706','58257',
                          '85151','29115','39634','48090','90729',
                          '52813','40490','55368','13467','69585',
                          '52020','81061','35571','86700','62714',
                          '33532','53236','23814','63261','66248',
                          '93412','39610','97901','53177','24107',
                          '57170','45431','91162','10931','10540',
                          '40625','96259','37023','61326','86772',
                          '37109','21736','60100','35038','66782',
                          '81187','42850','79693','33650','13335',
                          '60127','16470','58271','62229','79822',
                          '76783','62571','68326','59565','49506',
                          '70571','59059','50966','40829','21438',
                          '87790','37746','98199','15359','45276',
                          '65178','76642','44335','59240')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


