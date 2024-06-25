
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
                          '58744','41373','20677','18760','91731','89806',
                          '33531','42588','14500','46448','15815',
                          '85516','76258','52315','56824','16740',
                          '35432','58636','51502','64501','33415',
                          '69187','52673','67093','10942','38029',
                          '43997','86602','16338','81515','73931',
                          '89626','17592','83167','80025','20380',
                          '76926','14503','13887','68945','32675',
                          '62819','11253','11560','91657','12974',
                          '29128','85749','38717','57256','88531',
                          '76792','38903','25048','76749','71863',
                          '50755','60005','27961','57044','51690',
                          '75494','62868','33181','41191','27970',
                          '10962','50907','23847','51242','99393',
                          '82404','94210','30012','46698','65925',
                          '74902','73528','34228','20267','89387',
                          '88968','48509','78961','95587','57650',
                          '86364','42800','80086','79170','52898',
                          '47095','56797','75953','12164','54960',
                          '31045','33851','13858','77963','35336',
                          '91733','77424','41882','95831','79118',
                          '79293','57213','52042','57383','52608',
                          '87846','94097','82737','49060','77280',
                          '66904','55783','56418','22408','18301',
                          '85444','74447','40520','59072','99675',
                          '95790','63234','74784','87213','46313',
                          '73799','67600','82168','23566','42630',
                          '10963','33443','13852','30479','99182',
                          '85615','99577','39862','47671','40414',
                          '52382','13199','77088','33572','84537',
                          '38075','92329','40273','88032','67934',
                          '22041','29000','75924','19674','96103',
                          '86407','41939','98152','44027','42795',
                          '54503','64552','61744','64832','96315',
                          '76897','98393','49212','13186','31145',
                          '24226','37545','97871','87845','31395',
                          '41462','84182','88269','42030','91415',
                          '83895','30305','35134','88468','24800',
                          '27911','33289','78656','42467','99634',
                          '75961','94597','65199','30037','25945',
                          '92025','40449','55583','74313','10019',
                          '23317','38098','52174','45600','69881',
                          '66047','96933','65197','30554','65220',
                          '92651','99715','57066','82895','90352',
                          '26437','76507','72145','10430','66532',
                          '23352','50891','23396','40907','27589',
                          '45310','84206','67233','89540','84998',
                          '95671','51245','47749','62084','69175',
                          '27984','19231','94763','79420','13010',
                          '97494','42349','48581','17567','63022',
                          '78664','55988','72765','23142','78306',
                          '99989','31241','20711','94599','63774',
                          '84884','73572','46893','28243','85742',
                          '35376','21879','59226','21995','44857',
                          '30971','34904','31486','85575','21953',
                          '63186','39699','27293','55839','32570',
                          '63151','51390','11856','26949','55831',
                          '28239','51687','27126','96736','53647',
                          '64481','90207','14190','33199','10625',
                          '89657','75519','40741','54754','94106',
                          '61085','45821','78590','73029','68411',
                          '11885','59937','13132','99650','85706',
                          '88457','75214','24574','70627','13310',
                          '39672','93032','57452','23009','81831',
                          '21383','75625','75211','86476','61571',
                          '99313','38409','36987','74696','66140',
                          '45933','46494','31647','22143','49488',
                          '70374','60698','88315','86341','62696',
                          '67562','13871','20623','27833','23321',
                          '53691','32062','68856','79475','79273',
                          '32721','76755','17948','95618','86361',
                          '68923','15618','96141','98843','70324',
                          '95740','62040','87377','70433','70685',
                          '33990','30268','16597','61114','54317',
                          '87453','93511','29505','85472','65003',
                          '22000','61187','61536','13535','48882',
                          '30969','16947','18580','20800','87157',
                          '69347','87934','44138','67225','30451',
                          '66524','88441','56332','53969','13626',
                          '53585','44859','95254','18855')
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

