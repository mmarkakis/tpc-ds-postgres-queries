
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
                          '83217','13260','16193','50521','85553','11059',
                          '72962','49082','80606','42372','13947',
                          '59853','21108','69345','95750','46369',
                          '26843','68504','14711','78301','70483',
                          '64311','11548','88680','99179','17710',
                          '64205','12757','73564','47813','92345',
                          '91452','25213','44927','92482','81449',
                          '49218','46913','45149','42481','32733',
                          '60246','49970','73447','95605','45465',
                          '66750','79846','87086','88585','89398',
                          '80446','58303','94173','15683','81892',
                          '38134','90960','86863','56201','27484',
                          '30114','75753','86920','34532','95588',
                          '80033','24221','87341','42264','34685',
                          '66131','23808','79252','60040','94482',
                          '20867','96419','64355','25552','12175',
                          '30692','88930','84252','73851','61211',
                          '36921','77142','99957','97542','84926',
                          '93012','75805','94733','14570','71959',
                          '77549','89903','28699','74168','19250',
                          '77341','16395','83803','47070','22498',
                          '82967','11222','64419','22346','26571',
                          '93752','30421','26493','16230','86346',
                          '22668','60281','88051','91303','34511',
                          '90738','63837','68370','47080','35888',
                          '23033','44756','53693','54782','36489',
                          '97941','21299','91801','67237','53736',
                          '62309','55033','44784','64401','78561',
                          '87253','47932','45224','85066','41802',
                          '50971','72734','99154','15714','44327',
                          '83208','34175','94071','45680','70433',
                          '54180','39617','69992','39688','95385',
                          '48803','68405','35515','93428','40295',
                          '57865','37074','47149','81538','28473',
                          '64329','33876','59925','45703','54749',
                          '47492','49557','31012','90897','15686',
                          '83534','30265','55693','64593','62090',
                          '62517','23942','60749','90825','45826',
                          '39859','59446','65917','36122','35167',
                          '25632','28387','26289','88262','96953',
                          '60036','72374','50798','23955','69713',
                          '12329','51694','85161','23396','20482',
                          '96128','84984','17956','36012','48617',
                          '88837','14007','69532','18140','23095',
                          '14562','75544','47598','12712','78928',
                          '62027','76150','66717','17003','93876',
                          '16761','35150','88782','33764','94975',
                          '72912','45856','43696','76241','82716',
                          '87113','86650','59601','38886','53462',
                          '90521','17779','16379','52826','56085',
                          '94207','24173','17462','77816','87470',
                          '50583','98639','70028','91406','34849',
                          '45103','34067','51950','10875','59456',
                          '52137','34854','57140','27654','14643',
                          '86413','12493','95916','46996','29571',
                          '23960','28573','89140','51668','52293',
                          '47582','71705','43267','97201','63985',
                          '43974','71156','72292','49950','37014',
                          '36180','95455','37851','79387','91631',
                          '98808','30486','43426','36021','84753',
                          '37501','12584','74099','50485','70151',
                          '99743','30141','38983','57820','91853',
                          '50812','72575','67058','61160','92567',
                          '46225','67009','32345','24273','44902',
                          '84133','25768','94392','29082','49571',
                          '26962','88847','58082','13885','52504',
                          '10390','18120','61767','59262','91798',
                          '49393','18127','56772','39040','87865',
                          '14413','24274','18429','38973','51245',
                          '35760','55292','34421','41034','66568',
                          '94857','10215','91845','55884','35066',
                          '23506','60070','98015','35701','57373',
                          '86305','93248','78318','68525','54781',
                          '91965','64663','52302','17150','31995',
                          '69783','26038','18992','79511','69235',
                          '92119','39934','22865','33500','21296',
                          '51402','33460','28773','68523','78577',
                          '28967','76044','96125','70521','62267',
                          '79060','64157','86298','41539','89055',
                          '31342','77007','48875','16186')
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


