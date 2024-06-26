
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
                          '29536','47652','36495','90977','54502','40583',
                          '48929','32309','26445','67169','99312',
                          '37249','45583','38951','88644','74858',
                          '98773','90739','70268','99106','56564',
                          '65257','98637','83415','68407','64905',
                          '59850','34311','15253','36701','52733',
                          '47375','95296','35178','53749','95671',
                          '95204','27077','25826','22124','20245',
                          '71349','65549','32027','15258','88176',
                          '17061','25721','47015','17631','97884',
                          '62380','56536','13909','24254','25306',
                          '30206','80132','15451','98395','75297',
                          '29563','81870','94239','35393','58199',
                          '59214','98138','97546','82573','41453',
                          '96028','23917','91418','83656','84340',
                          '66333','95018','67053','63405','98863',
                          '53508','86174','82240','59554','80711',
                          '13445','33171','68769','61951','56737',
                          '78024','45834','69083','56423','14069',
                          '11815','21528','62213','71525','60724',
                          '64314','14192','21357','16091','52166',
                          '47651','31054','85802','80748','13462',
                          '92210','26581','62401','89959','26013',
                          '38569','61711','96448','34162','35331',
                          '24154','84262','29499','76458','10473',
                          '87784','65317','58470','44184','40773',
                          '16847','89000','55245','62005','48577',
                          '74731','36126','30155','96055','12060',
                          '85603','82332','96962','36911','82926',
                          '67978','95280','56425','71549','94830',
                          '59555','96238','70572','75216','67317',
                          '77048','43998','54513','47200','85702',
                          '30267','90843','55741','72537','99657',
                          '10790','80186','64207','63703','96403',
                          '75385','55900','80211','99935','99569',
                          '98349','41227','53162','98610','27911',
                          '14679','27559','68647','72729','96037',
                          '97696','31251','13845','16463','88516',
                          '62153','26708','77489','34551','32958',
                          '46011','88647','92449','17298','18788',
                          '27037','88655','72341','72958','40297',
                          '63421','82118','50488','50759','12930',
                          '33779','27618','63648','76553','30594',
                          '44196','27895','61889','17255','26505',
                          '22796','75716','34015','56273','61263',
                          '36023','98041','41323','28346','16468',
                          '31817','79322','68292','43196','94163',
                          '95735','72524','96016','89386','20279',
                          '74248','82250','58362','88088','30175',
                          '76102','33176','56925','33859','34023',
                          '94716','35709','24337','89831','89708',
                          '32089','50785','21344','75362','71143',
                          '57512','99675','47224','66059','38570',
                          '96997','30234','49984','80453','98709',
                          '55348','17720','18725','88600','20272',
                          '31593','32946','98691','96005','82356',
                          '33572','25487','77928','65837','28762',
                          '44214','75468','12402','59652','68231',
                          '35487','79477','64593','29409','21753',
                          '92392','49606','74929','12247','74866',
                          '97371','45537','86168','68734','17753',
                          '66237','29853','59827','91356','99002',
                          '25154','34563','25949','72666','90138',
                          '63201','43066','43218','25193','30082',
                          '18828','96598','34120','23012','17449',
                          '30127','64950','70870','65822','89190',
                          '70501','66940','39802','34134','43501',
                          '53885','19976','74334','24563','26418',
                          '12239','36312','65008','30159','14921',
                          '44571','19173','45391','10509','19344',
                          '51679','41145','94854','61218','31874',
                          '91096','89973','61139','48125','40666',
                          '85598','52169','80434','37093','24850',
                          '66860','66375','18661','13692','38949',
                          '34621','76767','85964','83683','10446',
                          '15748','14493','49722','23348','32921',
                          '28587','43054','37038','77322','51305',
                          '27468','97316','72979','76024','85714',
                          '67664','86129','25020','28966','88577',
                          '51870','30758','43458','17276')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


