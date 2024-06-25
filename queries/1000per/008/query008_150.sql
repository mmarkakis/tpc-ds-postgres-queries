
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
                          '42125','33114','24921','46385','56335','43956',
                          '15225','95705','81559','69389','46695',
                          '40473','31597','87726','12401','23069',
                          '80119','80011','61939','68228','34811',
                          '90120','98856','32395','43271','82850',
                          '27643','51514','59383','64773','19768',
                          '19782','24716','96562','39949','32375',
                          '64511','31705','96002','88940','18299',
                          '93820','63613','18827','22853','93946',
                          '89470','32053','12968','18334','77015',
                          '76854','28128','80731','57643','21627',
                          '97287','29656','33235','88797','41543',
                          '22081','22962','27800','32911','13106',
                          '86478','43865','80133','11459','35009',
                          '75786','77292','35776','21431','14621',
                          '58475','12630','44746','31539','78093',
                          '44687','71428','45351','33622','17494',
                          '41114','19172','63971','73243','99420',
                          '51800','74367','77540','94173','13286',
                          '83759','48126','81924','90061','11964',
                          '99414','32729','80768','63760','66095',
                          '43024','91296','60158','69540','22582',
                          '98946','78878','24247','46563','21462',
                          '52149','59818','56495','37850','81378',
                          '79473','93090','97788','12497','96375',
                          '47189','26942','40913','86532','77530',
                          '89114','74377','86779','64647','38649',
                          '95063','65051','30346','57802','38142',
                          '48297','95252','45828','18200','21310',
                          '97854','67306','94673','21692','86730',
                          '49589','59026','70808','87690','83587',
                          '72293','83335','99575','93456','38818',
                          '55408','87542','88647','60540','92268',
                          '45347','45484','43345','57600','52481',
                          '22247','80459','14823','10727','73724',
                          '95824','46832','22237','43901','81439',
                          '23917','19972','34255','70477','76030',
                          '98158','93914','71456','20909','90702',
                          '91875','87424','83782','33477','83792',
                          '40776','88778','62017','96742','11149',
                          '94733','24139','32428','72077','25848',
                          '89844','14528','93885','61506','38627',
                          '13190','86049','67789','11158','31953',
                          '55918','54363','39248','74425','56229',
                          '30645','36576','99188','76280','21108',
                          '89634','12164','29260','29107','54700',
                          '24734','73828','42740','36153','15119',
                          '47027','71874','35889','82370','86619',
                          '27450','49091','66957','71022','55927',
                          '59131','95833','20029','56890','92921',
                          '71849','28520','98273','31121','68344',
                          '42402','91724','71226','53194','93730',
                          '95026','41757','14195','16784','65741',
                          '70522','38809','95663','23037','78845',
                          '17458','30278','52212','97022','53356',
                          '57416','51440','47448','95400','31609',
                          '41463','63723','53236','53599','87660',
                          '25490','66947','45408','16674','72799',
                          '16350','48644','19245','60987','96672',
                          '76424','71385','94168','10487','75005',
                          '46490','20636','29105','49905','61654',
                          '31305','68491','73959','96464','40637',
                          '97741','58137','67584','99852','41345',
                          '91452','82022','27324','83625','42703',
                          '51430','17060','10428','71361','22606',
                          '28815','81634','47899','17084','67178',
                          '21901','15771','89202','27859','98840',
                          '66760','98838','83812','35736','32880',
                          '15052','74018','22610','62171','17814',
                          '97624','93907','20514','82043','36526',
                          '51906','99543','31461','79252','48698',
                          '47298','24903','47044','12025','89074',
                          '82800','49688','13840','43912','59323',
                          '55191','93797','77524','84066','64167',
                          '71352','48980','90164','91951','61850',
                          '30270','20474','34949','69854','97297',
                          '34258','84567','19261','27368','10877',
                          '84755','10664','28459','66682','58867',
                          '40007','49308','31032','16392','75963',
                          '50654','63947','95225','49595')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


