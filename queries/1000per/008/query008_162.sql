
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
                          '27834','95365','31904','62740','92492','42076',
                          '98429','39042','28232','36965','17973',
                          '80049','82793','96875','36873','82256',
                          '41701','56581','41229','23874','22569',
                          '67330','38715','56725','69584','25960',
                          '89593','78962','49988','69077','50958',
                          '19573','67545','76508','56726','43128',
                          '28755','95383','94617','12681','34720',
                          '68015','69177','49944','33511','38871',
                          '48572','75845','98102','48549','19939',
                          '45985','27588','55561','36514','27023',
                          '82698','35146','62295','83168','72402',
                          '31685','88538','65222','60828','99674',
                          '66052','23186','75800','26596','97167',
                          '67848','49287','68798','78168','74639',
                          '64161','11069','32895','55320','78128',
                          '89363','88667','46020','80550','80048',
                          '20874','68498','97759','77565','23637',
                          '81529','84557','13869','37044','50067',
                          '56329','87724','74071','72640','40408',
                          '29976','19745','13165','66996','29207',
                          '28443','60121','77834','59811','64244',
                          '27014','18649','75080','96662','21110',
                          '72805','19072','58457','75359','18689',
                          '29550','53378','58253','58887','49408',
                          '58202','27840','59225','97677','28964',
                          '43126','73323','29073','78155','14570',
                          '23667','42617','83160','93273','60833',
                          '80534','13005','61515','94498','67797',
                          '28993','24265','10910','52773','90917',
                          '48583','11904','45081','28590','77525',
                          '15216','13500','50279','95080','28195',
                          '88258','37261','31451','95583','73172',
                          '77332','95164','14265','95473','56578',
                          '62672','10997','37427','78036','51581',
                          '76571','90923','45031','56747','31058',
                          '84793','49579','63840','89612','14463',
                          '92890','62805','38367','93203','34471',
                          '12108','37316','64448','14198','40922',
                          '16568','92342','68304','83443','58281',
                          '98272','10890','57137','78713','56321',
                          '54457','89428','41839','65535','96058',
                          '63297','15608','24989','53865','94117',
                          '14119','99948','94839','23754','87118',
                          '70683','10860','39880','84866','80674',
                          '68701','10258','96945','94875','19508',
                          '74905','90459','50096','63405','89659',
                          '89496','13919','88140','15920','76877',
                          '72029','12218','69848','55178','48587',
                          '91657','81651','52496','92968','59297',
                          '62601','32921','95234','41018','47260',
                          '19210','66636','11601','62279','75732',
                          '86379','75237','56705','82633','43942',
                          '12193','20843','64050','14525','36081',
                          '65341','66736','88444','73614','70262',
                          '40081','52928','37772','49858','44953',
                          '13446','41753','47873','39288','78378',
                          '67110','46308','14089','50164','77118',
                          '78025','42238','96636','65215','95934',
                          '29787','82570','16357','97125','25625',
                          '62085','43820','73671','32732','43765',
                          '58567','64777','55362','73682','64235',
                          '41792','96782','39213','53649','75031',
                          '89784','94186','18949','40177','79464',
                          '36122','10638','93795','39272','86677',
                          '52653','49653','20251','20479','92227',
                          '88352','70596','72830','95265','44393',
                          '69570','35268','17400','39372','35463',
                          '15783','82739','25935','55058','21760',
                          '53866','22637','79419','54288','22747',
                          '90388','35502','80815','83920','86715',
                          '71961','85183','19282','34575','51495',
                          '33019','30845','89366','52062','46916',
                          '84280','11922','67528','15823','23413',
                          '69221','11804','62963','35427','70904',
                          '36333','29328','62341','76226','17227',
                          '49115','36089','43336','77515','24277',
                          '84430','81806','26101','71914','93854',
                          '25661','71959','27751','44493','33307',
                          '98981','19781','28029','76702')
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


