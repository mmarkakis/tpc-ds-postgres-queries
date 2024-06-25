
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
                          '89665','35342','49110','82278','21702','18786',
                          '13233','50276','82682','91403','38509',
                          '17540','49452','63897','60445','92934',
                          '55664','88645','61774','81405','83133',
                          '59057','37512','99485','82954','99276',
                          '39953','24462','39667','74830','60064',
                          '65935','99748','48950','45040','36145',
                          '44308','31407','19616','48576','24714',
                          '38230','32473','20081','50762','55900',
                          '27578','69783','35435','19181','49141',
                          '90092','67430','15307','13372','50977',
                          '97550','36167','44621','96122','41893',
                          '67488','18650','89710','29719','20700',
                          '52484','78455','91207','99926','89366',
                          '51592','12003','82810','85337','88205',
                          '76103','35452','68007','39274','69699',
                          '96948','71775','41397','35028','49736',
                          '48253','78547','58400','44907','54991',
                          '70029','28182','76052','76707','89230',
                          '21122','79026','84848','28827','18375',
                          '45186','65713','86574','62859','12269',
                          '36063','37678','27013','33902','50443',
                          '13793','59396','58310','80535','57058',
                          '65846','34805','25110','35209','19018',
                          '75698','18821','63786','25597','83516',
                          '91157','90711','92029','96189','53283',
                          '66498','79312','47808','94894','21752',
                          '92629','81605','32297','44691','81101',
                          '65781','64931','47400','28174','84251',
                          '78446','36887','24051','63632','80139',
                          '17805','22128','76630','36917','32999',
                          '16811','61742','20815','93749','57060',
                          '86255','65012','83893','44823','36723',
                          '93678','47111','10547','69927','97891',
                          '96203','15446','69483','71151','24776',
                          '82304','12560','77347','37480','71760',
                          '62974','29991','81052','10891','27287',
                          '68437','65146','94056','14002','54605',
                          '87100','18558','17581','72102','26046',
                          '76278','98936','28197','67603','86670',
                          '88390','28044','86621','80406','57924',
                          '13120','21974','78576','64926','56492',
                          '20219','84822','67616','54546','89919',
                          '53610','79961','16559','94464','76854',
                          '26570','20287','29412','14653','41735',
                          '34451','52776','21924','84684','85440',
                          '12429','57038','50748','83863','53944',
                          '35259','85320','52804','81465','25100',
                          '65635','90317','43053','22427','44734',
                          '28039','16484','68132','81729','15748',
                          '77587','70948','72584','47603','42294',
                          '50971','99308','71711','34894','58349',
                          '38991','25660','97604','34673','47388',
                          '65852','14277','29325','99694','57868',
                          '88305','61513','89850','40048','19288',
                          '76785','77145','72861','91326','90796',
                          '90023','50922','79836','83280','29636',
                          '26352','65894','95282','32731','98522',
                          '50989','41682','62072','91297','22732',
                          '98176','53861','89195','85746','90036',
                          '58933','34236','31398','22785','85512',
                          '97311','42057','95109','99947','18332',
                          '75235','89397','69683','98414','94099',
                          '79262','69128','91323','93634','80529',
                          '33447','22818','78997','98879','97562',
                          '70388','83647','39096','73308','75539',
                          '59219','60190','69964','90828','44390',
                          '28437','95317','82301','62725','11223',
                          '99186','53746','48264','88204','92567',
                          '82357','57281','24550','93338','63712',
                          '81766','79387','75350','86666','44573',
                          '48875','32917','68129','42503','60787',
                          '36133','17547','72979','18859','56403',
                          '78942','16519','58947','27806','29918',
                          '10947','90836','79184','94694','55590',
                          '62481','98471','26186','75151','87123',
                          '13681','36030','58841','88134','61351',
                          '17763','30519','21356','61368','70425',
                          '57431','84476','79567','18045','17978',
                          '60329','94788','68416','11646')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

