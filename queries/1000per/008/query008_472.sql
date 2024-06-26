
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
                          '75635','23726','50655','55718','94895','77581',
                          '96879','50331','97402','95951','24297',
                          '76776','75723','49851','24089','79201',
                          '81131','91849','87370','71447','19385',
                          '16124','13032','61518','93001','81031',
                          '83865','70363','22459','34858','21891',
                          '37337','66151','64431','93360','64163',
                          '68479','57651','28575','64789','95726',
                          '58665','80969','39239','75990','17324',
                          '45594','19764','71489','63027','62301',
                          '52051','51728','24787','43746','89996',
                          '94637','12898','94007','48833','46169',
                          '38434','44170','49813','60277','98199',
                          '66179','33876','20602','39045','86875',
                          '13288','59060','22835','58005','58552',
                          '78217','97465','42928','87512','98451',
                          '93302','45703','94011','74690','22069',
                          '64290','31230','27800','45314','65860',
                          '78881','48584','79718','76706','31681',
                          '31817','28547','55888','77792','68419',
                          '73310','87885','60466','71737','29343',
                          '47633','57111','87722','29697','48703',
                          '97767','38631','52280','13305','28129',
                          '68901','69416','56942','11584','21534',
                          '69899','46040','12671','39056','45625',
                          '41192','67856','87108','92641','10957',
                          '20635','44592','58998','11184','79946',
                          '86697','38025','98572','28094','19868',
                          '49091','77338','80140','79000','23108',
                          '84850','70503','99387','97072','39977',
                          '84766','51553','86889','66497','13028',
                          '30318','66273','73425','14003','49369',
                          '91252','53467','11277','22166','15775',
                          '85306','17555','70522','96787','50652',
                          '61588','56201','53588','50003','17602',
                          '25895','37441','25054','31799','19121',
                          '73208','27993','81176','65094','68005',
                          '16959','19891','33627','80346','95848',
                          '88108','77760','22624','48435','75907',
                          '51999','61512','43553','21662','60934',
                          '16799','67667','63588','33943','46618',
                          '59029','28840','83148','24626','35336',
                          '61234','28278','35585','53924','14723',
                          '11670','13411','81669','50428','52955',
                          '17903','56808','66000','84990','90496',
                          '20182','67328','77418','56634','90269',
                          '80347','13306','49121','23065','49493',
                          '18272','33056','24484','44184','77695',
                          '32799','18259','91587','24825','20022',
                          '52543','79222','29226','76522','78644',
                          '54997','77276','61652','72491','32313',
                          '67558','75429','59026','42739','99408',
                          '22697','12387','18082','51202','53738',
                          '93724','80732','44216','36928','51762',
                          '54644','97808','83424','55081','85926',
                          '68981','95864','87162','13823','82709',
                          '98445','29338','50533','21728','75841',
                          '61395','59189','91193','90985','14603',
                          '18606','16168','82212','26008','93114',
                          '33781','34497','77910','40734','55315',
                          '25263','83316','81966','89907','46595',
                          '44081','94989','92331','29659','68907',
                          '22919','67812','29567','98714','92523',
                          '73416','52958','16679','17795','47497',
                          '34761','65639','46677','17810','65201',
                          '30416','96840','36314','12853','29554',
                          '70643','39195','12295','20030','59048',
                          '21353','89318','74760','34101','84021',
                          '24725','19612','36929','38371','54795',
                          '43035','59315','35485','11886','95431',
                          '44174','24382','89253','86257','41962',
                          '54633','80463','66032','36915','79720',
                          '68449','49911','48247','78225','15608',
                          '57626','31517','42091','83582','48589',
                          '77213','66949','57214','34879','48934',
                          '77576','47872','81306','53553','34485',
                          '15149','54838','20773','91184','53822',
                          '65904','57845','27473','88855','95874',
                          '35182','20377','22813','36159','62883',
                          '17839','35263','47152','77824')
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


