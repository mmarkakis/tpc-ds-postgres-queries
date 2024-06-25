
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
                          '28471','40735','43478','70028','60381','11772',
                          '58648','45286','59794','66055','97416',
                          '15117','38070','22940','19278','48338',
                          '61688','64797','54967','61913','51893',
                          '48465','12400','54348','89674','99228',
                          '96447','90277','36099','89184','89137',
                          '48260','29850','80779','70252','52393',
                          '28144','66366','91433','21105','28500',
                          '82933','19242','59749','21177','21133',
                          '88507','43924','38770','55429','14737',
                          '15587','67462','75655','59503','49719',
                          '85667','85688','14530','10153','43171',
                          '36408','26521','88549','63968','37170',
                          '96236','48963','66568','86350','35273',
                          '25382','63933','80527','63217','36444',
                          '80016','27645','43222','84485','67839',
                          '43594','35541','49704','99105','13023',
                          '59978','79612','23255','32852','52762',
                          '76516','81521','86071','69530','97622',
                          '51385','23667','50902','49696','52287',
                          '67713','10644','60547','55096','36155',
                          '34825','56662','35020','59043','27535',
                          '74154','55532','48201','43816','20319',
                          '36802','74521','57034','65566','40543',
                          '97635','22869','77852','82909','54199',
                          '80528','32055','13079','91398','56585',
                          '74952','88046','26697','15481','38279',
                          '10242','60726','29664','33622','68034',
                          '89886','91343','18883','41849','13666',
                          '45783','76247','79232','60448','93923',
                          '26145','50853','41739','52577','99836',
                          '52605','11916','99219','49996','22533',
                          '50273','59068','97133','35141','38359',
                          '18905','85280','30888','74791','24706',
                          '79600','57505','37534','88986','25307',
                          '64064','14592','78500','10987','43515',
                          '38748','44749','77001','79089','55661',
                          '31979','33118','86454','36419','92652',
                          '90788','48622','84394','91180','15752',
                          '70236','76779','92554','45737','95778',
                          '11216','71693','29370','19426','26878',
                          '92702','54230','28360','22162','22142',
                          '52394','46478','69331','54667','16130',
                          '45837','98108','85453','65440','27665',
                          '12681','57857','21334','27464','50223',
                          '28177','79255','75508','24758','12402',
                          '80046','14929','67211','41540','91430',
                          '41785','97888','76755','20522','43608',
                          '21282','44865','65969','58110','96188',
                          '11676','25294','70381','41053','18448',
                          '64672','52613','83956','77999','54296',
                          '37751','47958','44723','12378','95512',
                          '42530','25927','44398','72231','20757',
                          '78612','58834','15268','63330','24222',
                          '80182','65578','27136','15926','89013',
                          '30847','11682','71521','13603','29756',
                          '52642','65775','60630','19289','37731',
                          '42208','18154','99011','62554','59633',
                          '50871','87295','13336','72095','71961',
                          '17770','42542','45370','69418','85550',
                          '13477','41665','52903','11900','66445',
                          '24021','46338','79482','15736','52417',
                          '14229','66457','93647','96785','66258',
                          '63655','58898','93582','83064','67081',
                          '79531','34614','39507','79660','75232',
                          '94768','90144','83275','86238','32738',
                          '64734','89145','98459','34333','56804',
                          '55104','82310','53015','19608','99622',
                          '67323','40868','13255','50651','49475',
                          '17592','36276','89646','56943','47355',
                          '55273','31251','97749','45632','67268',
                          '69727','40222','53463','17931','77472',
                          '91220','10129','59613','28054','36144',
                          '29406','66014','82741','18467','78863',
                          '84382','51228','89110','33021','53230',
                          '13109','43002','77661','71837','95716',
                          '30294','37839','11547','89268','73058',
                          '43085','21833','23338','37320','27767',
                          '24299','53027','81046','50524','88304',
                          '87294','48267','97181','97804')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


