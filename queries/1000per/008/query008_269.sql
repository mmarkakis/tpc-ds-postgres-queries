
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
                          '25461','16482','96069','90191','54027','43631',
                          '88673','78766','83540','87255','11836',
                          '44329','41608','44255','48925','33756',
                          '87057','87771','25898','63016','35936',
                          '30936','10937','40404','31786','95357',
                          '62049','68096','76226','44270','57278',
                          '19262','46140','14029','14893','34825',
                          '76217','89694','79373','18556','38428',
                          '97311','22102','22305','56088','24068',
                          '88043','13460','65386','54066','74861',
                          '46307','66191','65090','19209','28408',
                          '38662','43355','47306','14037','50621',
                          '71617','45677','31048','88671','70195',
                          '29048','17152','99300','66397','95444',
                          '65594','23394','31102','44230','63126',
                          '32461','29986','67242','29655','40320',
                          '93777','86922','82092','73169','71763',
                          '26193','74577','86948','79048','90857',
                          '74783','55055','39582','98324','96778',
                          '84242','62092','50384','17156','82932',
                          '11633','68991','65338','42792','38649',
                          '85102','81156','78913','86021','92180',
                          '92260','91780','97539','56273','27033',
                          '21851','30964','26196','16223','27849',
                          '81406','64497','71511','88991','22546',
                          '54952','48890','87633','53410','84766',
                          '94622','71345','13530','45235','24108',
                          '33803','85049','36169','49306','84561',
                          '96229','16216','50799','41051','28228',
                          '31846','44461','18003','69765','27479',
                          '21798','77224','93630','61870','86518',
                          '91106','96446','16793','74729','20043',
                          '65051','40312','90594','29409','48603',
                          '32781','45993','83541','26608','99511',
                          '94453','76191','67417','96090','26456',
                          '66915','73539','93217','37979','18547',
                          '31413','60636','69140','32246','78395',
                          '26300','38596','95134','79673','34380',
                          '36300','84449','40626','84694','47339',
                          '98286','45039','85257','83280','50599',
                          '34425','76866','29758','49149','11906',
                          '88444','53313','45408','10275','92957',
                          '44849','64693','40264','39523','84728',
                          '46904','97174','57588','51268','92672',
                          '87728','90649','47576','38568','97838',
                          '42481','41353','60163','80474','97284',
                          '73526','20383','69455','22319','71374',
                          '47726','39549','54628','88684','20827',
                          '20316','84635','52061','76676','89223',
                          '27080','55892','33154','61067','72613',
                          '87034','89856','70566','43092','51828',
                          '19501','98830','53304','90139','30796',
                          '61019','93949','90296','99627','99508',
                          '80549','45801','80052','80885','24961',
                          '67340','50579','47204','68533','94556',
                          '93773','74102','73926','97100','15239',
                          '44130','99010','41359','97958','75444',
                          '25075','26106','44334','36015','54531',
                          '80886','66328','80874','29803','43036',
                          '68732','90152','86680','75136','18561',
                          '31376','78337','20483','39764','18635',
                          '58658','23870','77008','14835','44759',
                          '89940','37896','63005','66638','18032',
                          '41810','41026','97127','86494','65718',
                          '24026','35612','72279','80881','22801',
                          '60299','72009','37703','99878','59647',
                          '21946','55641','61375','14177','26027',
                          '84316','51630','92847','38398','93692',
                          '53956','48303','70913','86768','44447',
                          '99120','21516','64765','29277','51380',
                          '76593','72497','77986','38375','81002',
                          '43768','44082','23880','93181','50607',
                          '72520','13727','94022','24721','44621',
                          '53424','31957','60204','41394','37943',
                          '76489','10608','32300','70574','77318',
                          '25143','98703','44908','45705','90724',
                          '80367','18554','79341','42208','75731',
                          '67848','41509','54825','16229','98982',
                          '36998','26841','87744','13380','87296',
                          '23848','92899','62860','35750')
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


