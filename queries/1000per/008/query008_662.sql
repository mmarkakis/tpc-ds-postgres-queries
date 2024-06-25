
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
                          '99005','14456','10843','31872','82410','70116',
                          '23209','39008','24033','25741','60711',
                          '14080','40912','19779','27444','11232',
                          '72125','45516','83181','84978','60419',
                          '72018','91949','33923','70637','95256',
                          '44888','44125','44281','52584','56302',
                          '39780','72061','89485','17707','71078',
                          '91094','55288','49418','18734','41840',
                          '12742','14837','98663','16381','16268',
                          '62999','41244','22982','44675','55985',
                          '25471','70863','65365','75381','42576',
                          '80804','64790','56058','60174','84001',
                          '68083','47250','98675','14374','86491',
                          '10517','29774','36415','34732','40388',
                          '84852','93513','65485','61440','25529',
                          '73753','85606','91270','15292','44590',
                          '54625','33170','37187','38266','51419',
                          '53503','56631','42563','62439','30824',
                          '26814','65553','91350','56593','47994',
                          '34372','96059','74978','40952','40721',
                          '64420','39766','20355','58586','47953',
                          '48097','99039','38354','43051','87517',
                          '75632','66667','24976','57167','79226',
                          '75596','81502','76556','29073','87408',
                          '38976','12943','52427','48684','90557',
                          '58793','42509','32966','12567','69734',
                          '95727','19235','14559','89859','94330',
                          '51533','77818','16099','34844','56974',
                          '85457','17523','22670','91920','70848',
                          '40802','86323','68967','92815','44824',
                          '95715','58089','73201','55511','61818',
                          '86605','68295','81489','65862','57469',
                          '52434','64565','43243','67645','65869',
                          '86452','30969','66786','14489','61719',
                          '27549','90517','65294','90528','22172',
                          '62630','94061','54118','20808','83156',
                          '51346','45504','90911','87614','27328',
                          '23691','91301','15096','82349','78630',
                          '60970','21245','96663','73293','71506',
                          '70663','26916','10319','83019','51949',
                          '92576','64107','63596','15830','16209',
                          '46375','95488','79722','36259','91888',
                          '60903','74452','88711','79488','25329',
                          '19346','59210','67526','68744','63476',
                          '80909','89818','63815','79497','67474',
                          '21593','86010','34329','83878','34117',
                          '48991','65486','29359','61295','97382',
                          '94999','36990','78663','17735','45717',
                          '81500','56199','34016','86942','41694',
                          '91637','21050','18701','60803','24494',
                          '47905','91609','94945','90259','72877',
                          '45720','20452','79931','35565','79985',
                          '59213','51957','69605','15027','72994',
                          '51172','69680','59600','14575','93522',
                          '97035','44389','38327','16738','70176',
                          '33365','60046','82183','22183','36037',
                          '39026','96635','91677','87920','58993',
                          '36352','80027','43418','89630','99142',
                          '54748','13909','38966','56016','36323',
                          '65163','11190','55775','30221','87453',
                          '49917','42174','66634','99774','19925',
                          '72309','56799','54170','97092','16963',
                          '37376','42277','73310','48254','49521',
                          '18732','32218','42158','18389','37015',
                          '10144','78465','64215','40372','80838',
                          '53064','70129','33975','84033','98694',
                          '88633','93607','58359','45796','60093',
                          '25005','96012','37945','46329','52202',
                          '46667','78591','75427','85456','35506',
                          '81809','33656','73431','20325','41016',
                          '34983','37277','19329','75165','42190',
                          '24424','70257','63593','59099','11286',
                          '62856','78435','99033','99875','25800',
                          '19587','49819','75411','96620','87478',
                          '49155','71034','15889','47280','90026',
                          '73990','25409','58652','27813','89522',
                          '87766','77923','49572','26352','52845',
                          '24274','42136','62291','66007','10535',
                          '99822','25798','55158','48975','19275',
                          '25584','70954','66939','13013')
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
  and d_qoy = 1 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


