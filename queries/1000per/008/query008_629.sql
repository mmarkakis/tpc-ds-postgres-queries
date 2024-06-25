
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
                          '73305','89051','91076','15826','64032','66715',
                          '46384','61441','85992','95025','61333',
                          '83303','14489','20778','59658','80790',
                          '20115','51295','11841','55718','91119',
                          '36617','57466','17503','91431','91555',
                          '29904','41582','83528','68078','17912',
                          '59850','62028','97265','81070','53214',
                          '15378','27071','57637','73020','64162',
                          '83135','90693','71471','88697','19197',
                          '30965','63737','87082','94140','99872',
                          '68431','52966','43807','16901','98974',
                          '22427','27385','45483','47606','87533',
                          '59428','69931','64055','47490','21476',
                          '94161','31516','89165','83695','66677',
                          '19854','69863','21680','95871','15652',
                          '20241','83658','94927','79148','34171',
                          '98377','64592','24380','56221','30741',
                          '30238','54405','16884','61416','30199',
                          '59175','37139','92062','27351','74617',
                          '84283','43747','15949','21582','59728',
                          '53695','91428','48715','64994','67683',
                          '77896','92230','96527','85051','49678',
                          '89541','71476','11302','51329','78729',
                          '24502','17225','79779','46496','87699',
                          '11182','21904','53306','23499','36280',
                          '17623','55273','84276','80213','65417',
                          '56667','99814','66013','12189','44647',
                          '24891','85029','13469','24466','75534',
                          '89164','95512','22402','54932','80536',
                          '56854','56674','58958','60269','15842',
                          '45677','76540','26587','77244','35561',
                          '27738','68173','79182','13738','97574',
                          '27343','16824','68257','10302','50116',
                          '63964','69263','55340','75728','45403',
                          '31992','76192','64331','51424','25489',
                          '45127','97818','16599','59757','38326',
                          '83085','13033','66500','63460','15121',
                          '71903','57173','37193','56290','55888',
                          '43847','73937','41584','86313','74067',
                          '93491','35651','78772','37390','64749',
                          '18023','38741','29447','31442','70688',
                          '27811','58753','48388','78651','69304',
                          '26553','60030','64051','20647','32685',
                          '88851','86922','64150','95320','39369',
                          '29873','93821','78467','82514','85747',
                          '85610','33810','33756','65899','19029',
                          '45493','89386','19364','99386','80313',
                          '41093','99536','91683','26732','54197',
                          '16322','29054','59914','81337','96957',
                          '26726','90257','59798','23071','38707',
                          '55530','38296','23915','91501','55303',
                          '92403','46232','92260','98941','89370',
                          '94482','51192','71473','25551','55652',
                          '32814','58694','28701','27470','39946',
                          '51688','78856','16090','12077','56872',
                          '90049','95399','85103','32824','87432',
                          '19193','44028','40057','61660','21851',
                          '38004','63360','67638','32073','97998',
                          '66896','37507','10278','76895','46800',
                          '80226','69560','90140','56323','92664',
                          '35520','39331','34258','41684','32281',
                          '24863','29084','54305','76784','67506',
                          '91542','66926','37097','41850','68488',
                          '54401','18239','94520','52345','99904',
                          '89490','32826','90267','57181','94059',
                          '18032','88730','82973','23631','94985',
                          '77837','35075','51439','82490','84885',
                          '96829','10873','72303','25166','43977',
                          '49994','41021','70834','75080','77586',
                          '27048','29165','77013','20694','17409',
                          '58501','68201','23134','89749','90858',
                          '93133','87132','34683','48820','51911',
                          '78029','55246','42711','18574','28183',
                          '63633','66721','11261','65445','40326',
                          '12232','38917','22438','32466','67082',
                          '53365','93435','12168','66938','33905',
                          '98861','57686','71601','57450','78624',
                          '26120','15342','24713','24325','32004',
                          '54112','99888','68141','13071','85471',
                          '80562','28636','96277','48558')
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

