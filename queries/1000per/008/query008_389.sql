
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
                          '64235','38163','57859','98090','33542','79727',
                          '94799','69552','20727','21953','20873',
                          '75079','51465','20978','64557','49731',
                          '73662','72122','38941','97203','21617',
                          '71083','81143','61592','30890','38044',
                          '89059','26093','33677','65120','18100',
                          '32967','25845','35450','43981','19861',
                          '58616','77273','97155','78265','90222',
                          '41289','66552','15242','29860','12548',
                          '70590','99774','76962','59159','21252',
                          '50671','84331','71891','18835','96691',
                          '59089','13328','28610','93628','49224',
                          '42296','14459','38754','23582','74940',
                          '31499','91797','21510','61523','32159',
                          '80812','25288','96203','93339','49400',
                          '78256','30224','41396','12517','50935',
                          '75786','72071','71426','63258','95617',
                          '94110','15574','26175','35738','88147',
                          '85339','27555','87733','48908','80833',
                          '28765','54880','25007','76348','45384',
                          '13329','40524','30440','32918','17835',
                          '27223','36433','76701','71681','86376',
                          '57260','72312','46156','52956','15868',
                          '93651','41661','43269','10749','33736',
                          '73088','87656','38832','88552','63860',
                          '94113','86496','58317','26914','85371',
                          '29465','79839','23569','51779','10348',
                          '27246','36106','85605','53615','47056',
                          '10850','88242','95219','89423','40658',
                          '47880','27353','93016','94135','68817',
                          '56053','56770','32174','14585','64817',
                          '34996','41274','88921','34684','97244',
                          '52517','42548','93053','46760','33522',
                          '66173','61909','72886','77360','74802',
                          '55821','13761','10664','67659','84243',
                          '33445','73179','14988','47666','11100',
                          '34836','13943','42290','22208','35129',
                          '86438','68217','31898','49678','24733',
                          '21118','85359','56251','95700','21406',
                          '14240','50218','33164','38208','79469',
                          '36603','56566','96376','25452','26913',
                          '68308','22666','56636','49884','34030',
                          '40946','68840','93808','26250','67738',
                          '83417','43750','22967','53840','21636',
                          '15773','10208','61252','21793','36650',
                          '19915','41238','91181','89711','68590',
                          '31751','11617','70866','79602','37940',
                          '90632','45581','25724','60304','97696',
                          '35842','80078','91133','68353','34856',
                          '38734','96735','22810','16888','70938',
                          '43149','50580','35331','98902','23410',
                          '50394','35284','57139','21901','24751',
                          '85517','14738','40856','20666','68024',
                          '59860','82832','74669','82585','82447',
                          '14566','46679','69235','71446','54024',
                          '60227','18886','43196','35583','20513',
                          '73133','33781','49829','26005','72082',
                          '72323','42509','56067','93816','27070',
                          '73804','11452','40866','12644','83941',
                          '63113','32306','92533','67455','32323',
                          '34379','25251','38196','68696','90661',
                          '17230','69725','23990','55138','45831',
                          '44506','70447','60190','16518','29043',
                          '46612','16928','99320','93697','59233',
                          '10421','92585','50151','49740','30175',
                          '10146','33482','32689','62361','86965',
                          '13100','93281','50657','26764','38721',
                          '61082','69400','49226','59804','39956',
                          '42228','51767','79601','39096','30603',
                          '15812','90227','41455','74140','50950',
                          '35092','79533','39129','64364','25476',
                          '83818','50215','12382','84431','85137',
                          '32854','45491','65856','13886','52626',
                          '68886','10936','84908','30815','14808',
                          '66602','15361','90535','19381','30707',
                          '26977','82607','27176','26045','39748',
                          '97287','91692','14498','93486','43113',
                          '85589','56281','10206','35777','79384',
                          '63791','65715','59506','51669','64884',
                          '29120','55102','50944','18762')
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

