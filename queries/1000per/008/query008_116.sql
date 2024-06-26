
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
                          '27225','25256','49369','42891','60963','19155',
                          '66481','69321','49578','53673','82254',
                          '40722','47675','20329','57801','26012',
                          '16970','49363','65322','39044','55916',
                          '27119','76919','65156','55544','98874',
                          '99633','34520','95933','51635','76615',
                          '35313','27579','91310','69433','34039',
                          '96483','26234','21502','62168','72291',
                          '42275','98895','26903','28275','89808',
                          '62630','32418','80691','24265','55197',
                          '66134','86181','14631','96709','23591',
                          '95437','46417','27653','37164','89158',
                          '51555','14361','69468','55513','40701',
                          '59620','69695','33931','31719','13595',
                          '13746','20913','61703','76896','68835',
                          '25658','38053','10157','75937','34738',
                          '25584','50064','23631','71418','66187',
                          '29372','17214','29713','44515','84393',
                          '88951','82392','62112','64413','63802',
                          '73084','19925','41281','92070','96067',
                          '21586','37596','97719','53607','51462',
                          '71030','11655','20640','91412','76729',
                          '46913','49890','94046','37693','95927',
                          '89943','91583','48681','44308','27983',
                          '44970','63936','53724','76503','39660',
                          '19555','50834','38949','75773','89519',
                          '22451','69539','83849','42173','82425',
                          '99562','32352','93610','26907','24489',
                          '80712','25311','17959','23079','34525',
                          '34094','26020','57405','53570','10657',
                          '32044','11261','95990','30169','94199',
                          '20547','89081','11680','24360','23135',
                          '83444','70362','21058','20127','34816',
                          '12192','62419','13395','10618','72868',
                          '79601','13825','96404','92004','52899',
                          '10795','55842','90239','69297','85402',
                          '27028','50607','81323','57991','83329',
                          '98016','94256','55066','41026','24628',
                          '47860','99691','98119','96620','71413',
                          '96023','89959','30305','67407','93427',
                          '52650','29342','98241','59614','32249',
                          '48187','11272','51403','59392','31629',
                          '26379','21702','73421','99099','27506',
                          '91247','83284','60062','58105','79917',
                          '28862','62351','86224','96368','84906',
                          '91548','17484','24024','30445','93716',
                          '90225','73643','27958','37781','30170',
                          '65043','22236','49906','97686','28847',
                          '74138','40479','64245','16889','69149',
                          '95803','89790','80114','49695','27607',
                          '93751','94020','89815','66350','25112',
                          '79750','87405','66762','24307','14281',
                          '59284','22115','68899','61730','18609',
                          '24585','84808','16196','37306','72879',
                          '98655','65936','24554','35667','98075',
                          '22079','81156','78790','34248','90906',
                          '57784','89579','24884','84898','75477',
                          '21286','12995','69060','65537','10965',
                          '24319','89331','70998','32221','11208',
                          '58401','97050','58980','35532','28842',
                          '35808','36525','49920','64446','81145',
                          '29732','15219','39440','64135','60899',
                          '72663','81007','73637','54487','29161',
                          '80930','29039','18034','94944','88254',
                          '74557','13511','10482','54500','60864',
                          '59769','95890','87506','34015','98083',
                          '16986','41907','54979','85685','10358',
                          '23520','89300','78581','82670','63218',
                          '32127','35744','82364','48210','40419',
                          '66300','33276','88460','44025','63684',
                          '96160','30659','78207','79125','56163',
                          '83257','69325','35189','87703','42243',
                          '75301','95165','59876','85214','53180',
                          '81209','37840','58815','24662','24904',
                          '71555','16194','41198','45874','71884',
                          '41346','13717','12153','17754','72770',
                          '95264','81267','97846','64367','55845',
                          '93776','65457','79011','11009','28977',
                          '59730','27158','23552','94529','57956',
                          '92923','94992','95930','51505')
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


