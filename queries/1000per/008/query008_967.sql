
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
                          '25934','76830','35704','60641','49265','12524',
                          '70921','85407','54246','86224','24788',
                          '89473','49854','19812','99060','43164',
                          '80329','84190','81396','99677','52022',
                          '88216','48266','47757','57873','65137',
                          '34582','97480','19348','22238','18210',
                          '27401','51116','80863','68001','50065',
                          '47262','83008','40160','94067','10827',
                          '95262','53947','52593','22264','75594',
                          '85207','16843','36763','91146','16542',
                          '17452','12814','47164','44021','27003',
                          '82773','59807','92266','40625','47017',
                          '60395','70803','37605','50360','26044',
                          '75959','17461','15044','72788','24931',
                          '91514','18690','25003','85909','39776',
                          '37860','62476','47852','29536','24455',
                          '54701','29366','86859','19303','65682',
                          '88870','62173','61727','87007','48104',
                          '23639','36602','70506','42494','69138',
                          '35911','87060','74906','85808','76422',
                          '83333','97528','66552','95138','47868',
                          '51340','94272','61925','91751','60325',
                          '77131','59781','68390','80282','34604',
                          '58934','16632','27345','17370','84366',
                          '76968','47397','52163','16413','27848',
                          '24988','74865','17860','47604','93827',
                          '52743','55259','26798','41990','14162',
                          '51509','11504','76397','28043','90632',
                          '96998','13857','77049','98158','32915',
                          '81400','39532','92354','84397','31036',
                          '67837','13660','42143','54635','16249',
                          '99816','86851','98565','71191','98964',
                          '35908','84097','44874','95861','65148',
                          '73672','63248','14729','52880','34758',
                          '32994','90757','33886','90138','63327',
                          '19767','94161','62362','87400','48432',
                          '35548','13136','84017','30465','54136',
                          '21647','37414','14163','32216','64498',
                          '29508','36370','10523','38180','27796',
                          '40356','35011','65073','11170','35079',
                          '60892','55257','23875','83575','88213',
                          '46818','68955','36902','43727','55487',
                          '79982','16355','45175','19447','35328',
                          '22176','38776','31488','60288','16142',
                          '92849','68810','76352','36924','87336',
                          '70754','40807','22419','92861','39186',
                          '29025','52989','63028','93472','99472',
                          '44918','76033','86594','28947','36207',
                          '30762','37420','28698','75878','25111',
                          '27553','37526','48152','47617','43319',
                          '93852','32203','28255','29223','64771',
                          '17361','54418','32233','16829','70495',
                          '29171','52173','46228','79632','64575',
                          '97959','50219','57309','90931','70874',
                          '24239','97953','40481','88000','68321',
                          '97167','20703','59527','56221','70352',
                          '79358','43190','47733','22438','64834',
                          '57421','74908','70108','47538','84107',
                          '35530','39771','99460','12968','67461',
                          '95855','49005','42339','68346','68670',
                          '94221','78658','67075','59042','43529',
                          '26705','14566','39030','12291','46205',
                          '22839','15891','57434','99010','25216',
                          '25270','20269','99281','93912','95813',
                          '34217','97484','10096','88457','14365',
                          '80608','73504','78632','15177','14946',
                          '50412','33764','59336','29425','46403',
                          '17586','46841','84607','40871','32939',
                          '27336','87228','88384','57892','98637',
                          '60647','24571','61257','64758','98152',
                          '97295','71088','46216','48059','27035',
                          '34607','33648','51840','97070','25269',
                          '86808','57985','84160','99988','51061',
                          '46712','95396','42024','32806','33558',
                          '44409','85356','72545','32090','25759',
                          '14264','56002','58711','61359','65678',
                          '82820','54070','50966','59309','87224',
                          '72689','81161','91780','50621','18057',
                          '76009','61281','89994','14341','32938',
                          '76213','53740','40221','24053')
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


