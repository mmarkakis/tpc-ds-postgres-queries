
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
                          '33945','18795','70257','98882','21406','32638',
                          '18091','58413','40721','50637','97390',
                          '68216','50002','89287','99392','82376',
                          '62588','16783','76159','40853','50471',
                          '67091','49253','76038','78638','94256',
                          '42673','28278','93270','57829','77829',
                          '91577','49772','90306','81816','54080',
                          '23245','55285','90246','42932','97837',
                          '89596','99176','13914','23186','89292',
                          '25586','42111','39987','32064','24843',
                          '32033','80588','48911','71370','57446',
                          '93782','66942','16112','34134','18715',
                          '79111','71207','90334','53706','57068',
                          '65999','37280','64603','83945','33562',
                          '94436','99462','27549','12662','15551',
                          '25571','45730','54344','47244','87295',
                          '22226','76208','33425','73598','74087',
                          '63052','41437','32077','43167','13786',
                          '41505','17217','74238','53801','63764',
                          '16895','17076','60185','57234','56775',
                          '47113','68150','42756','39960','13134',
                          '64464','68462','67204','52932','27113',
                          '82502','75406','20116','71179','22771',
                          '45434','82372','38555','80961','33785',
                          '88720','46868','90132','20162','79992',
                          '81130','62525','99834','71798','43306',
                          '26744','57639','37624','74979','23342',
                          '73871','56624','92214','71092','37763',
                          '58878','87668','84268','59835','91680',
                          '99959','85226','32323','86775','24636',
                          '19806','16051','73011','78496','41315',
                          '29862','82464','24689','72210','70119',
                          '14778','91239','68200','18280','74850',
                          '74924','32276','17831','53686','55137',
                          '49143','70822','94535','59719','83419',
                          '28200','84117','23946','62535','54262',
                          '91896','48255','37074','47689','13848',
                          '62191','40414','85191','58754','84935',
                          '24337','46702','29326','16094','89010',
                          '96831','37356','12395','73848','90621',
                          '84201','85321','27986','75457','81071',
                          '31221','95438','33721','82892','28183',
                          '19344','50204','21195','53637','19116',
                          '85358','49705','13301','31303','35532',
                          '34470','25661','89963','74306','17244',
                          '19636','39172','38947','95381','57311',
                          '13728','94251','80375','48112','35743',
                          '35027','67775','58888','67365','83035',
                          '98936','27237','25362','19033','30967',
                          '47504','26032','63576','95555','34542',
                          '79796','27276','59082','90118','11301',
                          '15861','67574','30317','65505','16287',
                          '43286','89747','47437','93246','64181',
                          '87739','34628','39228','34572','89901',
                          '46087','37399','66645','92280','53105',
                          '83501','79178','32986','15767','43367',
                          '80269','57906','39312','14847','38286',
                          '12834','55230','99068','63485','59351',
                          '55101','24284','64430','13684','95581',
                          '84438','28206','51767','33215','96262',
                          '12761','85460','50144','56542','72104',
                          '25012','99257','33045','64667','99933',
                          '19559','96965','93772','25311','42103',
                          '85700','18364','86441','11256','48706',
                          '23260','41203','70150','29221','79790',
                          '44046','41925','38594','38413','21462',
                          '78432','48033','18256','86102','20441',
                          '41780','31035','43429','30755','88263',
                          '70536','12623','90578','38917','94678',
                          '40478','48867','59769','35313','66642',
                          '45064','56696','98452','52630','42032',
                          '82036','32809','29474','31711','28921',
                          '26697','46303','75086','47963','13203',
                          '59734','92729','47168','16599','85287',
                          '83045','72922','75104','94882','82016',
                          '60363','30425','25963','73489','51024',
                          '92892','64142','47544','85084','67250',
                          '74428','24171','20425','30963','26876',
                          '71739','68604','24796','64243','51708',
                          '25800','77348','96022','17692')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


