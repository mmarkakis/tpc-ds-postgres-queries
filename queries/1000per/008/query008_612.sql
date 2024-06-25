
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
                          '37854','58502','35015','21946','74784','49185',
                          '68886','57887','13486','89458','95172',
                          '50477','43045','34498','77106','33308',
                          '95810','38472','33698','54530','57041',
                          '46501','93519','48330','30730','87673',
                          '54957','23044','29573','15024','53664',
                          '50617','12628','61601','61290','90575',
                          '32692','10014','78050','15204','12319',
                          '38466','68528','27386','14460','30082',
                          '33276','66021','65965','37943','15025',
                          '78533','60544','81891','71457','33795',
                          '55357','46582','76577','14323','69517',
                          '42230','52539','94410','82905','35982',
                          '48916','54607','16751','60887','34272',
                          '60710','82260','35857','88209','87028',
                          '16758','30869','80094','82739','95092',
                          '28007','42488','26806','17061','61163',
                          '86385','51175','21518','81144','30667',
                          '23194','67212','38054','56355','10491',
                          '78935','26230','82565','93378','15727',
                          '42184','28529','25871','32796','42438',
                          '73027','23020','19348','49889','11095',
                          '49198','57005','41514','17182','18641',
                          '86163','10635','19018','62225','87378',
                          '18673','89466','78099','15611','95566',
                          '50679','60188','60445','26372','77838',
                          '16239','66222','30132','77644','60785',
                          '21800','90358','27894','30876','28902',
                          '62872','69481','39006','21208','63423',
                          '25601','39691','71752','98054','68566',
                          '76266','54702','24652','88169','68908',
                          '13763','65724','15120','26623','37983',
                          '39214','47471','44696','45528','65609',
                          '61371','80460','80808','77199','28899',
                          '44144','58476','33717','35376','92770',
                          '91351','85505','19417','91281','62116',
                          '26996','58504','77267','55540','10603',
                          '31128','94238','78454','31804','45857',
                          '71029','51326','37698','73757','64982',
                          '68340','21126','87939','57546','37937',
                          '65277','51440','90103','74034','18604',
                          '30134','76275','17408','69277','26737',
                          '96341','53535','99861','14076','65750',
                          '46020','47930','42034','61682','86322',
                          '88872','60388','24205','60913','75973',
                          '59514','31719','84692','23470','33290',
                          '99440','10889','23488','85704','80697',
                          '82399','78392','74039','22509','27818',
                          '58180','76167','16025','28063','95778',
                          '25337','26160','79239','62516','50576',
                          '64490','29954','90204','22893','58607',
                          '38045','97840','93013','44969','34110',
                          '32012','89635','16914','42560','87149',
                          '45957','26582','53989','30040','91479',
                          '45829','98907','68965','91681','46300',
                          '51422','83867','55520','70598','82255',
                          '19258','94564','40349','94840','50293',
                          '76892','52431','19473','69266','98037',
                          '57979','72570','15370','35038','88570',
                          '85014','62618','91530','47370','16258',
                          '83843','98860','74638','27153','24203',
                          '35459','47133','18068','22473','50055',
                          '43393','56961','98223','38653','74906',
                          '50853','76493','89063','68075','49303',
                          '67596','12348','83239','32732','89910',
                          '84770','55346','20352','19635','83089',
                          '99532','85009','46287','99285','36852',
                          '84075','88865','83084','40031','83657',
                          '84131','51944','44837','52758','42848',
                          '36671','15031','21248','17754','73594',
                          '91959','31577','90499','73427','58261',
                          '66260','93459','57243','99688','35935',
                          '25464','73012','90229','27943','59622',
                          '64391','87265','10726','34481','42909',
                          '10000','70314','56213','85672','85860',
                          '25591','25544','29098','25625','89232',
                          '28271','54894','96712','58702','32308',
                          '37520','64230','59287','96640','67031',
                          '82061','64153','92112','76180','35689',
                          '21847','81957','26384','92242')
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


