
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
                          '83541','69665','19156','75312','74239','56331',
                          '92375','53753','47360','41881','28124',
                          '40519','54641','94813','50683','70455',
                          '51976','91674','89463','26114','64658',
                          '93349','85786','17245','67442','36529',
                          '46225','20989','78482','80853','95987',
                          '41016','87219','87649','44172','91006',
                          '84550','10537','98851','26115','28658',
                          '97391','34987','70163','46608','36816',
                          '60966','88384','22490','87262','73051',
                          '31519','85040','95605','34071','61981',
                          '48830','43692','74240','28924','99430',
                          '61615','56200','39762','38366','60278',
                          '78723','80072','22685','61141','19187',
                          '59443','70315','70620','11864','48602',
                          '36802','59723','33384','54459','14896',
                          '11827','35751','51885','16973','66386',
                          '32311','95734','85249','55533','16459',
                          '89970','71157','39949','51669','45802',
                          '74108','84631','93777','50007','44643',
                          '64632','92803','22991','56046','17761',
                          '61382','11582','38452','82468','46300',
                          '32379','79153','60255','97811','39546',
                          '99073','36335','19159','51944','71748',
                          '21542','77827','62166','68867','94209',
                          '65926','70004','52473','59184','11703',
                          '46902','31505','68679','54344','46407',
                          '20540','57328','96460','73741','73678',
                          '31974','19129','42278','12010','29323',
                          '30624','68707','54444','57484','52947',
                          '58096','97090','61073','33908','55638',
                          '40552','91706','71538','20100','66757',
                          '43746','94490','37532','31939','64414',
                          '40388','27372','82745','92667','81082',
                          '91218','78747','70501','57264','44275',
                          '76742','35258','64204','37859','99759',
                          '34411','44913','21305','66841','36682',
                          '77682','69209','65866','35965','10883',
                          '31615','95043','57034','75940','27820',
                          '47599','30607','95438','57761','62644',
                          '42709','83871','26699','86343','16620',
                          '82279','19115','40598','65307','92848',
                          '48286','93809','92186','29656','68354',
                          '76192','27885','70778','81525','58223',
                          '78791','23616','13260','11530','35407',
                          '13103','73215','35000','15749','43391',
                          '89977','76970','92727','71333','36748',
                          '17363','67936','63926','94875','45282',
                          '74581','47810','94079','54489','11748',
                          '81040','71406','44278','87370','83292',
                          '11920','88653','70426','27530','56502',
                          '21982','23924','10420','83912','37785',
                          '57696','90875','64597','62915','60213',
                          '15296','49569','13234','94311','93817',
                          '33575','61101','49707','56322','30228',
                          '50439','66607','80805','43935','10236',
                          '66355','99116','59067','49372','29610',
                          '65747','36873','89054','71732','13913',
                          '29330','61286','33823','59355','19594',
                          '50487','41061','95020','16421','73285',
                          '74821','53597','32951','48133','33364',
                          '40094','38663','36470','59561','20769',
                          '50294','22491','42819','21839','57940',
                          '41678','14643','55698','41829','46795',
                          '40069','52085','24651','85115','35174',
                          '81804','14790','59531','55629','36237',
                          '61265','18457','75223','50651','73661',
                          '79743','80669','84492','11562','90779',
                          '67239','46935','54622','85083','20866',
                          '61213','24284','91646','30569','44590',
                          '39688','85591','95090','16456','14540',
                          '20926','42050','17123','12839','97590',
                          '98162','28357','53043','69094','60451',
                          '14898','41830','57863','88066','24921',
                          '18671','15850','92398','36467','99386',
                          '65496','18856','73450','18696','39494',
                          '84875','64988','82923','96378','91091',
                          '85457','67878','39710','26447','33450',
                          '43953','26339','98981','89457','80282',
                          '39768','80304','13537','33846')
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

