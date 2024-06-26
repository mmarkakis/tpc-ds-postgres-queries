
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
                          '97802','91709','38597','54297','13005','37120',
                          '69005','91989','39614','79352','78109',
                          '82851','12001','65721','21494','52051',
                          '38033','76321','82700','41578','30645',
                          '17894','62445','81488','13843','29245',
                          '78623','29607','93445','71002','33227',
                          '97415','13738','40699','43254','12995',
                          '77925','93557','83618','28839','50834',
                          '37749','73555','58162','93016','23402',
                          '11025','62515','29838','67097','58368',
                          '69572','58509','45294','63178','11220',
                          '34414','66794','54618','24801','68042',
                          '38840','63707','64060','79165','39219',
                          '74901','25018','86332','58384','86086',
                          '24113','74151','19000','14755','79503',
                          '17763','61956','24418','30348','97159',
                          '31582','47775','57330','91268','14895',
                          '31014','56300','15726','13032','63142',
                          '69616','29325','69453','71318','51083',
                          '79597','62870','92013','56346','84096',
                          '31465','73958','31630','49365','81714',
                          '42653','83005','16521','97485','86830',
                          '87991','73398','62486','77968','16084',
                          '37257','18645','20880','80271','48375',
                          '71531','87674','44313','20123','98102',
                          '47764','76642','62397','82234','94540',
                          '44677','40745','40965','27361','71679',
                          '38648','12006','12611','21161','80306',
                          '60402','75650','19993','60116','55487',
                          '67713','37493','83593','36831','40247',
                          '13434','24646','11835','24472','94688',
                          '85853','32512','82280','22336','89528',
                          '84558','70615','34147','74332','16261',
                          '65394','27784','76155','95161','17111',
                          '56818','40625','43250','74459','74348',
                          '60763','46205','64865','40441','78158',
                          '93162','22930','16743','90546','14003',
                          '16192','12299','13399','40006','12855',
                          '94620','72795','93836','85048','14223',
                          '49320','20761','70913','84392','10425',
                          '50853','19008','65701','72048','78050',
                          '30223','88580','60419','61573','80761',
                          '71972','57998','41575','39887','64211',
                          '63037','98247','52526','34246','25291',
                          '58003','40682','91296','74914','18204',
                          '63890','60718','99425','46173','58833',
                          '57031','69109','53100','54832','83487',
                          '18950','80370','78942','14043','18436',
                          '75769','49886','83378','27395','32132',
                          '77129','38479','21088','93137','27441',
                          '19534','89979','47604','59670','54447',
                          '18915','78503','83221','72950','11305',
                          '91982','32259','22600','70739','94067',
                          '36827','60935','39896','61239','62467',
                          '44543','98143','29254','77135','88541',
                          '38709','73040','65478','16980','30249',
                          '54584','53065','93769','39198','90602',
                          '36515','73039','56085','96951','38459',
                          '67043','53202','61348','35923','26877',
                          '79090','59196','46162','79923','48891',
                          '99002','23283','79323','41199','95551',
                          '45308','25290','21135','96440','79243',
                          '70180','38422','86877','52736','36238',
                          '26352','28863','82473','45527','62832',
                          '23910','30906','58865','99757','92994',
                          '99851','63463','98928','34471','57292',
                          '77608','95096','81531','79438','61376',
                          '49770','71894','56113','37380','86282',
                          '35121','96580','66678','83067','48297',
                          '19276','62514','84058','24853','96192',
                          '50489','60308','69077','36875','30767',
                          '18817','99410','92140','46697','26945',
                          '91095','77983','75399','15011','51041',
                          '77164','83946','41264','48904','15942',
                          '32307','84458','70629','20336','17075',
                          '26516','33302','41027','27278','56635',
                          '13518','29216','49594','10408','68207',
                          '51447','43150','34673','67149','84181',
                          '86222','56301','73496','64238','85705',
                          '99065','76731','78751','60457')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


