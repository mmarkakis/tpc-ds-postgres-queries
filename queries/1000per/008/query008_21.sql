
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
                          '45036','86504','96937','44858','31328','99193',
                          '77327','66374','47402','40459','89997',
                          '24418','99889','85178','33037','24334',
                          '88177','80692','29123','45969','21569',
                          '53693','51647','27316','18952','23622',
                          '49348','80345','34910','73746','98206',
                          '98454','39875','42069','49075','97634',
                          '39957','83454','42351','27028','31178',
                          '42030','72742','70071','33444','52891',
                          '52555','11588','45429','56792','88381',
                          '22765','23769','52056','98296','80150',
                          '22598','13855','47265','31184','72418',
                          '38462','12421','91725','92220','60525',
                          '87538','10531','79760','67116','39165',
                          '79842','95741','10887','19869','85263',
                          '29887','98045','43258','30783','95613',
                          '83342','78174','73174','13842','76032',
                          '48039','30683','79462','57352','44715',
                          '10213','68277','72815','14111','53472',
                          '80996','35179','24456','34460','93671',
                          '68911','76166','60375','98277','95712',
                          '25594','60242','78487','34747','66246',
                          '92730','64686','26769','11192','61504',
                          '13788','99855','22877','77929','94687',
                          '79117','90879','36489','29128','49536',
                          '10424','59253','71516','97789','61293',
                          '59692','51131','67864','62017','40584',
                          '25691','48966','11648','42657','51759',
                          '59700','28059','47925','62164','73560',
                          '17137','26348','32026','36364','53999',
                          '59628','11593','12733','56408','83987',
                          '24146','96982','95478','91636','60784',
                          '39664','62323','55725','75305','60849',
                          '88014','88872','37858','42592','74187',
                          '24733','90142','46855','36555','12312',
                          '94509','98898','97550','79895','64156',
                          '73193','45669','60840','66595','44698',
                          '49844','73856','52735','84646','94373',
                          '59309','84365','25652','28706','52552',
                          '52793','49874','37410','95523','96132',
                          '96312','75886','30015','29984','17978',
                          '32882','59832','27379','50312','78469',
                          '82180','13901','56351','32192','79362',
                          '75280','36260','23792','48647','98097',
                          '52798','33398','61556','52501','11370',
                          '37997','57228','39322','21818','17769',
                          '27830','48172','75672','33244','47717',
                          '45313','55498','36949','45564','39197',
                          '71558','80588','43197','89509','97953',
                          '85561','16290','54833','94951','81189',
                          '83662','65254','75882','99133','73371',
                          '59165','24042','26026','22796','28017',
                          '58017','38155','98997','70902','71893',
                          '46231','74626','21716','15217','72787',
                          '72762','56154','28524','97406','12418',
                          '65778','76423','27713','83465','63570',
                          '14399','45562','22455','95695','17992',
                          '90346','78640','67313','64814','98585',
                          '45581','72220','49632','98811','82519',
                          '81747','75726','96424','53419','86865',
                          '86962','43960','29540','87219','16878',
                          '36439','11384','91785','92148','34575',
                          '73868','27140','80472','77690','99703',
                          '21598','95190','98660','25970','14228',
                          '35531','91374','96091','25612','64023',
                          '96179','21392','42354','87093','77731',
                          '41772','24799','23145','39553','63089',
                          '67357','76274','28611','71539','42016',
                          '85707','44535','87065','37112','82891',
                          '99832','33670','64752','88657','49786',
                          '84475','82718','62301','65900','41832',
                          '55480','19872','53315','35583','47893',
                          '17297','34821','25490','93129','57296',
                          '14981','19913','18032','34441','19964',
                          '21125','69268','50430','51435','37009',
                          '87809','78417','66498','55934','45591',
                          '39962','82779','59159','93962','19874',
                          '16872','16176','68931','82591','84619',
                          '51795','34442','72258','31776','79226',
                          '84139','43535','10035','38030')
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


