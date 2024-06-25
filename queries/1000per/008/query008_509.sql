
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
                          '76405','52748','22563','77270','32872','47749',
                          '46336','10013','79830','70953','88742',
                          '90743','80958','21021','39982','98516',
                          '30126','89390','49626','70510','44701',
                          '58687','85140','45769','82237','67791',
                          '43031','99461','98648','39802','47760',
                          '74470','89925','54314','22209','54906',
                          '50656','61929','16263','14393','65463',
                          '47784','86931','89568','23574','96970',
                          '31114','25358','28221','50302','97735',
                          '71641','94931','78302','25812','40418',
                          '86368','88837','91443','57146','14906',
                          '76442','52515','97427','92232','15858',
                          '94209','92275','78845','65899','58896',
                          '64378','11654','70286','52229','96249',
                          '26280','30934','72223','77148','19909',
                          '92341','45574','45563','17453','96734',
                          '69495','41333','39767','63796','47236',
                          '93174','12183','17725','87395','55758',
                          '28641','60139','17820','24669','99200',
                          '57974','36934','81789','72469','87197',
                          '95859','65516','29886','66278','59447',
                          '65691','44573','66196','20548','80083',
                          '49629','44883','85840','79755','75328',
                          '27970','51251','24019','34231','75879',
                          '79806','89231','37667','74054','53376',
                          '75503','32802','14810','97573','47094',
                          '14837','99368','86525','22083','33984',
                          '16368','60041','60907','73309','55134',
                          '76841','66828','56644','89639','94531',
                          '13606','61781','79835','69039','20224',
                          '33572','38147','39430','59171','42654',
                          '10002','96310','17743','80684','62902',
                          '24049','22987','11185','43270','91911',
                          '57382','27850','88843','50039','90583',
                          '86610','82270','26166','83106','59980',
                          '53828','64229','13320','93286','98592',
                          '10966','75413','16230','83390','20454',
                          '63221','35781','84149','14556','62800',
                          '22920','56744','85019','12362','36565',
                          '19632','88250','60266','99388','29241',
                          '46585','40105','55532','30724','26937',
                          '14251','31644','42842','41494','90676',
                          '47277','80041','59924','55669','80655',
                          '19524','20639','52970','16448','20978',
                          '62557','60921','92512','37715','28805',
                          '90244','98540','66757','89254','82411',
                          '32989','52186','91201','29332','30598',
                          '82441','60159','98697','80305','64374',
                          '52978','78929','26821','23056','87887',
                          '57744','20574','58383','89490','65433',
                          '11800','82117','95022','19060','26772',
                          '53847','37697','38021','14862','11377',
                          '20903','73728','38318','39885','26727',
                          '68166','75872','83968','26373','93528',
                          '23507','88229','73394','26298','99983',
                          '25122','26315','96509','90162','75068',
                          '19992','89516','65923','79041','99933',
                          '81405','34219','42401','45276','65230',
                          '65572','40973','20049','41713','28684',
                          '97562','17933','85031','24332','52224',
                          '71120','64473','86262','42592','22543',
                          '56583','55970','97216','98920','91111',
                          '78066','92143','99760','98219','73904',
                          '17218','19813','37757','10371','32703',
                          '34538','86105','74284','36094','72292',
                          '91853','45786','41804','55629','86754',
                          '39165','69698','16303','40284','50423',
                          '36523','58818','17152','26222','91137',
                          '29222','12456','47135','39945','49677',
                          '37098','85086','35258','41882','94661',
                          '18874','10886','91659','90060','97789',
                          '88652','40469','13369','72335','57593',
                          '93087','67354','48137','93912','94621',
                          '33905','79357','43153','98274','72051',
                          '15004','43689','60768','46242','83169',
                          '79694','68482','70020','86177','37058',
                          '58788','79655','77291','94039','20314',
                          '63042','82129','19556','91757','49857',
                          '54979','81649','11001','66322')
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


