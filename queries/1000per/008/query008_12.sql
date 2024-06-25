
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
                          '88626','30461','41106','52673','93506','82111',
                          '44875','11602','20969','53461','10014',
                          '87670','28707','50003','11849','36202',
                          '72966','16094','70206','36443','66567',
                          '78273','27017','77005','14718','58217',
                          '54449','12378','51254','73026','22934',
                          '56166','94975','47961','95629','33445',
                          '34861','81075','33057','91120','35810',
                          '22897','91983','14764','83685','61105',
                          '77754','82939','78635','11422','37329',
                          '66056','90845','55728','58603','59606',
                          '72975','55051','23679','22462','98486',
                          '41149','69291','63441','20054','55469',
                          '19664','16712','96631','38270','86912',
                          '70424','26201','44690','79681','52676',
                          '97914','27524','18782','12550','72279',
                          '18588','44266','71849','71074','87964',
                          '40648','97411','54033','81279','40662',
                          '51929','58760','40417','93485','83926',
                          '20224','81909','55767','53576','74071',
                          '68413','37878','80312','34299','39760',
                          '22812','96166','35706','82071','81272',
                          '82290','34852','62128','34833','82441',
                          '79360','28984','23811','12029','46219',
                          '69798','13252','65630','23677','67933',
                          '21969','79540','35109','96877','51412',
                          '56375','65816','85861','51421','45234',
                          '10961','36743','83995','44262','43257',
                          '64142','41688','94716','30318','45545',
                          '60877','48520','48305','61665','34038',
                          '73621','33462','38856','65744','77493',
                          '96823','69548','27840','48349','83206',
                          '98977','51886','86611','41010','53550',
                          '36871','59959','17919','54849','41160',
                          '64589','21429','80105','73219','52783',
                          '10731','24711','65884','82650','87831',
                          '18551','43286','30493','32392','92426',
                          '33783','21347','93036','47251','14851',
                          '44110','92856','10814','79231','32274',
                          '64123','26823','89693','91235','14275',
                          '49713','73135','64737','67258','13586',
                          '38535','42836','13282','85016','56710',
                          '58770','85638','31201','42139','27191',
                          '61799','92299','15460','63761','30068',
                          '17897','11127','58543','33364','12948',
                          '69694','67070','67151','81799','19127',
                          '96394','62511','86307','59348','63244',
                          '29520','17261','12888','52171','50174',
                          '59542','85430','60998','54467','52224',
                          '45660','39648','71432','84951','18335',
                          '17006','63229','20143','90611','31150',
                          '32745','58264','23292','77637','57800',
                          '36596','34792','53486','36715','91674',
                          '32971','18376','75994','70235','32270',
                          '54654','54846','35743','68459','65713',
                          '34123','54913','63647','77090','18010',
                          '61312','56374','60993','61860','35593',
                          '93084','46312','95197','88185','56778',
                          '46662','91245','75671','74961','40502',
                          '36197','65492','65890','34426','48264',
                          '70160','92880','17493','51787','73249',
                          '70913','44035','91323','55968','93650',
                          '78376','50476','21151','79123','47179',
                          '19819','38379','15614','23561','51368',
                          '63231','74159','57244','78724','92400',
                          '42004','16856','54387','20855','50778',
                          '25406','46728','38162','53160','74284',
                          '72210','85838','63846','96818','27909',
                          '20060','35549','73372','78009','33407',
                          '75698','37278','60433','39050','24688',
                          '20007','83871','15635','47064','45561',
                          '71265','36073','10666','31738','32184',
                          '37262','48921','60029','37682','96594',
                          '42083','19118','73970','67756','94548',
                          '27908','86941','91993','30654','14377',
                          '68054','16210','48984','56589','34005',
                          '57942','55280','73882','51317','22154',
                          '81342','22523','86505','30602','36793',
                          '64460','46725','60034','93142','19971',
                          '92390','67266','72126','71076')
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

