
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
                          '98506','40889','80358','87026','17524','33772',
                          '15133','81727','23590','26789','82450',
                          '76220','89282','48811','99632','69052',
                          '78107','42395','39931','80128','67752',
                          '34055','67051','71435','84044','47077',
                          '29425','58717','33754','39557','25798',
                          '78545','56045','45402','24915','51720',
                          '68771','83334','43321','56662','39746',
                          '89199','33517','66928','15323','65663',
                          '79435','14739','88103','58792','97481',
                          '53836','84061','31201','60979','95018',
                          '48481','86231','34745','72712','90630',
                          '67689','27334','39710','62944','92510',
                          '50066','12942','96666','52666','64099',
                          '73653','62492','20270','95623','58497',
                          '23679','60597','83287','76594','54253',
                          '15904','84387','87900','28187','60699',
                          '52068','16166','64330','52334','24387',
                          '47657','73368','99652','14021','36473',
                          '97701','75237','72188','24881','84344',
                          '81956','25554','12778','73831','81059',
                          '17382','74336','38170','77243','95044',
                          '27411','19826','11257','94727','55976',
                          '97228','33499','98132','99716','21697',
                          '13144','43162','99496','23295','48546',
                          '33944','42106','32421','91132','20834',
                          '12689','30337','99547','72580','43629',
                          '73293','33906','46412','33791','15807',
                          '42351','23034','20788','66256','28676',
                          '88249','37748','48266','72365','81806',
                          '98810','56143','35990','50057','70719',
                          '70240','32864','87173','97849','96759',
                          '26881','11448','63905','86304','92521',
                          '29848','74526','97641','87960','71146',
                          '99126','24166','91802','66014','77551',
                          '61521','34430','97777','67963','64602',
                          '55335','90281','27323','13042','62062',
                          '70658','78441','66873','10581','31642',
                          '13991','93389','64198','45190','87941',
                          '27320','33494','83637','20498','99095',
                          '15044','79106','92821','83640','52336',
                          '50481','91912','80229','44473','86724',
                          '33487','66516','31898','43830','55663',
                          '13806','51844','18835','84864','54923',
                          '79443','41740','69877','15537','13007',
                          '10867','72801','56258','41951','65728',
                          '45838','11727','71651','36732','30833',
                          '63192','60897','38287','74856','98433',
                          '29316','36353','37885','67801','36893',
                          '77719','67433','75656','63370','93532',
                          '32448','49537','40442','20348','46518',
                          '73119','68744','53299','30814','27354',
                          '54814','10859','28192','21749','62042',
                          '23216','41634','94317','75479','10273',
                          '34425','13026','39091','70863','12936',
                          '67626','80680','95288','39890','14086',
                          '33509','40697','54481','78892','84714',
                          '70858','66103','22586','92198','36111',
                          '75121','25028','34267','18502','55712',
                          '29074','91706','56916','47193','43791',
                          '75645','20393','82125','37519','58168',
                          '97771','52429','21968','87161','61580',
                          '98802','64101','13869','80495','38715',
                          '22404','11112','90049','56667','37844',
                          '13453','64176','81224','27710','53346',
                          '33228','92523','58022','78719','49566',
                          '25207','46240','62351','54749','99960',
                          '86994','22291','21656','25648','49803',
                          '98566','52782','61826','96976','93370',
                          '77743','84312','34924','67858','35352',
                          '24562','20279','35123','16465','28871',
                          '71770','28816','44825','97027','23918',
                          '25895','91043','97214','34860','64269',
                          '73657','73751','97371','67175','24204',
                          '80233','37806','76111','32477','79283',
                          '62568','63332','16043','83172','95930',
                          '65887','41817','62645','99981','80783',
                          '49658','41112','70048','53760','44159',
                          '93117','97836','99713','25579','32149',
                          '32586','39909','84379','59078')
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

