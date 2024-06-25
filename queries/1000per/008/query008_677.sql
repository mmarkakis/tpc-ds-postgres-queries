
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
                          '79982','23043','31003','82562','53869','92682',
                          '25402','74124','65595','27004','87682',
                          '40164','73798','62655','23445','95225',
                          '13689','34522','94579','94703','71642',
                          '17360','46611','46295','51912','43109',
                          '77872','10274','40345','53121','41438',
                          '49692','45695','70922','32345','65055',
                          '50324','58387','41600','32817','66197',
                          '33216','22207','29415','51993','50788',
                          '19091','32059','90983','62633','31041',
                          '26371','91418','63750','22512','68012',
                          '64607','32060','20178','63388','63431',
                          '50672','23812','94408','39544','78238',
                          '21087','37577','36832','40028','79475',
                          '65688','83147','44202','96203','78834',
                          '33280','29875','54594','63483','46461',
                          '25806','64539','50108','85688','67836',
                          '85386','79944','66285','57750','27474',
                          '62808','11027','72827','70597','37419',
                          '54534','79398','75718','94811','33352',
                          '17783','53009','77158','80064','98490',
                          '71061','60229','46680','26956','30360',
                          '76719','95239','84286','62882','63421',
                          '15900','33116','87445','15386','93181',
                          '56623','83510','66680','66719','20894',
                          '74582','81283','32522','44556','94719',
                          '30136','82779','25471','25555','17893',
                          '82385','83579','91727','64808','15735',
                          '95033','10816','94711','27790','81983',
                          '25911','11303','47473','72885','59254',
                          '45850','84576','31295','25776','43678',
                          '11554','44133','89308','98612','58860',
                          '34439','34020','37147','51198','86801',
                          '16398','93000','80045','50628','17927',
                          '84262','30163','96985','94822','58073',
                          '87956','57264','95537','81580','16554',
                          '32448','74527','90286','60981','83590',
                          '78671','73263','81995','10658','87708',
                          '60998','54983','66343','84379','36024',
                          '59440','61324','82542','49814','96188',
                          '89602','26952','71123','85566','22276',
                          '40408','87132','80534','82224','76085',
                          '78862','81505','24457','34660','94725',
                          '86144','69172','77594','34435','24901',
                          '28463','99268','15814','84957','51004',
                          '81966','74041','26768','94217','45380',
                          '73909','21268','91712','78920','87364',
                          '72177','15856','52187','32994','63131',
                          '85942','30046','66999','28580','93573',
                          '45137','55767','72628','59295','58665',
                          '95544','44903','48752','10507','87825',
                          '85039','10285','64957','25443','44051',
                          '35733','11765','61350','12439','62072',
                          '62637','54222','83449','86086','66765',
                          '97982','29622','84060','51841','63263',
                          '22028','72031','11701','64990','43848',
                          '76668','97390','76045','64541','44325',
                          '52809','44924','92235','34199','31853',
                          '37831','80291','26966','42268','87930',
                          '24946','31730','82963','50293','20048',
                          '95332','58610','87015','48615','52368',
                          '41491','36974','94030','87426','18461',
                          '13964','24210','59943','33589','56967',
                          '20618','42636','89026','22562','71757',
                          '78049','23655','66666','51465','40169',
                          '16764','62558','30471','34092','24966',
                          '74945','41392','28790','12753','25907',
                          '23380','21026','11073','74580','41013',
                          '94089','76792','66175','49641','30880',
                          '58911','27389','10370','75923','14900',
                          '99192','78855','80941','48272','33175',
                          '88946','57305','42426','48151','24162',
                          '83790','82108','83805','56072','98551',
                          '33978','15662','22248','29551','78969',
                          '67632','39347','68426','15863','81909',
                          '93799','73666','20380','44199','35493',
                          '99464','73807','10202','45352','14455',
                          '88501','77172','73189','21306','98750',
                          '78856','33224','38953','54313','68814',
                          '94178','16478','65285','66259')
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

