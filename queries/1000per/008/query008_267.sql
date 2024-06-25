
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
                          '41832','69547','26776','59241','94622','47292',
                          '38221','27400','89258','12135','16590',
                          '27336','65851','72852','29348','41771',
                          '92678','30151','99701','81217','33075',
                          '57904','23832','90848','49329','80938',
                          '74192','62188','91454','88075','21377',
                          '80001','97593','13022','11965','35376',
                          '67282','45350','79289','26645','10658',
                          '67447','84806','26668','93241','36833',
                          '83918','44522','64838','12439','49855',
                          '20314','63602','47221','17541','48041',
                          '51120','19865','33446','97826','71369',
                          '61902','90777','47768','50657','60964',
                          '94750','36454','22149','79273','13961',
                          '90715','34978','26796','78106','48864',
                          '70093','57000','37348','32271','35339',
                          '43562','55975','37300','76525','41066',
                          '63112','37218','57164','35930','35677',
                          '80454','66284','28119','50975','14706',
                          '59896','34255','60420','17637','24935',
                          '50097','31954','26382','46231','40572',
                          '56742','66697','69622','84250','25507',
                          '21048','90008','35059','97089','42233',
                          '46698','41494','43153','13785','70934',
                          '65998','89601','24773','52366','61390',
                          '28470','99406','48914','67142','85588',
                          '76621','91321','95311','92886','25692',
                          '81470','51311','29432','91655','73333',
                          '17686','83759','80408','49596','97830',
                          '70249','96917','33892','95800','25514',
                          '27013','20734','15934','36396','45140',
                          '42280','29304','24210','16391','70799',
                          '24697','24768','68774','43595','63178',
                          '86029','17327','85853','99901','78818',
                          '22266','50694','30799','85721','18124',
                          '32116','98518','30353','80832','30720',
                          '17013','54340','78682','86187','46590',
                          '17127','27047','51200','99316','84191',
                          '46349','34159','88088','87926','87013',
                          '18317','74284','37060','44547','63679',
                          '77020','13858','29992','81263','21190',
                          '74314','84548','37492','61159','63880',
                          '52245','94747','32591','21740','69714',
                          '74827','86700','92871','77007','11557',
                          '91968','84390','63549','12798','42844',
                          '69799','89809','42086','86955','65626',
                          '58084','15418','24624','49872','53525',
                          '91679','40443','69223','73736','30977',
                          '35614','93694','24241','70028','39323',
                          '45711','72595','93892','36837','90229',
                          '42524','28132','74946','85318','94196',
                          '11144','75164','70258','44193','19584',
                          '99249','38491','29082','79134','53641',
                          '19080','80919','46690','40127','80893',
                          '18375','54361','14814','99509','12268',
                          '72814','76794','97234','55013','66110',
                          '24555','39306','96810','31933','75124',
                          '26425','45197','59235','16486','63383',
                          '12449','18252','37927','78443','72161',
                          '92709','65979','87253','22885','51253',
                          '47493','68528','59821','71821','49179',
                          '73912','46032','61656','41353','65591',
                          '95688','38832','45067','59038','44668',
                          '75205','44315','74236','87876','98457',
                          '90976','48482','15339','33774','77906',
                          '38861','63490','95394','21074','69313',
                          '74364','98301','66756','60393','79995',
                          '99756','27953','76981','12506','46544',
                          '33159','86533','84304','27213','64326',
                          '75801','24439','75600','87261','94841',
                          '23044','97679','57808','42323','87079',
                          '61389','37488','42250','18616','87179',
                          '57430','71963','27003','77651','86082',
                          '21403','14817','70187','23065','57325',
                          '20599','66076','17671','14405','67390',
                          '71291','26971','70862','52498','61468',
                          '64661','85673','83792','52950','57322',
                          '71211','25391','56220','39239','51471',
                          '21171','43183','11870','70208','85961',
                          '33147','30750','19384','82730')
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


