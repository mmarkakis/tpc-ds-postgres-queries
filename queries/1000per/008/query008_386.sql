
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
                          '47775','14626','14741','90658','11896','87864',
                          '17948','88363','37568','40733','59444',
                          '77049','43996','61520','69506','49022',
                          '96394','85864','64454','28134','59573',
                          '61005','49846','46406','89885','43669',
                          '40330','38989','86503','17886','82045',
                          '39216','74222','62019','20298','54718',
                          '64253','12207','18796','21424','75880',
                          '30147','81893','48302','66034','43208',
                          '94217','58882','90865','78407','36463',
                          '89978','76905','23333','33500','37434',
                          '34925','12580','59032','27711','74597',
                          '71398','27221','78532','70932','17631',
                          '44167','66111','33378','81479','86283',
                          '87367','32927','57094','81090','65684',
                          '57670','29001','67745','38679','94710',
                          '32072','19597','39789','41700','92843',
                          '61268','97010','27931','89281','18670',
                          '93768','82539','21696','71678','20052',
                          '11010','54595','71955','26105','48963',
                          '70790','48960','28403','78166','44993',
                          '11955','68796','29123','33076','44082',
                          '48136','12158','49187','43796','38292',
                          '77667','52656','11369','39717','65840',
                          '16577','28978','86891','57099','66940',
                          '95428','51195','17323','63472','55732',
                          '74272','69677','84728','18813','84329',
                          '11995','91413','17136','79707','27050',
                          '38720','88993','21047','11426','93991',
                          '52598','79290','96246','18863','33047',
                          '83905','87385','21569','54217','74295',
                          '69451','19261','73322','93504','81041',
                          '65658','95420','54163','10808','49842',
                          '70423','76401','26505','23987','16527',
                          '37579','70125','88014','26382','96522',
                          '72560','23486','89639','79678','47380',
                          '49349','74203','51343','84391','75943',
                          '40835','74909','26959','94638','56872',
                          '86054','87722','18456','64082','95328',
                          '73256','23090','90752','64393','62453',
                          '18273','56840','25467','70924','83982',
                          '84808','21326','37935','85180','14045',
                          '35709','37858','50289','55918','73255',
                          '11919','37871','29631','22082','89700',
                          '24243','22461','22754','50892','27989',
                          '26208','92249','11751','38619','54157',
                          '45974','36595','91629','90785','25905',
                          '65848','63232','24071','18111','28360',
                          '32086','40529','70508','46382','59813',
                          '53068','44757','88661','59479','44057',
                          '11152','83949','61181','96775','43793',
                          '60938','44542','49757','71705','45659',
                          '33151','51632','10260','16126','63704',
                          '46422','40978','35239','22471','85979',
                          '76354','73575','28665','80641','14758',
                          '77590','86179','65059','63064','18865',
                          '35673','18839','53950','61334','94355',
                          '90447','34452','24503','60475','63158',
                          '37714','69161','72052','11290','21773',
                          '76180','49436','78144','50320','15696',
                          '54771','71135','27883','72289','56378',
                          '97679','18368','98521','77252','61512',
                          '83373','91252','99744','23140','23300',
                          '34169','24213','70660','87920','12756',
                          '73583','70621','71611','18366','22229',
                          '21997','15367','19312','28796','75882',
                          '72213','13118','31664','21751','93607',
                          '14879','52399','16884','48589','33109',
                          '52687','18517','93984','90078','94968',
                          '11867','13010','99531','25020','69647',
                          '71200','25385','57645','65158','39138',
                          '13647','17252','95073','90637','16583',
                          '53853','66692','52548','71596','89637',
                          '21855','60668','22518','65783','69512',
                          '15092','65563','90166','96575','77409',
                          '71086','13559','91996','42156','52066',
                          '24875','11942','77967','44826','76680',
                          '91951','44977','31931','37823','74938',
                          '97094','83180','18521','78264','85093',
                          '32613','60262','40594','93960')
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

