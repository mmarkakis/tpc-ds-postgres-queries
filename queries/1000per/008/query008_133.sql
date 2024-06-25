
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
                          '67464','51318','55699','32904','62865','31965',
                          '99231','95098','97981','26579','57563',
                          '14589','77239','91461','15322','86912',
                          '38271','44703','31321','93756','88995',
                          '23546','86185','98557','26394','27390',
                          '99163','87590','78339','18869','89753',
                          '64100','12756','38852','39570','91750',
                          '56723','35097','30267','21556','60750',
                          '91220','62480','88183','83059','69156',
                          '89501','36170','29737','58402','68952',
                          '26293','89517','40973','68683','77019',
                          '54714','65966','38399','87400','94626',
                          '33195','29250','21226','46817','18923',
                          '53702','24260','31305','31294','90365',
                          '27083','37434','61551','43933','43509',
                          '26705','42901','37356','57003','58371',
                          '83681','18641','77262','32100','13819',
                          '41936','98440','60027','34802','21347',
                          '64085','70810','65752','98805','54452',
                          '27717','74767','90463','92440','48143',
                          '36377','18670','50154','19108','99575',
                          '80868','40097','27492','50065','46039',
                          '62936','80447','49004','31281','68598',
                          '17920','15723','55167','85314','91123',
                          '94032','58513','21903','14185','89695',
                          '16125','96724','92436','49918','60553',
                          '10501','35722','89606','24909','53954',
                          '89139','35434','83536','59134','84534',
                          '56871','89047','36440','77685','22382',
                          '35864','10767','80336','15849','58436',
                          '52956','72834','63978','13717','59796',
                          '35063','93048','47712','75855','43615',
                          '14198','98447','80614','21571','65492',
                          '55239','84321','32736','92329','38011',
                          '48267','90554','44665','37735','26994',
                          '85589','93798','34104','36905','44821',
                          '26983','27187','93658','99304','31803',
                          '42573','11852','29683','25844','15644',
                          '96910','83752','85344','27815','24564',
                          '86326','18431','11987','80626','11240',
                          '25276','34893','31852','71070','30867',
                          '83459','38837','98691','46241','71594',
                          '27001','68743','93463','80773','77167',
                          '89150','99471','11504','62733','71661',
                          '54654','43339','34263','28228','14847',
                          '80075','75705','47292','78036','28842',
                          '80942','18993','62866','28516','27161',
                          '40929','43668','45314','74931','21867',
                          '83898','34258','41627','51945','55412',
                          '38712','90165','79424','14601','35764',
                          '46126','58297','70895','13398','65215',
                          '40876','58585','39853','37982','90320',
                          '45398','35077','85708','79100','75164',
                          '34567','81128','89417','58856','64094',
                          '23987','44700','70488','59819','72430',
                          '97404','89586','59290','50631','19639',
                          '40701','50110','28952','55320','36352',
                          '55243','87309','22132','15956','91516',
                          '70068','53656','75413','24667','37164',
                          '90761','84099','45267','45611','47918',
                          '96922','28519','23613','26841','29635',
                          '52083','58778','55984','57901','17814',
                          '44946','74153','10645','90195','72325',
                          '46660','66132','29135','99260','85467',
                          '24758','62248','56098','99369','40083',
                          '58214','95059','79050','22113','78271',
                          '18360','22963','46480','64403','96853',
                          '58759','41741','14166','65818','71494',
                          '35261','81303','64258','12636','57883',
                          '55886','14756','92885','59616','73559',
                          '50389','18002','37034','42135','48409',
                          '38903','47625','76822','98375','90309',
                          '41280','32713','25421','25162','76112',
                          '40078','16481','99843','47866','55127',
                          '88497','96091','14728','44556','26064',
                          '38936','85720','77516','42957','63574',
                          '89156','93831','60102','48613','53839',
                          '95484','60181','47509','17174','95677',
                          '62772','38586','86882','32534','46792',
                          '51019','84160','99179','56184')
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

