
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
                          '41254','78310','25403','45460','85229','87469',
                          '21707','50065','58730','92271','19206',
                          '88226','62669','60702','79723','67605',
                          '82695','55235','48795','90582','97054',
                          '31989','70802','26633','26264','59887',
                          '71045','79193','48326','48819','79419',
                          '18798','41414','84532','97613','38202',
                          '53365','27142','14716','15392','65272',
                          '78622','43024','87205','58310','68400',
                          '29957','22844','38519','37088','71793',
                          '48305','62123','78252','30724','48459',
                          '91986','24658','40713','13700','93082',
                          '39900','15473','38099','75785','85560',
                          '75772','74963','63693','24405','71138',
                          '59742','28206','55656','52765','70735',
                          '77793','55974','85159','30826','20941',
                          '68455','43149','41837','29712','94649',
                          '95719','10568','16208','59336','21124',
                          '98319','34111','17468','53087','54277',
                          '92844','79064','82573','71676','56893',
                          '54176','39654','39832','12369','94290',
                          '82158','83152','13977','67026','71313',
                          '33099','83742','82192','34496','35511',
                          '39245','33880','29702','15575','69926',
                          '50771','15997','27102','55476','76612',
                          '34933','79180','44329','72384','28451',
                          '57718','27332','44522','65513','19407',
                          '73765','22204','13520','22186','73005',
                          '18138','59962','55120','68980','25976',
                          '38574','56619','20044','45876','58570',
                          '95890','40016','16927','67362','45064',
                          '15443','38109','94056','90496','93956',
                          '74719','62894','64022','18623','41165',
                          '83803','41224','65102','50232','79657',
                          '41426','75100','97348','60716','93094',
                          '52481','40027','47950','14105','93669',
                          '73588','50116','38162','42104','44481',
                          '30407','65358','70211','58215','66137',
                          '39687','84868','85818','29449','28618',
                          '29285','11109','98441','35278','96490',
                          '45256','65655','69544','41750','45622',
                          '75073','81536','19016','59661','40741',
                          '18233','99122','45009','69996','28644',
                          '83565','66919','67560','51771','17495',
                          '76604','33062','79808','84825','96799',
                          '15368','54296','85125','13253','65740',
                          '25779','11750','12478','63695','27364',
                          '79164','47976','58595','61829','61779',
                          '54328','48724','77096','70412','43678',
                          '12918','36481','13236','27861','86474',
                          '42010','29857','40520','45483','91903',
                          '90532','75253','79355','22498','45442',
                          '82096','12280','40742','18679','44595',
                          '44963','99455','54271','61519','14623',
                          '43618','89542','65886','35350','13831',
                          '81040','79583','90644','96572','95440',
                          '43465','85202','42039','72156','58886',
                          '56947','65010','97040','71015','80125',
                          '66360','12583','64859','27546','77425',
                          '95960','62324','66760','85243','52318',
                          '34195','43739','24602','84076','56657',
                          '11335','43427','63204','94795','53693',
                          '81030','86826','75801','95031','34750',
                          '88716','44237','92088','21673','44355',
                          '52943','11651','88310','31709','21320',
                          '19584','69120','44031','29487','10754',
                          '46809','78956','22136','83496','16579',
                          '43388','67621','10328','98872','25965',
                          '38882','64099','72249','30932','18802',
                          '88786','14469','19932','56440','12030',
                          '24849','42763','68263','55788','26419',
                          '38860','68468','31978','50221','72796',
                          '31228','57230','97616','19637','81294',
                          '28601','26997','58805','15245','23404',
                          '26985','28700','87517','37241','60871',
                          '21056','74918','74905','85060','96345',
                          '54276','40654','18971','43769','19439',
                          '45091','36086','30589','64996','21951',
                          '74001','14936','55522','11359','64604',
                          '89622','51360','77305','62005')
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
  and d_qoy = 2 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

