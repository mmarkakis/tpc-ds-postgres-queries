
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
                          '18925','81404','34342','21679','39284','10230',
                          '72075','66882','65211','31516','81134',
                          '45789','99923','67787','49566','98497',
                          '55955','81735','36493','42796','14080',
                          '17902','16194','74145','71367','52288',
                          '41441','94077','65334','21962','40118',
                          '17278','21760','23313','77715','51635',
                          '55305','94800','86932','67691','91269',
                          '23644','63954','22621','63059','60476',
                          '76263','44841','52565','11204','87765',
                          '55920','65338','60415','94176','64535',
                          '87999','10131','79641','81416','45151',
                          '21368','79240','10858','50447','40010',
                          '81462','41248','41212','77203','73876',
                          '66508','14192','71246','20666','31350',
                          '56961','94333','44389','40991','39627',
                          '54755','27761','29611','84246','12603',
                          '73180','94495','80936','11886','27091',
                          '87398','64938','69737','83155','15537',
                          '23661','39242','55645','94155','53045',
                          '51054','94539','77854','17156','39516',
                          '29145','12746','37133','88813','15690',
                          '65075','57525','36917','42644','31376',
                          '22469','50481','40593','95036','26985',
                          '62323','26419','36388','96085','21251',
                          '38316','45859','33688','72665','12835',
                          '80120','72683','90849','51391','23478',
                          '36687','96579','90736','87556','68059',
                          '79056','49185','80937','82322','66662',
                          '79769','30426','58846','85090','50993',
                          '48047','23059','62659','78077','43161',
                          '20841','88977','50987','25428','18439',
                          '63125','13045','35640','88091','17760',
                          '94478','30739','49230','36827','33996',
                          '69655','32361','59796','15977','63633',
                          '44678','10915','82035','71891','41077',
                          '24375','95653','83725','48815','21353',
                          '10866','90507','51040','55049','46884',
                          '53289','61125','91097','82484','28854',
                          '14443','55489','75723','82473','89941',
                          '90257','29803','65470','59624','83688',
                          '37650','97547','27925','55500','33832',
                          '61112','57280','50363','30668','48344',
                          '64370','89094','42649','65766','81743',
                          '72857','26891','16920','33303','52116',
                          '38698','36405','30185','92993','59845',
                          '98649','82417','73319','47400','50373',
                          '65491','30068','20014','86988','74586',
                          '82592','68458','61038','83346','57269',
                          '86850','81939','21092','20284','75876',
                          '28334','64355','56520','43197','58280',
                          '42628','88257','43671','91878','37479',
                          '64688','46281','35649','40530','95208',
                          '76145','61211','69679','66425','91522',
                          '92598','50425','99450','44658','49849',
                          '72208','56433','18415','88162','86588',
                          '10508','90897','75175','84252','15985',
                          '11836','95713','74305','39784','68435',
                          '35758','89806','75110','18427','43804',
                          '65191','31453','59518','23705','75366',
                          '67861','94323','83908','27197','68681',
                          '33478','90651','66970','45120','97405',
                          '79111','65121','11180','96730','57169',
                          '83701','11302','28684','60705','52484',
                          '85780','34414','21599','26643','96417',
                          '69882','53404','44584','82419','27946',
                          '35113','69990','82505','60906','35268',
                          '43813','50244','30253','88298','52799',
                          '47548','77060','88202','58915','40760',
                          '61440','95507','12628','85204','93190',
                          '74700','75997','35831','93926','57594',
                          '83571','39013','10607','69792','25098',
                          '63666','19719','55951','18538','85362',
                          '72693','77645','45747','93318','49916',
                          '68983','34592','82004','22302','51237',
                          '91562','12149','86516','46422','77798',
                          '90098','64285','19067','90871','97305',
                          '96940','67709','17665','25439','18105',
                          '90929','28533','70397','13149','57913',
                          '72300','16312','72882','74356')
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
  and d_qoy = 1 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


