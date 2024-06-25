
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
                          '86377','64927','68246','49123','61312','14516',
                          '81833','43877','68250','51952','30823',
                          '72987','51033','59579','65948','84794',
                          '23913','57321','39408','36740','80556',
                          '65884','49204','71317','53997','53571',
                          '57031','65469','50945','22973','96579',
                          '30199','19859','14212','56890','98040',
                          '63286','28043','53005','17583','56301',
                          '60445','15252','32392','26166','84597',
                          '84833','71030','23830','24162','27665',
                          '72512','79919','38738','92553','31873',
                          '88552','14553','50009','14952','42351',
                          '90377','36680','98128','39288','33831',
                          '16618','20926','41074','51500','10584',
                          '67439','51002','85535','55247','21568',
                          '96851','11847','20644','55493','87573',
                          '99550','41848','76815','46388','16862',
                          '18335','67555','68035','61417','19158',
                          '39561','79035','64090','44399','10677',
                          '92499','41005','46063','91898','24567',
                          '49941','35076','91518','89691','46720',
                          '51313','97493','35290','70545','56791',
                          '35101','99490','25613','55054','63737',
                          '92267','76161','29242','64909','88888',
                          '65843','44042','93944','76020','96291',
                          '24700','59518','40198','35028','71710',
                          '51228','49992','94258','53351','88074',
                          '85132','35255','33518','75748','68361',
                          '29046','58800','66486','28547','46857',
                          '71045','83480','51596','75429','80061',
                          '48441','55106','85543','57598','67486',
                          '21094','41638','75747','63786','62414',
                          '14328','94540','23482','41889','37523',
                          '15514','79898','18890','79786','15397',
                          '76997','67594','50747','51696','50223',
                          '50588','95083','50639','97138','55651',
                          '34333','49399','71085','93152','28908',
                          '86634','33177','11658','20056','27534',
                          '29598','17936','52916','44242','41499',
                          '84202','31910','75131','31907','57187',
                          '43479','58533','94159','69988','87254',
                          '64681','15104','59200','47798','36650',
                          '68471','95247','34543','20086','69277',
                          '82844','90550','26710','97363','83759',
                          '25821','86970','28776','71696','39312',
                          '63515','19421','91596','40521','14706',
                          '73278','74211','52211','65147','39264',
                          '11749','12654','30940','47210','79072',
                          '77848','98942','51828','42907','34963',
                          '34790','99518','82390','10055','51514',
                          '45001','42720','99091','75966','97136',
                          '46381','91442','14229','53557','47490',
                          '73608','39003','81616','11898','14748',
                          '34499','64461','45564','30674','37135',
                          '24308','32022','53217','70936','74842',
                          '33058','85134','10470','43109','70227',
                          '60170','80129','92961','97640','17728',
                          '45755','24985','89366','45991','88908',
                          '70363','95767','39033','23622','77674',
                          '50178','85615','64964','92069','30631',
                          '86189','58840','40444','39817','22580',
                          '27898','37184','68131','58928','38818',
                          '71361','13108','29116','25780','11516',
                          '31236','73414','66430','13234','26302',
                          '28122','44907','85914','70037','80531',
                          '25678','22946','49884','19167','20389',
                          '52718','21667','53071','22775','64322',
                          '73933','10257','60821','76016','88139',
                          '46394','58028','72989','45770','10550',
                          '61086','49761','80706','49893','29015',
                          '33155','16217','23438','22444','15941',
                          '19213','99379','60230','30712','34123',
                          '66612','64984','94626','28626','21513',
                          '24282','99837','13705','43561','68368',
                          '99944','61094','20558','80416','14300',
                          '83375','78892','25247','10048','69021',
                          '57769','71172','75976','45619','98255',
                          '62658','13880','39422','87800','27805',
                          '66685','74436','55555','65612','67708',
                          '12745','65624','23519','29119')
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


