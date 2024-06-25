
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
                          '77106','21120','83969','53516','15109','36523',
                          '37172','60769','77988','45769','64033',
                          '74765','25650','83505','72080','16144',
                          '56455','53926','89409','86461','59815',
                          '96807','43535','45780','57271','70766',
                          '70470','73446','20183','95341','67780',
                          '15493','72692','84424','51833','28903',
                          '36679','72897','74671','19233','23848',
                          '70975','72803','99673','35991','71245',
                          '96157','41921','31416','55100','34055',
                          '16676','83822','29483','97391','26644',
                          '18829','78526','76191','80569','86214',
                          '75655','52831','62361','60170','78985',
                          '87209','85413','48294','14813','86136',
                          '62036','33213','45799','63387','20035',
                          '89452','28957','53114','62220','67387',
                          '85742','89184','81475','56605','43421',
                          '67742','96011','81460','56180','52525',
                          '73973','60717','84057','19256','83973',
                          '63708','86127','48114','13180','98536',
                          '33704','20847','39869','73136','30902',
                          '73404','10816','16127','79450','19889',
                          '48005','68764','69922','95563','71564',
                          '98875','93472','57164','63534','23152',
                          '56247','81361','52728','70185','79071',
                          '70198','40343','71102','18641','58474',
                          '38966','53626','37971','54014','82327',
                          '11104','82367','50262','27591','42580',
                          '10051','11187','87630','56203','79933',
                          '26424','55433','70459','94109','62190',
                          '23189','56103','26398','79904','67964',
                          '61205','89285','20834','38107','72084',
                          '74164','12702','96990','59227','28592',
                          '64596','90331','17604','57308','41561',
                          '30998','58115','47825','30524','13468',
                          '71661','27971','42077','94562','68998',
                          '52718','96693','38505','18195','40754',
                          '13429','24510','23555','33325','68570',
                          '23947','56685','81714','21434','32194',
                          '97558','43629','74054','64958','35414',
                          '65742','82119','25720','52726','68463',
                          '39241','58543','40025','31228','93994',
                          '17736','99309','94512','25060','19674',
                          '78469','89516','19843','99762','71874',
                          '66407','39924','74982','25553','16448',
                          '82660','44904','53676','42502','53723',
                          '67558','67453','29166','75110','34196',
                          '57169','50608','41040','15237','70801',
                          '48856','32605','94629','88738','29426',
                          '38279','48609','26180','94650','16183',
                          '83542','43988','41620','12727','86757',
                          '48638','64508','26808','48662','10263',
                          '92062','36021','93842','13626','58621',
                          '68317','33366','45834','38590','98756',
                          '40992','97785','52362','45580','71350',
                          '47284','92332','67416','21024','14654',
                          '26293','16872','62658','50034','19007',
                          '76576','72376','63145','22147','29832',
                          '27718','25811','63248','12975','96700',
                          '80318','55887','19605','60200','29712',
                          '25187','54409','90689','19237','55174',
                          '67484','66041','25689','91342','55446',
                          '98931','71050','33323','20612','16398',
                          '63975','53022','56699','96131','29078',
                          '16913','42036','94323','95087','11118',
                          '51513','27355','44609','87394','21264',
                          '51477','54471','62856','22006','41257',
                          '32802','44549','12775','16714','11947',
                          '59035','93103','13785','30482','26692',
                          '30151','32716','37817','34254','28613',
                          '53987','36804','14537','69644','22047',
                          '28855','50004','63694','58817','68679',
                          '42573','33076','31580','83408','59972',
                          '84240','74978','24675','28905','70210',
                          '57929','74771','67987','46950','63503',
                          '11946','42742','46590','67260','70607',
                          '82898','36926','62253','94982','75004',
                          '66811','64002','43536','90799','78268',
                          '48724','98709','17174','20715','33416',
                          '74372','17067','65861','42936')
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

