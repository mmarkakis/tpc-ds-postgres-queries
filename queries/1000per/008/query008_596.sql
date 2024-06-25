
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
                          '44965','94554','31141','16345','67736','88082',
                          '29140','45671','13302','68028','26520',
                          '77953','56620','84111','77742','93553',
                          '28279','63451','35856','32566','78810',
                          '43492','67254','13508','90341','13218',
                          '83678','48615','21411','37307','79797',
                          '27110','12238','35348','60748','75965',
                          '84791','86133','23632','10545','74184',
                          '97524','95379','96834','67927','47280',
                          '37079','64140','70208','88299','79497',
                          '21765','92518','23977','47715','28880',
                          '91384','14210','72034','83332','58250',
                          '65425','10329','89297','28416','37798',
                          '66428','80389','58503','28951','82807',
                          '59455','90328','17366','90807','83122',
                          '55612','94019','59354','27937','50966',
                          '10207','45411','39700','49373','93512',
                          '63584','16943','77340','84419','54601',
                          '87205','54065','85857','43319','60399',
                          '82741','16678','15649','30322','84494',
                          '54343','49889','66468','64652','10390',
                          '38624','96435','88620','99213','83337',
                          '48933','11092','41551','29804','85429',
                          '47460','87144','89382','48232','70805',
                          '64317','44023','16427','77326','98845',
                          '28743','98536','36619','49700','90062',
                          '31870','90831','58672','86428','32930',
                          '19329','89437','93805','57980','14515',
                          '19900','32792','89318','68664','63565',
                          '34357','91309','53738','25808','96066',
                          '42072','71318','56237','71526','75338',
                          '35201','60741','71516','73031','86650',
                          '48644','48869','86402','61793','19272',
                          '24729','81844','28664','86008','72886',
                          '84365','53559','76824','55012','29554',
                          '78934','63538','97222','39519','20491',
                          '37872','83468','36089','99714','68817',
                          '65999','45177','84133','18337','92972',
                          '25048','96482','40251','58806','11830',
                          '99207','77460','51714','29262','36296',
                          '79489','51153','53794','91681','67831',
                          '35933','48227','33549','10280','18569',
                          '40489','56608','43028','39301','49591',
                          '41230','97396','95677','64474','78658',
                          '35373','77646','21850','38706','68387',
                          '95895','18535','57883','98308','31179',
                          '18021','62818','56365','19632','84352',
                          '53728','92612','67577','90601','11645',
                          '24172','87902','24098','19866','59142',
                          '49574','18465','69265','32985','15762',
                          '13100','18607','28192','80513','56463',
                          '28868','39331','65797','63471','40230',
                          '61657','64730','70670','54946','46574',
                          '91639','14053','90198','38253','29856',
                          '31048','46236','65866','48303','42649',
                          '34425','61139','92023','90521','92892',
                          '38924','42262','14583','18132','68389',
                          '39426','67651','11201','79457','85623',
                          '83141','64637','64072','66747','42418',
                          '51038','12214','25791','85527','80399',
                          '25650','70701','18680','94203','64330',
                          '19731','81057','94292','84705','66437',
                          '78326','53105','60451','94829','11547',
                          '16551','50120','47954','20981','86825',
                          '29996','48203','81572','71289','98679',
                          '47815','73184','16107','41979','25094',
                          '83716','54557','24800','78572','69104',
                          '94730','87249','38870','67261','33021',
                          '27058','22217','59742','24690','58932',
                          '11378','46591','43403','22759','65009',
                          '12229','77116','71355','50238','47796',
                          '85378','87429','13055','83661','45757',
                          '18306','39178','47795','25476','36128',
                          '20414','27396','82805','66663','54182',
                          '83564','44872','31354','70132','15060',
                          '45593','48282','87211','67638','13483',
                          '30194','95341','78023','92671','46427',
                          '36899','26639','71303','29149','82856',
                          '75968','69261','13612','26032','12969',
                          '63952','23471','40314','96225')
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


