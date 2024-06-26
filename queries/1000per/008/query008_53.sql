
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
                          '21597','52707','79443','30297','28153','97692',
                          '75720','55183','34153','15131','99407',
                          '61100','50841','29081','20359','47426',
                          '18056','67398','28218','33239','28626',
                          '32880','37953','88673','89874','66959',
                          '69016','73857','31273','26826','15575',
                          '26674','43884','99365','81029','95607',
                          '64492','32414','63680','88543','38509',
                          '59509','60912','33357','14879','61708',
                          '45237','68861','21340','62459','16175',
                          '13824','34984','79455','49143','76200',
                          '69137','45831','26335','79019','69500',
                          '45084','59907','41789','54828','68135',
                          '93612','28932','18386','17697','63915',
                          '86117','53201','69834','22448','24286',
                          '55980','52624','53398','83041','47289',
                          '90297','18164','19423','51732','64870',
                          '68388','38958','72294','92448','41023',
                          '25801','87137','82699','14479','59069',
                          '64571','32732','58379','51944','90097',
                          '13901','14494','62049','94781','49213',
                          '22310','67965','32002','45726','89011',
                          '19573','38248','70277','10250','15204',
                          '73175','93079','25407','83032','90230',
                          '16357','36349','27164','81339','89852',
                          '45110','79210','41950','26219','88584',
                          '81030','83610','95147','83941','62377',
                          '71555','51325','63192','17264','30078',
                          '26627','70376','45546','19927','55069',
                          '72854','13692','44502','85788','58172',
                          '42860','17500','78176','62265','61600',
                          '70092','44439','64737','57746','33742',
                          '72622','47787','29653','20029','14983',
                          '48226','33280','46592','96919','96147',
                          '10896','96220','76604','73568','21378',
                          '79466','79847','17277','68483','27448',
                          '69632','31700','75805','54185','83001',
                          '32054','20506','11377','75589','16569',
                          '90053','25858','15883','70210','71854',
                          '16121','73532','54994','15345','56809',
                          '60734','26962','12322','25533','65803',
                          '95213','64527','13770','88897','39782',
                          '31928','97697','18438','15634','62725',
                          '13472','34205','54449','14835','46912',
                          '72009','89715','76136','38621','16996',
                          '75394','10459','43385','10534','87227',
                          '90781','43167','77517','66081','99779',
                          '37062','79090','91943','99328','89088',
                          '31300','53455','22384','80064','38938',
                          '47928','10148','85859','44210','53665',
                          '75971','42978','22185','35207','99598',
                          '94777','24390','14273','33161','37140',
                          '78305','16170','48775','24779','18712',
                          '53830','55852','64271','14021','95602',
                          '94794','50978','18664','49558','66307',
                          '45562','64383','26963','24232','81413',
                          '51494','97225','93234','31250','38360',
                          '30565','11418','12011','12214','45096',
                          '24949','34131','91227','20316','23108',
                          '84579','40264','23918','26848','95979',
                          '15405','95100','71969','93459','37210',
                          '25937','47990','64550','97650','86970',
                          '58170','27879','85378','38777','73894',
                          '79903','31097','76985','59270','69309',
                          '13400','80960','68654','33941','64311',
                          '85205','12853','25777','16841','29312',
                          '19367','53294','59391','20934','40155',
                          '36262','58474','85020','90787','58962',
                          '69604','50340','85794','69789','59794',
                          '91252','11985','73510','32857','96467',
                          '20719','48617','79264','16204','43488',
                          '37141','78134','28954','92215','11335',
                          '19690','72326','27667','76183','21881',
                          '67828','86220','99708','67994','94098',
                          '94369','42784','22169','63676','94373',
                          '36543','58072','18414','20850','32056',
                          '74879','65418','87654','56481','49792',
                          '65178','26747','25787','45773','71019',
                          '79149','94699','76500','81047','16152',
                          '25200','19435','21198','70479')
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


