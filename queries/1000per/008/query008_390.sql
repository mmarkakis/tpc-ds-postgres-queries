
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
                          '83455','72775','85380','31099','69778','75489',
                          '90203','78995','86803','22517','75929',
                          '57757','82852','42256','55233','28587',
                          '75919','82996','90445','75766','40564',
                          '78004','91657','74969','10115','93153',
                          '95807','87883','91932','78164','34389',
                          '49710','24287','85348','78553','11716',
                          '36018','65425','73522','67707','75592',
                          '22249','93544','97263','98119','75980',
                          '43803','21580','67759','16005','96451',
                          '23777','17901','39577','39982','70999',
                          '73547','52170','32765','62315','27868',
                          '70149','44542','69560','52095','40617',
                          '45896','66073','56506','16537','73040',
                          '58666','39941','25092','78290','89404',
                          '87396','64261','74706','83272','33683',
                          '19793','75171','49675','81708','13120',
                          '39745','80103','13888','17255','97455',
                          '98157','46487','42034','50860','93652',
                          '54701','42462','16937','67359','77474',
                          '15261','71650','59571','10537','70110',
                          '47593','47894','37776','66161','19901',
                          '76133','44700','94693','25171','73190',
                          '52901','77583','93650','94059','72027',
                          '51623','71282','63730','28170','44429',
                          '21141','34695','44478','20436','85865',
                          '29794','72281','72590','81889','12409',
                          '42455','69308','54676','19794','54249',
                          '26820','15525','83208','38473','14593',
                          '64776','60008','47947','88159','84487',
                          '62659','56051','54723','13772','55253',
                          '76773','85155','57823','89369','58153',
                          '73895','80505','66241','65527','50563',
                          '23800','69786','77284','92469','66589',
                          '80256','62110','88064','93878','17150',
                          '68195','97196','29534','68428','28723',
                          '90157','78229','10975','27117','67349',
                          '13388','30243','63086','70467','23026',
                          '86242','96474','43379','93937','41803',
                          '24584','83023','35746','91935','12915',
                          '57496','40107','24217','34922','13702',
                          '74209','13151','86131','27155','35541',
                          '75841','14807','39017','15760','18162',
                          '54053','39944','98758','82422','99589',
                          '81941','43638','56641','33575','81450',
                          '98061','35252','33029','40498','29120',
                          '52807','96344','18466','33050','48833',
                          '68681','27124','35117','25542','29209',
                          '69880','86342','91449','77905','13333',
                          '20188','40414','98264','67056','24345',
                          '58417','69605','36568','61927','83014',
                          '90842','56663','65299','37488','43116',
                          '54643','64528','99769','35335','25672',
                          '27373','57179','23583','80068','59440',
                          '47855','60674','22400','43226','69636',
                          '41726','60053','47624','44593','46911',
                          '50121','17822','86612','51653','98116',
                          '56929','92945','33124','91259','25253',
                          '75494','37001','39278','46492','57884',
                          '21562','93995','92029','46325','43964',
                          '28577','61074','61206','38962','59044',
                          '44242','54119','40897','14625','33759',
                          '22971','64037','33315','16723','64299',
                          '57206','79179','95042','39189','26365',
                          '38695','12113','36901','92015','19991',
                          '56494','92061','61561','36593','19900',
                          '80352','25937','71386','85613','79679',
                          '52090','16260','18312','10962','48734',
                          '98634','58397','14753','18430','31731',
                          '19647','66389','91189','29758','98374',
                          '86606','40127','76314','26698','42435',
                          '37767','42554','42220','94991','19366',
                          '80436','45063','65860','91204','37689',
                          '30977','79493','65450','36015','83993',
                          '82589','18376','39557','58118','37481',
                          '19282','10118','18385','42488','85351',
                          '70483','52066','43339','20765','29511',
                          '83893','99485','72666','65431','13235',
                          '65040','20683','27595','11661','68083',
                          '15223','29799','69207','87676')
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


