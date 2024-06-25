
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
                          '87629','28635','62872','22508','15694','94287',
                          '15860','56299','14135','66172','20791',
                          '40731','58030','31585','40528','11475',
                          '65599','38905','12997','49705','72694',
                          '11247','14600','22292','37050','25760',
                          '83065','92071','66903','61542','16106',
                          '82329','26704','41956','14249','81916',
                          '33366','17590','37257','24318','54782',
                          '45791','85575','42554','20996','56154',
                          '67532','15326','37572','39541','76064',
                          '38701','48109','80931','21721','26214',
                          '91184','70436','93228','97380','39624',
                          '77639','37922','11307','52527','98068',
                          '15602','93942','93906','71597','65567',
                          '34439','29484','16912','47764','38006',
                          '49468','50127','91293','13733','81777',
                          '26107','83486','20888','90847','30267',
                          '70401','88061','78656','65426','53822',
                          '40789','56024','10464','19166','57851',
                          '40028','40716','30923','52232','54075',
                          '93330','60043','22907','86666','20336',
                          '91227','33018','63487','66104','47879',
                          '58358','67381','42692','43926','44513',
                          '35533','81192','51107','98330','10825',
                          '65441','33898','67841','89631','55537',
                          '27200','91118','64718','42181','56061',
                          '13668','14555','61164','66937','21901',
                          '58969','98765','39252','82704','20269',
                          '30002','42367','89684','56498','66649',
                          '87387','72535','50434','46161','95658',
                          '22211','36807','46315','22321','24161',
                          '38939','75913','38698','59307','56001',
                          '67481','93967','29977','14611','21625',
                          '67675','21388','35780','88500','21168',
                          '52982','98258','17174','30143','89375',
                          '10238','49202','33054','67533','40966',
                          '67455','38004','18472','92918','13480',
                          '48557','30808','22493','75140','10476',
                          '10543','70653','23765','68045','60297',
                          '31864','13720','80455','49947','25259',
                          '97020','20162','99625','36309','62845',
                          '70535','50672','12734','73342','16923',
                          '80941','28766','37774','77598','45627',
                          '43460','57536','10016','11940','18235',
                          '77421','97776','19844','61245','94283',
                          '92589','55266','27028','64596','78218',
                          '49738','72807','76363','80499','96626',
                          '47351','80090','45302','88952','36736',
                          '26870','55230','43549','97535','92580',
                          '73177','82001','51623','67736','61078',
                          '40466','67436','71569','45655','55358',
                          '52690','33645','73432','83104','42422',
                          '94597','41317','75362','64927','56535',
                          '23788','19160','83046','79328','19312',
                          '84468','93414','50144','82362','48793',
                          '46007','66012','29375','40705','23069',
                          '93784','42466','26789','16421','84451',
                          '81043','37807','65379','42382','61125',
                          '13866','10210','10667','50664','80755',
                          '87036','65942','89942','29232','36419',
                          '19963','74071','97988','91767','66528',
                          '69754','82973','17318','58584','86836',
                          '88038','88282','66726','63005','81000',
                          '30111','36000','50930','52893','36562',
                          '63750','19107','67884','80747','92197',
                          '48611','68654','66849','39919','19086',
                          '56339','27276','13403','57082','95482',
                          '43084','36962','98182','95504','71787',
                          '55242','93875','78543','17288','21117',
                          '32289','94486','37381','86640','68356',
                          '20539','24187','70236','14755','10150',
                          '62202','80197','81951','95266','58718',
                          '10446','86946','92057','96860','55895',
                          '71254','54929','67901','80638','52165',
                          '90995','11609','74758','15026','20400',
                          '98229','96176','74765','31549','72665',
                          '27428','20049','91403','27997','66031',
                          '46060','64698','34602','46684','32357',
                          '29587','23437','98625','40512','84971',
                          '65758','30372','79104','34978')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

