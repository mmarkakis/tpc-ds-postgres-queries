
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
                          '75530','45745','56621','37531','88923','97633',
                          '63563','26298','77986','99504','40265',
                          '95085','41349','42267','62663','89013',
                          '40027','94708','36826','36797','75993',
                          '27409','98992','33795','61898','86004',
                          '62429','90842','45038','94655','23175',
                          '62279','71323','68130','84138','87178',
                          '70479','57999','89357','62933','91866',
                          '18296','58541','98957','35415','20484',
                          '81600','16785','76712','17319','67436',
                          '74279','38490','18510','73062','16603',
                          '22867','29940','66403','47467','48427',
                          '40191','22542','74523','78785','13729',
                          '78475','81640','69703','59753','69979',
                          '26954','75570','42959','16029','73400',
                          '43078','39990','90580','68789','99367',
                          '10636','55760','34999','34153','74705',
                          '53188','75545','84003','40977','55686',
                          '18264','35769','78762','47508','21304',
                          '27507','58662','52667','62064','65269',
                          '26868','22664','34455','14682','43619',
                          '71307','41071','19177','34329','90584',
                          '80159','37844','79466','40579','60759',
                          '12520','25222','89540','12178','33972',
                          '87925','68670','98599','57878','91512',
                          '79320','16601','64505','85251','96789',
                          '46279','85199','58862','58387','29007',
                          '15561','74170','11425','93015','78777',
                          '49460','69927','72485','89672','36129',
                          '96080','56875','95296','79257','64771',
                          '69140','19733','20316','34497','42721',
                          '12875','99315','19720','12514','50859',
                          '84034','45240','52059','40999','33796',
                          '82155','69907','68772','69928','85014',
                          '76677','14894','24849','22720','93990',
                          '65023','50409','43203','54913','42773',
                          '28575','75108','50600','80803','68685',
                          '81657','32572','61542','64743','83904',
                          '63605','26491','30092','32823','88909',
                          '78166','43895','30160','10147','33165',
                          '59981','11938','19110','40325','49118',
                          '75376','79751','70520','52108','51557',
                          '98223','18969','40911','58922','68321',
                          '15471','90622','33982','67835','97067',
                          '22087','51786','39905','89046','80846',
                          '14965','68424','42527','52789','77217',
                          '70715','46710','64603','76373','82725',
                          '84200','92772','19283','77583','61232',
                          '64316','87367','32117','17189','86775',
                          '89677','43186','26469','70785','38935',
                          '12616','55921','89222','10869','16457',
                          '92128','81127','73672','20145','86046',
                          '31257','21203','75158','42372','87562',
                          '24105','10511','57645','29004','12422',
                          '84576','78585','12080','48374','71908',
                          '61911','42770','39862','54128','97820',
                          '48411','72031','51665','37967','24438',
                          '34535','59734','40821','84604','92392',
                          '41530','77146','95666','61702','43846',
                          '19333','44104','44018','68261','90839',
                          '82356','24660','38207','38939','24665',
                          '43958','84327','25025','44078','62226',
                          '87872','83484','80687','66934','33509',
                          '50298','85308','79765','43199','55833',
                          '34098','40198','25466','23155','50626',
                          '36709','51858','15686','66698','37018',
                          '38276','78208','34272','74414','67091',
                          '58414','46963','54621','14279','38420',
                          '60713','76520','83771','68294','21423',
                          '35132','18880','12557','92503','85427',
                          '44105','93089','71038','49898','48406',
                          '21429','19894','59773','32013','42278',
                          '93047','62406','62003','96426','97656',
                          '39622','30659','62482','96668','18133',
                          '87510','50663','17183','57840','57015',
                          '73522','94030','22680','96977','83841',
                          '69165','56697','91289','40528','32240',
                          '35519','75507','18587','93427','42102',
                          '17307','34035','76587','87536','49262',
                          '70947','45047','56562','75492')
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


