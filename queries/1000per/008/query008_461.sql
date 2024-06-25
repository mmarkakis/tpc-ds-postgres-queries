
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
                          '16497','90452','80013','94171','25657','45318',
                          '75050','49393','19933','92222','91202',
                          '83392','79857','85622','50900','85526',
                          '78344','42742','67450','47714','78295',
                          '99148','25784','36018','25292','88852',
                          '72109','41409','14179','46486','56030',
                          '51864','16238','21656','79395','22256',
                          '99643','27478','88874','31079','44030',
                          '60328','32148','49315','36742','27382',
                          '80745','32465','43134','95494','87780',
                          '96603','18084','66149','20871','31584',
                          '19351','56325','86654','50146','23870',
                          '41305','47732','20312','75389','55068',
                          '98566','45700','45038','72418','97045',
                          '76935','30681','50067','15241','17739',
                          '14451','37275','38692','24891','24633',
                          '76408','68706','16120','16188','28487',
                          '99596','13901','46652','49136','45870',
                          '59707','65561','79877','41520','87343',
                          '33071','66776','59956','50857','41458',
                          '20876','19069','86149','41328','93391',
                          '57578','75425','46881','67147','65949',
                          '22797','23079','25909','44434','10063',
                          '56020','21025','70932','10395','24130',
                          '13316','88410','10441','79240','13141',
                          '43502','20073','71926','52357','59686',
                          '92094','33496','96621','86664','33483',
                          '24052','78453','91903','84120','76186',
                          '96566','67382','80854','96250','69916',
                          '13383','88612','54983','26836','54862',
                          '56533','84957','54653','89029','39589',
                          '64298','69923','82608','99522','50616',
                          '55214','47491','11995','88380','49493',
                          '15225','33843','13759','46929','79559',
                          '78378','83562','21220','37550','45125',
                          '63621','44744','94158','73853','54504',
                          '82885','89551','35126','54406','24875',
                          '79529','72662','87348','51929','87186',
                          '62660','29671','66434','89388','91961',
                          '65677','58049','44386','58541','18311',
                          '77989','30846','76909','27398','96174',
                          '92174','48008','46270','40630','70626',
                          '62163','59308','43946','74922','94071',
                          '65444','26826','84309','84652','49401',
                          '74307','41820','54699','64352','13923',
                          '39431','65093','84655','49166','36432',
                          '40996','41106','21514','17015','66811',
                          '29998','22640','10254','24547','12803',
                          '68541','28346','81085','80316','42604',
                          '17172','84776','53650','29016','76379',
                          '88252','15938','21270','12745','96697',
                          '91547','19912','64094','50046','57845',
                          '60255','30358','35854','65171','72767',
                          '99204','34840','75781','53976','34759',
                          '93243','58139','43302','79875','62366',
                          '85037','87389','79895','10272','94642',
                          '74348','62036','87140','46148','74272',
                          '80949','74508','59275','72167','94351',
                          '75465','85039','42836','53125','78464',
                          '73375','38624','97749','64591','13833',
                          '29355','31693','62464','35189','36723',
                          '68995','89294','75859','98077','89238',
                          '78491','70843','50137','33974','60179',
                          '33791','17066','93666','37972','10264',
                          '31741','95400','64770','70821','86547',
                          '43006','42749','46768','67091','11293',
                          '58361','88759','32398','82829','26093',
                          '92694','31732','96857','96406','81268',
                          '35008','79153','44138','17596','98421',
                          '65151','81154','79114','61097','88831',
                          '20274','75164','32624','78538','65220',
                          '35785','66018','63363','70630','91308',
                          '64704','86309','29099','55170','39643',
                          '82719','88339','50177','68257','48638',
                          '53734','58066','51752','24295','65626',
                          '73543','82026','47905','85090','32865',
                          '57349','42784','99839','39895','76230',
                          '21632','56043','19397','26548','46681',
                          '75854','58250','31878','91377','58337',
                          '76761','82271','96600','65468')
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


