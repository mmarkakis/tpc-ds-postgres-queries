
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
                          '48718','67800','71577','49026','31345','65378',
                          '87525','72959','48414','53513','45730',
                          '81995','74201','49082','22795','32686',
                          '84911','41797','50965','23430','27167',
                          '46814','27683','55276','88308','77092',
                          '90494','31839','96502','49906','95287',
                          '96663','44413','51728','33588','42221',
                          '62581','46510','18993','88413','45314',
                          '27134','95276','56118','53858','88653',
                          '75320','67833','88563','24033','41528',
                          '58763','59028','79319','61575','19928',
                          '31266','89369','13420','11872','25709',
                          '44319','83798','22197','34451','72592',
                          '49650','65576','18398','51849','28810',
                          '17204','81768','89651','56078','85243',
                          '40551','33752','81175','47583','85468',
                          '96193','71946','91274','19526','87671',
                          '25739','80596','51626','31765','92130',
                          '30975','73212','36749','11440','10600',
                          '37498','61007','68947','31413','28209',
                          '99021','94950','58709','44193','25063',
                          '35101','88382','58882','58994','17554',
                          '71864','39649','45165','56723','93514',
                          '47077','43417','26018','99274','72992',
                          '71927','31906','73301','11946','93644',
                          '13718','19122','89394','39837','56740',
                          '82999','79688','68860','93983','57338',
                          '41517','80019','52932','84138','32481',
                          '92635','40020','63614','31334','12479',
                          '94129','52163','41721','69594','21234',
                          '90258','81055','81985','56832','71507',
                          '32062','96030','48922','49785','18148',
                          '31762','67616','32254','98810','56742',
                          '77252','11574','97164','83967','57128',
                          '12230','67299','18978','52457','27477',
                          '62021','94202','27269','21481','26844',
                          '35439','34995','33153','20409','92143',
                          '40282','33647','94320','40435','49892',
                          '77959','94999','92901','44297','75023',
                          '76208','69784','57272','41265','83014',
                          '57963','14805','66338','52710','58169',
                          '47304','11081','98959','16337','37169',
                          '13692','20848','50574','49725','44645',
                          '47806','90814','17278','54283','86890',
                          '10570','20958','12151','89709','89740',
                          '99461','37374','20218','57578','96006',
                          '58525','59553','57291','60269','94238',
                          '93815','68239','56787','99222','47473',
                          '77546','88096','92417','52846','38774',
                          '48792','86105','67521','78860','35391',
                          '21685','93899','38994','76251','23802',
                          '49966','75139','87874','20142','57262',
                          '82520','24328','81774','63257','46145',
                          '65626','66153','29039','19429','76800',
                          '62816','86002','83466','20703','78665',
                          '56388','87058','97007','38168','44045',
                          '96449','17277','98180','58932','23999',
                          '94403','41327','22384','66980','56584',
                          '36868','51092','92873','10707','94826',
                          '37359','44793','79200','93375','53210',
                          '30357','63801','23613','68693','32367',
                          '29729','42436','51904','69796','38822',
                          '70868','96490','46225','83444','40691',
                          '54338','44280','20167','53374','62883',
                          '21667','60313','24657','41522','32953',
                          '11355','53765','69213','72770','22841',
                          '69139','38355','90353','28345','34815',
                          '96453','74978','65058','46759','94509',
                          '57689','62899','83735','22338','58006',
                          '42375','30708','56843','89523','79262',
                          '55153','50780','25385','47046','63078',
                          '63825','91468','14138','14236','23541',
                          '16019','88009','81418','90193','69431',
                          '27050','33736','41298','87428','81823',
                          '65491','69702','94058','94123','82734',
                          '20116','18653','22012','97491','86401',
                          '15554','61983','33733','23544','71099',
                          '29320','53350','37095','93403','39610',
                          '24527','69478','70304','10902','16640',
                          '17472','32898','60710','80478')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


