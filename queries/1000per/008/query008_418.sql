
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
                          '66979','21367','68702','18196','80467','74457',
                          '19580','33666','34764','32178','41204',
                          '61069','48613','16221','99925','26280',
                          '57188','64243','35186','33103','44334',
                          '74823','32175','89932','63333','39177',
                          '56742','17114','76402','80366','23265',
                          '97212','28486','66902','30758','68599',
                          '99923','81827','48855','85264','48447',
                          '90254','57463','17728','11588','71065',
                          '19845','16100','35094','59815','73520',
                          '16035','12220','17798','38896','41961',
                          '24917','90933','59483','84302','63447',
                          '35303','87277','38703','37109','71598',
                          '25517','74348','27550','52420','55842',
                          '11978','71268','59152','21815','83256',
                          '15770','94980','58130','17952','11233',
                          '19513','93046','31065','10368','18914',
                          '68357','61400','75857','47868','43335',
                          '59921','81696','14797','50290','92607',
                          '33661','41845','46003','38260','13892',
                          '40437','46106','67311','68476','97133',
                          '87798','37633','29407','93651','16730',
                          '50840','87184','20147','10112','36936',
                          '65641','25759','45875','36070','95610',
                          '25083','21668','55604','93056','29289',
                          '35978','16148','85579','84436','37626',
                          '35957','10571','59747','57080','99374',
                          '18457','27904','57531','64162','41471',
                          '79736','58236','19014','98276','16964',
                          '21530','21144','96032','18694','41650',
                          '69476','11141','57766','17399','70691',
                          '47122','53688','85583','39971','72307',
                          '22563','16200','83927','42338','38317',
                          '39049','44768','78847','98975','94377',
                          '33236','68228','63892','98550','49082',
                          '61204','66713','21578','83704','53515',
                          '44261','99295','49707','48692','83651',
                          '34510','63064','29530','59332','16661',
                          '52977','79104','14342','64216','79296',
                          '45520','21460','39890','39011','87976',
                          '40765','18618','49592','43178','60780',
                          '91025','93025','39290','27683','95392',
                          '37468','79057','53913','28235','23607',
                          '55510','32707','72398','19196','92136',
                          '55589','34466','75654','12679','78041',
                          '17068','14504','51232','15189','19379',
                          '95598','82773','36584','52464','22128',
                          '71011','32671','63553','33897','76294',
                          '48812','63178','83625','35789','19622',
                          '98923','76654','19093','28655','15902',
                          '30979','39759','33729','35301','40082',
                          '51932','19965','10285','14315','15325',
                          '97194','99301','14260','13286','65682',
                          '17327','56162','70191','11649','68793',
                          '82838','33176','12112','41860','96356',
                          '73026','26889','35050','90604','43566',
                          '15419','38070','79325','52902','85530',
                          '66192','68213','19405','28669','96759',
                          '57147','57204','57946','24451','46530',
                          '97432','36924','78074','33862','26466',
                          '99150','26115','22998','48279','91931',
                          '25045','78557','40855','50693','66171',
                          '49638','70483','50233','48466','22768',
                          '36390','71097','59925','65721','41556',
                          '64123','18640','53437','29071','88199',
                          '15756','81185','21698','50385','75456',
                          '85906','25736','69113','97577','42195',
                          '20842','94726','45165','17446','70387',
                          '91057','13302','47818','64260','26150',
                          '19708','12148','95139','99494','41777',
                          '29636','17647','14858','53099','98814',
                          '83328','41399','48742','21143','67172',
                          '23030','40083','16191','89521','54166',
                          '33876','99581','58698','26527','92513',
                          '96197','98066','83736','61344','60045',
                          '69849','26538','51344','43006','77927',
                          '91576','36715','78906','25576','37730',
                          '72259','22360','89049','24630','26704',
                          '32142','92532','70586','40380','98504',
                          '46144','44278','33519','86712')
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
  and d_qoy = 1 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


