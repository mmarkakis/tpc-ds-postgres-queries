
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
                          '12369','82303','72754','81480','39576','57376',
                          '26265','20454','79477','62575','21942',
                          '44881','58473','82807','17127','49113',
                          '83097','71836','77313','88024','10525',
                          '57766','36773','74160','45576','32463',
                          '78726','98219','65228','15582','44309',
                          '72785','94237','30397','68863','62386',
                          '21894','38979','31954','42964','69523',
                          '73174','32028','50802','18046','36837',
                          '57694','24180','24434','56543','82679',
                          '37180','38860','34922','60196','89724',
                          '42848','26043','92699','83826','85487',
                          '34394','11711','25163','13748','30633',
                          '49914','79010','60190','29018','50184',
                          '51226','36185','77522','24788','40403',
                          '88111','62497','62861','61918','34077',
                          '18091','44366','27795','88627','34744',
                          '97291','12073','65593','42722','31772',
                          '76463','80947','61192','82372','97073',
                          '92951','46720','84987','57630','72326',
                          '56938','36661','48634','43257','57036',
                          '63945','16605','63106','49343','61679',
                          '11068','45896','30843','27645','75063',
                          '49531','35243','10953','30619','88291',
                          '69538','43738','64293','82783','18169',
                          '91592','53156','56137','99053','33787',
                          '66472','33861','15576','88395','72053',
                          '38214','20493','55454','67296','17767',
                          '80263','60304','95461','65286','30237',
                          '90022','34516','89632','33682','56811',
                          '28048','46928','17077','91234','79213',
                          '76733','23726','24927','80103','15490',
                          '38262','47731','10838','61584','28621',
                          '97348','50137','48429','47815','58749',
                          '40164','14633','45368','43998','66258',
                          '37297','15607','91364','85730','23699',
                          '54157','79894','62581','17032','23737',
                          '73077','13979','24737','84708','76160',
                          '23246','21164','30077','72434','37379',
                          '90443','77551','20581','13271','38163',
                          '99835','91366','65050','93756','75272',
                          '31550','99001','48858','49084','63547',
                          '76345','21330','17865','39986','39895',
                          '75976','19534','83724','28928','95988',
                          '25594','12031','23433','46894','58563',
                          '70211','72324','70918','76834','26950',
                          '84210','21070','15107','55349','75290',
                          '57613','95532','24088','15235','19103',
                          '53446','69348','95091','63519','17679',
                          '79034','64803','83168','99485','10342',
                          '92696','63037','63917','70091','28430',
                          '21196','63242','44944','24299','17457',
                          '92917','23911','96727','42289','71059',
                          '76507','45056','71455','46319','39772',
                          '80221','38349','28706','43722','30291',
                          '78937','44492','47576','37134','13233',
                          '56743','68080','10843','28026','61905',
                          '88453','95134','87408','48665','46614',
                          '29507','18096','86431','57627','29593',
                          '27881','46362','92364','15376','10063',
                          '93921','24067','74167','29181','76712',
                          '39735','34687','91062','99643','66921',
                          '73784','70967','41485','21975','42370',
                          '39702','19339','23824','77175','33823',
                          '40076','33656','11667','10558','94467',
                          '26084','77835','66312','61579','21069',
                          '62147','12107','18461','99060','66915',
                          '47818','48635','82821','46229','76621',
                          '84330','56499','16104','86948','87384',
                          '24411','66100','27980','77923','12146',
                          '95267','65488','50340','24371','59603',
                          '24128','35566','27858','35798','46631',
                          '31448','51875','96704','45315','69807',
                          '53775','36775','92455','77121','41686',
                          '37595','65395','25006','43205','68884',
                          '21420','30152','76016','48955','87380',
                          '26498','22438','50185','71899','44200',
                          '50575','36637','40684','39117','26496',
                          '48104','36267','22584','87189','94920',
                          '60515','31651','37760','78974')
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
  and d_qoy = 2 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


