
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
                          '31438','60425','22546','79158','90098','10279',
                          '71261','65966','39872','47712','16473',
                          '49028','45063','68223','37830','26576',
                          '22218','16931','70494','55353','63624',
                          '75022','56173','44637','22414','82630',
                          '52731','64289','71197','52044','92948',
                          '43131','77344','85032','63241','66311',
                          '91308','90609','47534','22128','36273',
                          '45720','35377','81175','64734','95215',
                          '23264','78431','71142','26562','75553',
                          '59010','53287','98109','60708','65286',
                          '56366','80078','41037','63287','78587',
                          '12538','38566','88553','40866','71502',
                          '84477','79385','57930','30690','33011',
                          '25395','63147','55724','80501','66661',
                          '10565','35068','55928','81427','44007',
                          '62677','86948','36203','83542','22587',
                          '54586','45406','24289','69838','79376',
                          '96070','29180','39335','45923','69304',
                          '40614','78068','20488','26928','98202',
                          '42968','14550','14695','58888','98788',
                          '60119','98141','91165','78151','13211',
                          '91265','55960','18159','17412','77066',
                          '91224','66289','22512','23320','55205',
                          '60170','87400','58171','92014','75160',
                          '61523','47634','91657','61323','51597',
                          '26424','31817','34025','43985','37015',
                          '98866','30755','26848','44084','33862',
                          '34735','91077','64711','77099','72995',
                          '98942','54294','73375','45778','91456',
                          '76736','77565','32252','32472','54686',
                          '69785','83263','60286','54252','73049',
                          '79993','80912','72510','90103','36128',
                          '50940','55082','92081','37890','76334',
                          '96335','57618','90124','73413','47820',
                          '55718','81774','64191','96312','59767',
                          '63989','97605','93278','94202','27522',
                          '72055','76297','86202','20207','64436',
                          '42057','78216','22955','43584','66822',
                          '19193','56002','56812','26570','54089',
                          '38538','10956','99444','50101','14256',
                          '33004','19339','50280','49323','27554',
                          '40900','32531','23917','35643','85515',
                          '53450','84395','17348','45933','42195',
                          '60808','69716','71375','54457','53178',
                          '89707','49302','87014','99866','84890',
                          '52629','73745','50108','74319','49015',
                          '13196','35239','34308','41843','72704',
                          '86158','21151','62020','20809','17320',
                          '47109','45667','90476','42046','10828',
                          '87126','75142','13263','34193','89806',
                          '91538','44058','73111','35211','54012',
                          '77063','76232','81570','77403','84591',
                          '90213','87901','32906','55547','90250',
                          '61970','80570','47179','35435','78031',
                          '75365','16372','68154','72496','98668',
                          '27144','41676','94743','72987','18685',
                          '19023','65330','88838','67640','35806',
                          '68360','24348','55600','31491','24436',
                          '85121','85151','40563','53313','26094',
                          '14058','22263','60610','55937','97827',
                          '36092','61889','77718','43842','36357',
                          '32188','91017','63701','44087','81890',
                          '80878','93874','68625','30338','83703',
                          '66808','37998','17698','76645','43555',
                          '51568','76908','18882','87771','31069',
                          '74783','24540','94258','86657','53518',
                          '42941','61984','80559','31795','80287',
                          '46484','36638','35977','68853','48117',
                          '57888','97249','11308','23219','64569',
                          '94788','14996','27032','60264','21258',
                          '95028','16680','96529','39467','28476',
                          '92483','17329','92807','22464','29918',
                          '92801','58028','41888','74015','22165',
                          '60902','18548','82745','76603','92664',
                          '36161','78380','41233','31631','11070',
                          '43155','45232','56246','21819','39045',
                          '93846','62039','69522','12949','41341',
                          '31763','18555','53404','49087','70517',
                          '26960','43753','55654','27636')
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
  and d_qoy = 1 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


