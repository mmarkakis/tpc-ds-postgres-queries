
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
                          '44102','66116','27895','40718','35732','20014',
                          '17380','27956','13914','76696','96481',
                          '51190','11237','46863','24359','40138',
                          '58363','21977','51269','21980','40566',
                          '91095','89942','43386','83808','21125',
                          '31545','19374','32183','21350','56462',
                          '51770','89196','41945','48626','92254',
                          '96143','38996','34490','47252','92583',
                          '75249','47794','59598','35674','17197',
                          '66083','56196','55917','63780','58942',
                          '14767','31380','48394','62695','60583',
                          '11730','53128','34492','53477','42889',
                          '42847','85725','19842','21022','82926',
                          '10759','92761','85976','15121','53840',
                          '24771','54859','87240','38749','61594',
                          '62309','43878','10651','35604','64918',
                          '24725','74744','54089','21183','91779',
                          '20066','71404','39425','41127','59430',
                          '62385','47242','87380','47230','59053',
                          '65116','83543','33361','86175','69874',
                          '62029','43537','73112','33481','28635',
                          '74519','58157','92261','71715','41840',
                          '27842','27975','97555','20321','50585',
                          '53049','16986','66160','51861','25011',
                          '50130','60990','43407','92296','44953',
                          '73874','20775','63427','73559','92110',
                          '93335','64224','21859','96499','34266',
                          '58057','38834','30607','58415','81749',
                          '47421','17694','73246','85525','25382',
                          '31084','89405','12344','20689','24571',
                          '27123','30755','33664','84450','15476',
                          '38529','59705','99682','31614','97847',
                          '96994','38651','22739','51115','40346',
                          '90780','58121','44733','43417','56436',
                          '26551','39905','61165','59672','17811',
                          '91308','35056','47017','54983','95243',
                          '33280','32035','28577','46705','56396',
                          '85829','69725','60208','96075','61426',
                          '32014','21930','90915','14031','69938',
                          '45398','93998','85919','33378','35662',
                          '45814','29336','56506','35201','76917',
                          '34449','67496','27461','13576','23719',
                          '13868','48380','76776','98311','43942',
                          '38222','99100','12052','12290','18583',
                          '59253','86420','12071','88751','72353',
                          '40933','71227','27790','20254','35694',
                          '71609','58005','77573','43451','72501',
                          '32510','29008','36670','70701','64693',
                          '51946','36572','98257','94031','77044',
                          '24907','62073','13916','76964','39914',
                          '75636','60735','23702','63086','15767',
                          '90588','76076','67456','70342','56747',
                          '76137','94470','61707','64659','97420',
                          '87682','29140','77478','70498','46168',
                          '35044','77439','77486','44793','67366',
                          '70323','18020','70060','48605','90443',
                          '95482','31684','93658','56376','15282',
                          '58297','12196','29727','54014','88955',
                          '89925','13567','70905','44140','99764',
                          '65620','93924','33006','26949','46188',
                          '30028','78225','97918','82609','91765',
                          '74435','14706','19415','40971','47898',
                          '47720','56080','54579','89956','47850',
                          '32363','36805','98602','90438','63068',
                          '28313','37043','42994','81972','46332',
                          '86317','15342','87340','56086','62132',
                          '48425','93420','22372','69127','11372',
                          '58871','95467','54958','70054','90283',
                          '34956','53858','61368','74652','54403',
                          '89792','93881','90276','26004','34968',
                          '80520','21394','86645','96851','72373',
                          '27081','44164','90577','20213','27325',
                          '67326','48238','36037','41110','66938',
                          '48456','97907','20762','68550','14923',
                          '17445','76385','17428','50822','62306',
                          '28104','26768','28660','79098','45489',
                          '57006','82721','88197','22555','40237',
                          '85472','36861','36044','80404','91870',
                          '24842','25127','78028','25701','86081',
                          '77746','95708','14964','71558')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


