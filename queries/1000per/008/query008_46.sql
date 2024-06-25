
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
                          '53312','83964','13385','86093','83195','73991',
                          '42295','71437','10114','32077','72052',
                          '92622','97174','80907','41414','27405',
                          '75074','96127','11609','89310','27106',
                          '66241','53256','81208','54596','49235',
                          '38766','89869','19787','68139','40031',
                          '61747','52594','45162','78750','60830',
                          '90193','34511','54072','99034','43347',
                          '99481','31982','57410','75308','10455',
                          '20842','24871','26241','98539','15895',
                          '67652','31334','15604','80218','82552',
                          '19710','68276','94997','39852','32222',
                          '39938','34227','77644','52040','30028',
                          '29111','18044','34579','80444','31554',
                          '98834','91393','88594','40824','82758',
                          '69608','91325','42351','70250','95074',
                          '22835','43256','96797','40938','91595',
                          '69699','50277','83836','45518','10992',
                          '96443','53075','61144','44629','28974',
                          '35129','16077','18935','16636','10254',
                          '99610','98748','77448','75107','53950',
                          '25014','66602','69161','80193','41187',
                          '73537','30896','27213','28252','94772',
                          '71183','59408','62508','17055','71616',
                          '35610','64066','69377','94714','27532',
                          '72853','50208','15486','62535','61181',
                          '28729','96916','92362','95162','20520',
                          '89950','67208','10293','60186','39387',
                          '59670','29322','41419','63761','39651',
                          '15809','72930','58942','69859','43760',
                          '82248','59720','73811','34573','49492',
                          '33189','80246','10759','89125','27698',
                          '17706','29817','99248','53031','65327',
                          '81327','67476','62698','65856','65197',
                          '86004','18421','44340','14507','90398',
                          '31462','14084','80458','87527','92640',
                          '74979','44215','11546','37670','11926',
                          '83867','49668','45347','59881','60925',
                          '17642','47078','18290','71687','27010',
                          '26328','47633','52292','16293','71643',
                          '73922','95700','42684','38139','92577',
                          '70491','14061','33693','81564','85013',
                          '83412','23759','68645','95755','87648',
                          '21244','87274','81002','80365','28560',
                          '18732','48102','29348','56873','56534',
                          '53369','50202','31033','72496','14479',
                          '28655','82417','31247','10062','89287',
                          '44368','14128','71439','26990','43382',
                          '36676','65827','96131','22153','17876',
                          '22203','34087','73408','84929','40443',
                          '78585','50427','98741','80872','97153',
                          '80311','65058','57950','58133','65852',
                          '48287','61475','51450','13617','83302',
                          '88530','80203','90309','80650','80686',
                          '51879','41788','48351','32771','30371',
                          '59661','74881','72654','46020','64386',
                          '86416','60358','46175','30792','25535',
                          '60544','91897','65212','83331','22247',
                          '95640','29331','28564','94168','17184',
                          '30867','50869','36277','15260','64025',
                          '70648','45293','40352','78053','75318',
                          '38531','24354','75822','23929','89688',
                          '57382','20501','59858','64657','93001',
                          '83847','22737','46844','94565','32989',
                          '69661','83708','10354','85854','92669',
                          '92373','93309','74335','47959','59323',
                          '88105','26298','69403','50934','86395',
                          '78010','14410','61762','23555','49984',
                          '19502','54131','75353','33758','59931',
                          '52610','27321','25516','43695','97919',
                          '96042','64414','86888','76891','72645',
                          '16877','89308','15287','39447','37853',
                          '47458','43263','93343','71475','38264',
                          '27195','19732','59559','22147','85671',
                          '28764','18710','19214','43966','17273',
                          '32301','83147','46797','83429','75089',
                          '81731','16401','34845','92419','76631',
                          '85164','13448','57405','43381','57453',
                          '79198','13469','89667','47119','34145',
                          '35762','50349','66098','18436')
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

