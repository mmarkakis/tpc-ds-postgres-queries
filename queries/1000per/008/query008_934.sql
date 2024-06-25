
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
                          '26418','16355','44263','54427','16758','51172',
                          '95217','36314','32202','98218','14749',
                          '42166','13628','92915','18928','92663',
                          '45166','39724','96727','88296','66471',
                          '32869','73260','26884','87584','70272',
                          '90816','14758','94405','99729','51226',
                          '26902','62580','40364','74335','73128',
                          '23625','92988','51613','52389','22628',
                          '50713','39101','79752','62452','73028',
                          '98303','33583','69305','58394','26459',
                          '59595','47057','51733','27471','57399',
                          '92304','14223','43026','12173','98892',
                          '96171','19844','54669','79172','85788',
                          '13358','38116','51299','22575','97517',
                          '79113','43222','60334','58794','37635',
                          '79835','69165','91739','13933','37082',
                          '90016','30011','16486','97945','61000',
                          '74267','60411','22459','19048','58889',
                          '89866','93811','31357','28027','96601',
                          '46250','73880','73867','10775','96497',
                          '67135','49638','32947','69770','95032',
                          '33732','87110','28515','10948','50870',
                          '51568','87531','34863','58419','44192',
                          '32754','59893','30431','70931','16492',
                          '61528','54005','31909','21129','92702',
                          '93060','36000','17139','90530','18122',
                          '81583','46787','46036','29997','83971',
                          '82588','93963','87689','35384','66977',
                          '31760','36200','32772','52110','97296',
                          '91551','86575','81388','93602','29332',
                          '27663','56659','68919','12168','99629',
                          '33450','42914','82557','41122','14353',
                          '71471','85991','29024','59884','24625',
                          '15648','43903','44216','66353','65508',
                          '84706','43370','54515','68539','70002',
                          '16572','97184','68852','99070','46293',
                          '89525','17531','15079','13269','49161',
                          '92925','24009','80063','29671','87184',
                          '78557','11194','17228','33940','98621',
                          '61643','17309','73259','21708','84318',
                          '70342','85994','78074','51814','14436',
                          '68235','31252','27285','67931','96943',
                          '99280','73118','67448','91690','26756',
                          '22765','95816','52944','81053','96937',
                          '94930','82218','36717','54054','66551',
                          '79018','62265','10034','69133','73191',
                          '77828','77497','15126','21747','27235',
                          '64500','74509','10000','43034','81836',
                          '80527','38872','24225','27932','58827',
                          '62607','83942','78813','21667','54961',
                          '51897','15674','30478','47600','67399',
                          '69217','11293','48091','39604','14546',
                          '21803','29434','54167','26376','20679',
                          '79702','43396','54564','13498','64827',
                          '16267','60544','94448','74420','83549',
                          '19881','39675','77885','74510','20331',
                          '55199','92493','84947','60843','72933',
                          '48545','64033','15442','47071','70651',
                          '42311','88258','46693','51912','31527',
                          '99603','88692','16260','82196','75270',
                          '98505','46279','99026','87007','43368',
                          '98304','91070','28354','67118','27696',
                          '55942','45648','65011','29262','94240',
                          '29485','72831','11577','16459','95457',
                          '35672','52975','12570','89109','97786',
                          '52199','26061','80239','27045','38123',
                          '44648','38253','88536','91752','56100',
                          '47256','16385','57158','93344','67419',
                          '47677','33032','60814','82566','23005',
                          '81307','86296','58785','56377','85368',
                          '30860','64629','65600','39259','84465',
                          '51876','72931','30393','44915','48680',
                          '83918','23854','58604','48926','50985',
                          '35413','94848','72903','82170','86094',
                          '34608','82926','94724','17144','83568',
                          '69254','54409','77602','40168','50374',
                          '70143','31653','27318','10676','19531',
                          '57122','97144','56993','74280','48140',
                          '63359','63090','31689','59897','62498',
                          '97167','61115','67798','90150')
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
  and d_qoy = 1 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

