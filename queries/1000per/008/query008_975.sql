
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
                          '62743','39287','72539','65725','93467','48842',
                          '19783','32278','43946','94671','31966',
                          '43345','54770','82378','69601','94369',
                          '34056','32175','33581','39809','74109',
                          '83788','27539','72848','63809','97363',
                          '81891','67669','94332','19818','87584',
                          '45711','76761','93927','74649','24044',
                          '37760','87173','49146','29637','97588',
                          '98242','62669','56223','61345','77482',
                          '44520','83422','33521','83488','13170',
                          '40070','76277','97911','85349','75135',
                          '22657','94017','19441','57218','16735',
                          '24990','79424','88397','75762','78264',
                          '29169','80092','86989','88027','43337',
                          '28618','52412','55624','87836','83543',
                          '31259','18230','62906','71383','60449',
                          '88139','73413','67838','53365','60926',
                          '36901','15422','11215','14245','85665',
                          '29799','13448','33831','12806','63965',
                          '23932','42163','49517','84545','18706',
                          '13777','16856','76731','32697','67110',
                          '33712','82025','63788','25612','33720',
                          '68573','45109','20187','23229','90470',
                          '17415','76506','20117','74042','99046',
                          '64689','24432','69793','64194','45516',
                          '52706','50792','50104','74005','91385',
                          '85288','22373','26909','18168','67362',
                          '60919','79939','71048','43028','79686',
                          '10215','79816','82314','74788','95018',
                          '56215','98734','18828','72171','80872',
                          '13840','20073','31841','99198','21665',
                          '89422','27619','35208','28228','76885',
                          '95287','35915','61523','43083','88947',
                          '59782','18323','80425','67309','10525',
                          '52324','49114','53068','79150','32823',
                          '79205','47049','26035','13419','59249',
                          '71172','38989','61824','27351','57610',
                          '42492','72140','14493','36210','74747',
                          '74313','31467','36651','71968','24202',
                          '62843','25820','33257','46391','49805',
                          '56833','34461','95452','13925','43131',
                          '90150','23190','85431','13734','29386',
                          '20003','84079','32896','22992','53206',
                          '22168','92329','98092','45550','81982',
                          '14045','26015','43922','84537','11115',
                          '97599','51836','16492','90410','26004',
                          '36471','76528','62834','30998','80490',
                          '26485','48890','30480','63439','80395',
                          '34555','79771','24995','32796','97497',
                          '45325','48372','96585','97147','36454',
                          '37762','31594','38816','89382','73999',
                          '26656','79159','19674','87105','17490',
                          '10003','65885','25605','13038','95981',
                          '86487','23657','74081','41123','56623',
                          '68873','82432','48457','68544','23245',
                          '69909','18447','97008','92831','16469',
                          '68590','86678','65284','14740','76800',
                          '93566','87679','94850','89821','22658',
                          '26776','84517','21179','73249','59385',
                          '15110','42251','54864','41076','77054',
                          '84888','88649','85008','97962','83670',
                          '16495','10387','33760','65402','56944',
                          '93622','23213','57101','33954','22820',
                          '87818','80328','86357','16734','85372',
                          '83330','59304','48980','40497','37598',
                          '15286','25192','37703','90416','69558',
                          '19201','29083','32232','41137','57653',
                          '43763','61006','30580','22971','96050',
                          '66030','97648','18746','11487','95759',
                          '77963','46717','72401','96221','86032',
                          '67614','21510','79964','37402','17708',
                          '34810','31360','94596','21110','19645',
                          '58530','46020','43600','92103','85504',
                          '53226','19534','37633','31065','52558',
                          '18523','75685','44560','42190','68376',
                          '23051','57798','95456','71551','98732',
                          '44817','69660','66649','92425','56928',
                          '39733','81759','54728','14093','66444',
                          '92421','85858','99404','85655','91339',
                          '14251','40072','62096','32400')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

