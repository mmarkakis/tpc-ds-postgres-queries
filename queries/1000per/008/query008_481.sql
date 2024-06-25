
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
                          '99630','56670','33682','45613','43821','46191',
                          '71803','82678','17095','19320','49501',
                          '69477','81622','27691','79873','87030',
                          '85413','66790','24496','14707','41237',
                          '20108','41933','99284','31805','10105',
                          '10631','69876','67622','39765','58506',
                          '82642','69813','50087','38956','10020',
                          '20886','82315','55130','62708','66549',
                          '70332','43016','78441','33810','45782',
                          '67878','33918','41799','43066','61572',
                          '18143','54387','40246','43063','10111',
                          '35880','27042','90004','37392','95712',
                          '10371','92472','19249','71569','94132',
                          '78216','45892','23608','43113','38325',
                          '60567','51682','83277','99033','84887',
                          '68864','28327','81668','29852','17138',
                          '27317','35104','40178','49964','87345',
                          '61063','19025','18954','92695','78413',
                          '15736','96629','53520','96496','41217',
                          '18411','66060','39119','24824','53885',
                          '34824','69432','79492','81141','22670',
                          '10357','28337','47879','74548','85533',
                          '67607','30395','81242','84814','53153',
                          '74255','99396','98984','96517','23793',
                          '25640','67433','54643','94918','66773',
                          '39063','54340','79350','98467','17874',
                          '13594','70110','27749','51575','89219',
                          '27982','79784','49925','48599','83579',
                          '30039','42605','36126','93609','22108',
                          '72408','99273','44161','22594','31282',
                          '21105','53536','61989','16282','41244',
                          '97607','79191','98306','35980','92920',
                          '11512','73083','39235','97318','79549',
                          '60835','26174','42927','34495','65508',
                          '92099','70700','60578','54307','12834',
                          '19919','80376','82194','22586','49448',
                          '85104','22337','42694','22092','74518',
                          '83138','49529','79089','28682','74998',
                          '81369','40195','78849','44032','16747',
                          '82308','75127','33221','12058','20497',
                          '89755','34160','71897','73163','98515',
                          '48219','24604','39044','37776','67657',
                          '93525','16539','67944','97305','11570',
                          '33554','69689','45250','35849','85601',
                          '59250','12113','90879','61002','14267',
                          '88700','76138','40748','13413','30323',
                          '26607','71769','33200','34593','48806',
                          '60146','30208','87724','11858','23979',
                          '54523','40500','72906','83991','18697',
                          '73718','12322','26707','11685','85722',
                          '60666','92988','21995','22112','59331',
                          '14966','30526','23728','52582','66821',
                          '91867','84249','38680','69203','52771',
                          '94540','48467','93962','57573','16982',
                          '50170','65674','70016','49791','21708',
                          '35137','25104','70241','47513','89950',
                          '54077','35511','76753','73805','85501',
                          '36539','11781','21043','72415','76900',
                          '41093','35030','78673','70120','44913',
                          '79027','59780','19641','86515','80042',
                          '15079','39136','95777','87637','40531',
                          '71168','44253','49972','24235','36891',
                          '43512','24487','99476','14159','70762',
                          '72395','51687','49329','33866','80242',
                          '95411','70601','39473','27832','75663',
                          '87824','68591','77553','29507','97106',
                          '53713','10265','56345','63259','97474',
                          '62589','19983','17941','96002','90329',
                          '71735','66127','82248','45781','58477',
                          '24608','46147','88444','85398','97482',
                          '99941','15600','49560','18356','47829',
                          '45622','63604','66398','48857','21808',
                          '95807','93663','32857','93491','59720',
                          '92129','47894','96518','44315','23470',
                          '64425','16371','47515','86869','84480',
                          '68670','92306','54555','52658','23190',
                          '97409','67714','56409','90604','21756',
                          '64775','66582','86395','13173','24236',
                          '73631','73939','98307','13777','26053',
                          '52778','31656','63736','82512')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

