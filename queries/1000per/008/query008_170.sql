
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
                          '11612','13112','50409','67682','17763','95948',
                          '49284','61605','68350','55152','60388',
                          '64652','20266','52135','25894','47292',
                          '67474','50421','11818','70837','51002',
                          '22308','98229','87007','16360','52008',
                          '44482','22297','76364','66736','98516',
                          '57308','76974','52748','66412','30017',
                          '56758','47062','94010','82891','27085',
                          '60658','30798','41950','92101','56916',
                          '39805','88539','31650','99767','61803',
                          '88467','52255','19096','37270','10437',
                          '67303','54316','52904','39973','11245',
                          '18585','44553','97285','81059','91352',
                          '18536','74912','84731','84893','94888',
                          '37032','70012','94199','38010','79970',
                          '72033','27845','89886','51954','96462',
                          '54720','64749','52505','99069','40732',
                          '51391','90700','84911','95742','33433',
                          '70348','94480','86703','44857','77000',
                          '68004','53102','83516','95189','22608',
                          '70888','64315','36702','10540','55629',
                          '40261','39750','28666','95448','37951',
                          '11045','25228','51499','27232','23045',
                          '36075','52555','24243','60071','64317',
                          '42258','62223','45712','19092','83720',
                          '62425','54001','17490','24336','61308',
                          '53903','70736','92857','26069','88865',
                          '98576','52976','78487','42186','42116',
                          '73939','92393','62453','86659','18534',
                          '14753','58657','11810','66996','11267',
                          '74448','79375','94956','76579','12365',
                          '36138','14651','56291','14529','12377',
                          '20968','67111','85733','88807','55773',
                          '60495','77930','14240','91477','52796',
                          '40153','10958','13811','96043','42858',
                          '47891','78314','62960','49433','36069',
                          '42774','95898','22238','16656','13597',
                          '60000','22374','32887','10768','98123',
                          '45529','98170','50030','15402','30736',
                          '90709','65462','10103','39813','63336',
                          '19994','14563','77968','83565','70189',
                          '11545','53834','92724','34714','46582',
                          '63410','37017','49633','21429','22578',
                          '37238','75772','65426','46464','89819',
                          '87857','72270','80138','36874','91614',
                          '39709','59244','18742','70953','74231',
                          '86781','45541','90365','42177','74631',
                          '52708','78226','29872','50372','13509',
                          '34966','10669','91506','20556','98617',
                          '82263','98766','89944','49718','67497',
                          '92261','68940','28229','71875','56210',
                          '16440','92098','68083','86576','34477',
                          '61527','21045','79528','50877','43757',
                          '25415','26928','57159','30708','79052',
                          '82731','42265','29578','65705','29418',
                          '78299','52866','81981','70815','25689',
                          '78678','82449','23211','30232','86072',
                          '22171','94159','33240','76077','88724',
                          '31006','70458','31072','99988','79519',
                          '98241','49469','77974','63185','26140',
                          '86537','73115','95317','64290','74063',
                          '53778','75726','19123','36422','12220',
                          '38958','29498','79935','53332','28752',
                          '95736','50391','91603','22255','69208',
                          '47320','86302','61427','59810','19719',
                          '88802','84510','14740','50948','88487',
                          '73675','76289','85005','50519','46240',
                          '87788','83315','78429','75938','91540',
                          '25946','46633','13122','94968','55274',
                          '41990','91593','30081','37931','67344',
                          '66204','40850','42463','13793','64100',
                          '64841','57299','45227','89041','13139',
                          '81325','23148','72495','72131','88030',
                          '31647','82080','84203','13501','78876',
                          '54158','90126','65489','71982','90137',
                          '12423','74725','64763','64267','20918',
                          '67332','25553','23357','27430','38530',
                          '79841','60718','24186','38102','50799',
                          '80016','50065','26327','28530','92398',
                          '58764','35114','33838','73812')
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

