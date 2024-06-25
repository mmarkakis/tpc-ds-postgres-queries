
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
                          '92892','51273','19566','40580','92280','64338',
                          '13199','41825','42664','29570','42920',
                          '56930','44498','99065','70363','57040',
                          '48488','56913','95307','25453','94643',
                          '54674','65316','94379','70693','82801',
                          '98872','24742','66059','30890','27927',
                          '76126','33369','29460','46279','53705',
                          '43357','52641','65776','18450','64566',
                          '87830','12960','70489','98425','75658',
                          '56211','54363','92830','91693','27457',
                          '18362','94945','60468','12965','68805',
                          '36997','97993','15984','92660','33081',
                          '52068','57507','53782','53140','29856',
                          '91611','84379','87369','52076','68856',
                          '20134','27262','93787','48031','27745',
                          '56279','16637','64004','50709','19284',
                          '76238','27605','25840','72969','11740',
                          '71416','30137','79591','50981','80202',
                          '55262','63316','77551','19569','77996',
                          '75628','27960','72200','27972','41152',
                          '73488','91551','53188','36769','12378',
                          '25814','82892','16455','36404','95324',
                          '59346','57749','86413','58645','16632',
                          '76342','13818','67038','89103','19974',
                          '92512','94287','59016','45684','96095',
                          '63704','80211','85378','60520','94459',
                          '35699','21514','19553','62960','22443',
                          '26541','36806','81896','77496','74731',
                          '52129','66405','68996','30059','47654',
                          '13935','85057','73387','56531','68903',
                          '26456','12573','40533','56633','97614',
                          '77018','86866','57758','77628','36027',
                          '70611','40756','38506','91620','66113',
                          '95498','93359','21516','26869','33635',
                          '33911','33916','50560','93166','18997',
                          '56340','88357','32579','67515','47603',
                          '74823','20689','54868','10881','47972',
                          '55302','60703','86088','37249','88166',
                          '50785','63290','22763','40548','39655',
                          '62421','26767','69601','71417','62557',
                          '78162','62184','43245','28288','29006',
                          '74520','59667','89953','28897','78196',
                          '14800','51233','39843','85291','84576',
                          '81559','23162','51336','36489','20001',
                          '22855','16258','66024','96840','50649',
                          '38374','14488','63420','41349','59814',
                          '72861','30498','68122','27052','86065',
                          '17114','57605','23370','47099','63723',
                          '82657','46931','39124','52265','14887',
                          '81621','17249','34820','31288','76850',
                          '75864','88263','74219','27655','79382',
                          '40871','68327','49640','92885','18924',
                          '89784','93358','94228','72201','12879',
                          '71044','16375','57767','50482','30405',
                          '11018','97236','26288','94810','38100',
                          '26799','59209','19141','40581','90100',
                          '57552','61507','31710','16039','67935',
                          '90590','57485','77213','74236','38539',
                          '84597','39513','79316','89467','87824',
                          '67412','81835','62459','36316','75453',
                          '86384','37036','18279','21475','49820',
                          '18998','67848','39257','88996','72243',
                          '15256','98771','18800','82189','11051',
                          '75100','18127','74254','42016','57006',
                          '58424','74822','77762','38356','52604',
                          '75550','87972','67252','33203','88213',
                          '52849','37920','95067','91179','72667',
                          '81134','82377','75170','91395','18642',
                          '13297','20977','20407','40562','68673',
                          '20729','89010','91775','13480','73498',
                          '37366','87793','67640','86968','88313',
                          '32600','97643','68497','83808','13602',
                          '23491','79268','10604','25403','69001',
                          '40338','62683','31729','67845','60784',
                          '82545','82327','18122','41172','68803',
                          '90237','83965','52048','43778','60022',
                          '10900','84309','70022','11274','46799',
                          '55439','60259','96860','80781','20554',
                          '38243','87126','99319','95184','49720',
                          '72663','72612','57900','37609')
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
  and d_qoy = 2 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


