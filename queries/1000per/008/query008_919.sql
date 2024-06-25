
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
                          '89108','29388','35436','82658','43888','37535',
                          '26828','46854','16007','94250','95045',
                          '56221','87656','24372','31327','96290',
                          '42306','29872','37640','95497','65672',
                          '81474','21090','47291','81155','23230',
                          '17685','51948','64832','56822','18062',
                          '80494','10285','93579','12181','78624',
                          '43289','14201','85803','60810','89707',
                          '49617','84690','88639','37376','85796',
                          '78042','11607','76870','16174','53102',
                          '75970','86621','17242','74695','96600',
                          '10255','88748','66217','18799','35148',
                          '61667','13108','25803','81317','31019',
                          '36302','99428','20730','28959','57739',
                          '12844','13137','16256','64502','37933',
                          '48645','40445','21071','15135','57526',
                          '79648','54260','99531','43282','82867',
                          '16314','69379','35885','13539','33036',
                          '89294','53503','65447','82711','81961',
                          '27554','64308','98835','49262','67621',
                          '92943','45787','55360','91873','32197',
                          '13960','57628','58205','68323','42931',
                          '86908','31610','58189','97288','46979',
                          '10011','81312','44458','76171','62225',
                          '92253','18317','93225','95242','64030',
                          '31376','13148','78275','25292','38844',
                          '50033','84989','86754','99824','13755',
                          '95147','12123','16823','98395','82386',
                          '85561','46821','98334','29748','36666',
                          '54265','99231','78986','87309','30143',
                          '91432','99841','67563','28994','64527',
                          '83319','36860','13616','26776','18979',
                          '24464','46269','98836','65331','32288',
                          '77597','24251','61073','25256','90258',
                          '94288','47405','83692','60178','51002',
                          '31399','54284','85702','41730','72389',
                          '38474','63357','20807','32118','21044',
                          '60133','22223','82793','21873','45138',
                          '44357','16291','98381','14080','25005',
                          '67461','17333','59977','91912','25520',
                          '44017','88332','53792','61075','51587',
                          '62872','74874','31254','54324','60781',
                          '61923','43728','21360','40376','65898',
                          '71469','13117','68769','73184','47500',
                          '63497','41306','92552','93096','61944',
                          '78666','90518','60058','32577','71219',
                          '75459','89119','69992','37474','87624',
                          '42935','66558','77370','46213','13036',
                          '33141','44220','82483','48147','38773',
                          '54800','16829','55898','79245','30184',
                          '51590','28343','75263','80028','18290',
                          '95093','11965','23727','60534','42216',
                          '19903','63359','60662','29944','12199',
                          '47650','29763','81324','18373','24048',
                          '80959','81199','14566','58362','17067',
                          '29051','52310','23345','95985','34201',
                          '53971','12480','92052','49442','42138',
                          '60196','79677','63040','96735','21814',
                          '35901','22318','23672','29952','31027',
                          '33396','63178','29860','24887','99906',
                          '97516','28844','32956','18032','52493',
                          '21707','99427','85766','34248','51367',
                          '41048','27483','85882','60180','78458',
                          '66051','68426','94340','14490','42060',
                          '95395','19195','47702','26379','34075',
                          '21888','78762','82415','65180','59776',
                          '32727','88532','29979','74273','79175',
                          '43672','10159','25038','15736','30177',
                          '25115','67204','50763','12162','54714',
                          '45432','44656','43989','83480','89072',
                          '77737','66933','45808','81744','63567',
                          '39961','82557','93549','28352','21232',
                          '86689','83860','93112','54853','30696',
                          '24763','54358','27154','19720','37638',
                          '74110','69952','63835','47477','22445',
                          '27394','76947','22539','91015','35163',
                          '88992','26929','77873','74799','51735',
                          '45565','25031','30630','84956','49148',
                          '78760','55006','83414','61992','13126',
                          '56896','11173','24732','13495')
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

