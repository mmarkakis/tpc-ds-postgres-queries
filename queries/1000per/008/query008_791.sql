
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
                          '59658','59386','34169','43862','84177','78867',
                          '52922','56842','41367','34736','32822',
                          '97258','52820','38714','18299','92829',
                          '36706','98737','78002','81268','39564',
                          '46062','38999','61759','31817','44527',
                          '66468','53508','95775','90286','83724',
                          '24415','33699','80464','25771','59134',
                          '84920','80123','36078','26338','62325',
                          '40062','97086','19587','63809','75302',
                          '55378','73075','34178','74803','26280',
                          '31692','19281','80094','88084','20048',
                          '93514','15522','49761','81299','13367',
                          '47434','74528','45955','26762','60606',
                          '60071','32419','56711','78358','67145',
                          '48098','42047','25945','29249','15124',
                          '71430','35020','15524','64423','12809',
                          '11244','44330','45867','16671','14142',
                          '57258','80856','36999','44424','19686',
                          '63755','66491','24793','88473','67852',
                          '90317','35135','23879','95284','39016',
                          '53336','65173','43440','55300','65203',
                          '75754','27018','55026','56642','87718',
                          '99920','11021','39829','66757','16176',
                          '48794','72826','95781','12438','85819',
                          '91162','28301','93156','95697','17896',
                          '30976','53902','14276','25840','68844',
                          '26422','15731','78362','90888','20981',
                          '72063','57713','95586','41108','87280',
                          '98433','18085','27806','79616','12191',
                          '18502','46939','93930','40785','84365',
                          '72612','96459','19853','81131','94153',
                          '16310','96537','83451','64253','33547',
                          '80107','74984','13442','94902','20989',
                          '37388','85619','84826','51129','14174',
                          '70363','91970','29343','28524','50835',
                          '84113','86598','83073','18108','31156',
                          '85400','22961','32255','32022','53455',
                          '92915','83467','26525','87056','34262',
                          '88026','36825','60139','98732','13438',
                          '15489','11728','89362','53548','70252',
                          '17669','86538','54381','70578','37178',
                          '99175','26163','14890','70430','42499',
                          '72472','60802','71330','81989','17801',
                          '99939','82102','38121','49131','36435',
                          '16184','30935','63105','82716','75642',
                          '16699','80249','20529','62306','20061',
                          '60536','21410','98723','89591','98603',
                          '95952','71151','37460','37179','34801',
                          '56989','49263','82659','72949','38873',
                          '27621','76927','90065','43912','27628',
                          '41549','35131','63854','61984','32380',
                          '62330','76215','72896','85025','35082',
                          '64274','97378','79900','91652','55812',
                          '71708','47368','31270','87314','50134',
                          '51713','25644','85635','16320','77376',
                          '28054','92535','20963','67863','72603',
                          '65945','37774','77407','89961','30588',
                          '22940','88570','58652','15537','68281',
                          '86623','81032','33952','60995','36802',
                          '20671','92797','88983','17437','72149',
                          '52388','10096','68766','34848','91087',
                          '90187','28272','12221','94477','89580',
                          '21850','88675','80966','19630','21076',
                          '18142','30915','30221','50992','29137',
                          '43767','41163','40834','98170','84371',
                          '32507','63955','30486','81346','86003',
                          '17306','83766','42201','83995','51298',
                          '32104','21539','97113','10567','89269',
                          '18089','89886','74132','22286','33404',
                          '51076','77381','84790','79883','34533',
                          '85525','20190','46745','90455','36411',
                          '60855','76400','31093','75127','36987',
                          '21241','37451','86522','49894','30342',
                          '20007','71183','85773','86136','64317',
                          '61222','13320','30344','67011','17232',
                          '57370','28388','91579','70450','62597',
                          '69948','93208','44944','21577','51742',
                          '23507','13391','55366','78579','13148',
                          '78832','78521','21137','82683','63420',
                          '83570','62940','84500','61713')
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


