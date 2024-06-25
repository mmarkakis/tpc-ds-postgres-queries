
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
                          '71847','92237','58073','79504','45606','84270',
                          '11264','19196','96946','31281','40882',
                          '23780','86735','41298','99637','94400',
                          '91952','71101','13262','66612','52307',
                          '42135','23729','75608','19710','46161',
                          '64706','51971','79652','80301','50328',
                          '66317','25772','57683','51265','28797',
                          '67220','83496','41405','33616','72746',
                          '61354','96742','52601','93432','34243',
                          '84035','84779','84799','67043','64175',
                          '71016','53834','51841','21135','71713',
                          '82493','49603','57412','45058','57608',
                          '93369','11890','14141','94015','58176',
                          '98550','47133','69164','91470','72494',
                          '43730','14056','94082','57318','54683',
                          '90508','32125','80639','41642','92983',
                          '12357','28000','35716','27287','48924',
                          '46914','73518','94385','45262','21799',
                          '78637','94415','69742','55276','26395',
                          '18659','97298','52556','33003','17261',
                          '40180','58083','10891','49965','77908',
                          '92488','51157','84785','16847','83604',
                          '11777','46341','87544','19509','50679',
                          '25465','20702','51077','79408','41265',
                          '15611','83219','48429','55128','30141',
                          '20177','67140','14368','33055','82106',
                          '52039','52902','10504','86061','52823',
                          '71274','82910','38508','11493','64402',
                          '88022','51378','29732','96208','69923',
                          '99492','25998','80087','94772','66984',
                          '78128','22251','42369','11541','38729',
                          '74763','37593','37400','28447','30177',
                          '98793','94856','26057','32135','53793',
                          '72916','49374','17696','62935','74894',
                          '81170','45154','24872','18967','67267',
                          '44348','48141','61635','76308','16252',
                          '49921','22723','54083','20926','61523',
                          '49988','40465','84786','22739','94368',
                          '72427','54892','52985','25194','85083',
                          '24060','97439','43055','28329','53299',
                          '32843','26010','88940','39125','34785',
                          '62309','36957','77673','66026','60333',
                          '89135','93172','40756','94680','77767',
                          '74354','69129','79202','34903','51914',
                          '72811','70249','60707','49202','72866',
                          '15114','67407','93448','87731','69398',
                          '10423','66028','99898','89026','98728',
                          '36626','87336','89635','24972','22731',
                          '38781','66217','29267','84455','28043',
                          '50005','85523','89410','21867','49267',
                          '56905','75798','85670','31163','96270',
                          '71579','48839','66266','43078','49170',
                          '55619','30267','71215','12798','14736',
                          '28419','90128','59983','98370','64430',
                          '83554','32616','18720','59268','48004',
                          '29857','18413','66896','25587','28872',
                          '10104','42927','14101','62684','11053',
                          '69473','85667','40720','74595','59416',
                          '75617','63738','28643','12930','80743',
                          '84434','71118','82150','33661','13107',
                          '87844','59508','46147','24808','56242',
                          '59308','92092','45686','98486','76274',
                          '66359','90348','78065','77480','72972',
                          '36212','42968','73356','71625','47747',
                          '84837','88746','82063','50881','84086',
                          '87123','17534','94225','38783','45207',
                          '31161','13675','70771','14551','72206',
                          '77699','48145','18555','96067','11727',
                          '32342','57096','50010','54109','62211',
                          '26848','55757','96735','34717','43349',
                          '80374','81725','44546','38651','70039',
                          '42476','65506','67781','38132','54856',
                          '33771','60259','45927','14211','46730',
                          '71109','39918','85619','77814','96770',
                          '50090','72033','51578','91542','15949',
                          '79146','91939','24764','65310','18362',
                          '17585','10162','20085','56616','73271',
                          '93929','89447','38945','88856','88044',
                          '79859','14476','58410','97871','26652',
                          '40586','56453','98172','55302')
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


