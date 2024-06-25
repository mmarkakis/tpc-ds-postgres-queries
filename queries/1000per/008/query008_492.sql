
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
                          '27702','56391','75900','77581','50638','21629',
                          '61572','30431','75378','58896','71863',
                          '91058','98706','66250','76436','40278',
                          '92543','11147','63783','37118','17497',
                          '68122','16750','29201','26530','27068',
                          '66668','44892','97098','60350','55978',
                          '25436','56112','85683','82331','32395',
                          '65857','22267','14239','15832','14569',
                          '77139','45740','89520','96384','96702',
                          '77968','37441','16841','40263','92752',
                          '65379','36620','97825','91951','11126',
                          '11962','45789','72211','59147','31476',
                          '10862','67281','55579','37443','42459',
                          '42928','68302','97190','94031','20620',
                          '97714','88099','12783','21788','17905',
                          '21457','36874','95768','73317','22049',
                          '20711','35620','77895','41802','74441',
                          '15654','68312','77077','72801','43184',
                          '24678','58887','67264','98435','58952',
                          '12335','88404','53476','16329','91831',
                          '22779','80967','80547','22923','54620',
                          '45227','37238','41979','51991','68852',
                          '22119','73149','42293','28537','45604',
                          '74285','36472','23754','35830','99306',
                          '26297','49059','47234','19781','30956',
                          '13739','99276','71052','22308','85388',
                          '28661','74593','98043','45645','33122',
                          '60738','68892','80404','80805','77450',
                          '30926','60059','28060','22666','41655',
                          '70461','59220','54441','16941','83491',
                          '59294','97653','94133','34370','94332',
                          '11934','10005','86890','84472','22197',
                          '71983','69324','46400','72073','82065',
                          '95542','64567','90393','70057','47258',
                          '43171','31403','13031','95663','63315',
                          '37392','18782','96869','55175','51131',
                          '57509','63811','21129','59138','38615',
                          '19911','16207','49413','13925','10917',
                          '90333','66241','71284','30005','22179',
                          '81696','91849','39162','95120','91448',
                          '23488','37287','23555','71354','49234',
                          '34255','15117','39048','74181','58957',
                          '19492','13168','81862','39015','20412',
                          '87264','75525','97356','90163','82042',
                          '28219','25499','92269','57020','86516',
                          '56575','22242','56446','55430','13165',
                          '57269','17903','80746','55690','66368',
                          '42834','13100','52336','83546','27460',
                          '68824','44197','24142','66711','43791',
                          '41589','99818','99261','26252','34673',
                          '45491','25857','84711','96723','60566',
                          '25013','78098','36596','87944','79770',
                          '63403','46941','91903','11615','20681',
                          '70173','93782','68266','30124','19739',
                          '85533','81125','50723','83180','24339',
                          '11293','77816','20426','85543','26601',
                          '48255','60115','59769','10099','93541',
                          '12319','14828','53769','44219','17616',
                          '50879','52839','58578','19278','71072',
                          '25068','50869','33910','97668','56346',
                          '44712','35475','86355','91382','45206',
                          '34550','12042','96769','11571','70729',
                          '86951','45092','11329','65539','79020',
                          '90569','22549','22837','27419','77616',
                          '15615','95587','64746','42650','86418',
                          '17829','19658','46559','90707','23740',
                          '17140','83425','87505','48529','56942',
                          '33081','84233','19652','11849','61780',
                          '50272','20120','25636','71304','84209',
                          '68838','21908','26539','92704','45964',
                          '21263','45320','77512','25661','56557',
                          '27127','85138','87368','26584','26441',
                          '36157','18693','73444','33330','68459',
                          '47238','25026','74698','84650','64997',
                          '43344','48447','71869','32248','75619',
                          '47566','41919','28457','77922','81745',
                          '78475','61827','23994','53275','86027',
                          '57076','75896','32748','26636','62837',
                          '47672','86303','53331','37433','57449',
                          '37144','79240','98343','67157')
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

