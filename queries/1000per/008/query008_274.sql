
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
                          '66499','21660','20202','86289','40039','71935',
                          '37570','17960','60519','60082','91933',
                          '62155','50924','93943','98695','59614',
                          '27243','66046','65014','59507','44828',
                          '20297','23829','90043','16618','37639',
                          '43712','45581','86650','81801','20054',
                          '85305','25341','89313','77537','64395',
                          '89065','81499','80297','55497','29531',
                          '84192','66724','68419','21312','90895',
                          '49144','39369','14225','62805','86781',
                          '21877','15821','44012','67235','19092',
                          '24554','72525','75722','40608','13853',
                          '77545','74922','85951','17165','60628',
                          '63032','13080','96299','56335','51862',
                          '74070','55280','32336','98014','77274',
                          '18519','54074','60281','15287','14786',
                          '89986','84483','16597','16586','12174',
                          '58148','14690','99418','55051','87868',
                          '96427','37813','67240','38498','45368',
                          '39001','97291','63719','49737','33258',
                          '73227','86160','72528','71680','33563',
                          '18183','22305','67333','42711','74596',
                          '46792','80890','56473','77623','58882',
                          '96435','24125','59431','24613','56635',
                          '13498','18700','20275','60925','88066',
                          '38481','89664','14955','58883','58857',
                          '71164','65981','16831','97467','73219',
                          '38663','70229','42774','81569','69827',
                          '50682','80321','49110','22964','91682',
                          '86057','70389','73801','25421','61575',
                          '90949','68243','33330','60920','15823',
                          '22641','36142','55909','34392','23208',
                          '45505','27140','11184','55441','77692',
                          '76545','90646','89521','42541','91731',
                          '93940','47058','76947','41826','41770',
                          '19030','64198','36453','22376','69661',
                          '91613','40891','69493','74051','84240',
                          '19413','93502','46001','60240','28606',
                          '32217','30718','62694','66348','35840',
                          '20396','29900','78173','89964','55741',
                          '22928','30228','14268','76573','32204',
                          '98454','11024','78952','44666','76628',
                          '11243','77167','51097','70812','98827',
                          '93244','87555','92960','29671','76000',
                          '72194','74022','72496','81257','77209',
                          '26281','26892','41520','11272','50053',
                          '90561','51571','84950','11923','31993',
                          '36905','88881','76021','96371','73907',
                          '88067','33366','28573','70437','31038',
                          '64587','95706','85276','15729','94523',
                          '73367','70376','33918','56589','25456',
                          '38454','27902','45928','53361','11820',
                          '22160','62418','52733','62231','54253',
                          '58489','93695','70807','69459','69746',
                          '37303','32351','48861','65586','16625',
                          '77053','16201','88509','60516','20433',
                          '62413','32321','74143','92398','44306',
                          '83563','32896','47279','61252','52247',
                          '28451','41885','58620','88397','89355',
                          '72016','23285','12691','90041','82396',
                          '86360','29360','61589','79900','58893',
                          '39386','97755','62815','63708','43498',
                          '15330','14892','68262','72925','77938',
                          '72673','39959','55722','23336','77665',
                          '26456','97741','62153','59989','53310',
                          '25043','70364','46252','79870','45565',
                          '47578','96288','37950','52467','51556',
                          '55088','94740','73889','35665','57113',
                          '44739','10461','55901','35132','97940',
                          '65168','34755','31768','63250','23692',
                          '48525','29353','34722','75583','83173',
                          '76022','47271','60278','41249','96981',
                          '81157','46665','47990','56382','84708',
                          '94836','86985','59189','58688','32725',
                          '89006','17822','61859','19295','15503',
                          '87398','18291','70773','50841','53046',
                          '11289','12866','93359','18259','61716',
                          '35580','23228','77862','10319','15607',
                          '79249','72549','60338','43989','25472',
                          '10787','57991','95880','59341')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


