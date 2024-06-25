
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
                          '90006','48687','88657','17367','87525','63407',
                          '35403','93503','78223','57769','46155',
                          '61713','34092','84976','69515','63527',
                          '70598','23595','70441','70881','98875',
                          '15523','88027','92852','84010','81326',
                          '39177','42056','19269','22219','46171',
                          '52831','15563','83936','17208','52374',
                          '81883','29110','88437','72252','91970',
                          '63533','93228','95497','50910','38694',
                          '37792','34664','11120','70091','38979',
                          '72424','28827','93463','14305','28266',
                          '81309','99675','31305','23689','92868',
                          '35891','27322','42492','55989','66160',
                          '89734','13027','93192','84152','77812',
                          '91161','46895','33718','94183','59973',
                          '35465','69727','63513','84817','15130',
                          '59720','29964','15397','92941','99586',
                          '16181','54441','86453','99701','52849',
                          '63384','37353','37868','85676','24882',
                          '68903','58843','32101','61915','14576',
                          '94974','87923','53454','27860','46604',
                          '41332','30294','93073','44386','47941',
                          '17394','78085','92147','38857','75405',
                          '47936','53478','42926','41257','20370',
                          '75811','26930','57341','22981','36715',
                          '74043','34947','78170','96760','27917',
                          '12151','15731','18819','52070','63474',
                          '95161','64901','58663','28913','16054',
                          '58588','84366','18043','96015','57397',
                          '92803','10821','73203','15136','38366',
                          '96754','61973','65692','79605','50074',
                          '95748','88877','48028','43221','42567',
                          '75054','28607','93581','24848','30715',
                          '45027','42888','96844','46760','21333',
                          '96810','47760','60753','59726','99404',
                          '61118','26292','81020','70118','40090',
                          '79796','75212','72999','30845','87988',
                          '21640','18119','96756','68226','80296',
                          '65008','77526','60412','33789','46509',
                          '34363','93704','69066','66644','34199',
                          '16730','39997','77857','40392','89623',
                          '78865','32727','32018','99434','17285',
                          '42029','64036','62570','61931','12287',
                          '38058','65027','35354','89789','22584',
                          '67836','17364','24040','46100','38764',
                          '94874','93253','39960','71153','15813',
                          '10594','63541','58409','29410','55510',
                          '60625','24811','97003','39358','65430',
                          '15468','13979','15771','88296','85699',
                          '43189','30951','99591','86644','80730',
                          '68076','17235','22302','22042','79003',
                          '83850','42159','78848','78179','85190',
                          '35932','62559','20422','36422','80722',
                          '79114','49012','74927','59431','32222',
                          '45514','30244','87159','40971','28343',
                          '29952','44604','67818','73983','98099',
                          '22735','57847','97133','78302','84100',
                          '31681','86162','97462','92954','48843',
                          '69814','95629','56606','29383','85816',
                          '88494','44742','95744','16152','51209',
                          '47754','78160','38519','23622','88910',
                          '56761','77648','78563','80976','49869',
                          '75430','20490','78204','76561','42790',
                          '36396','90595','38082','65087','28710',
                          '21723','61275','49953','72077','71614',
                          '48927','53502','16501','46162','53033',
                          '54675','25108','95292','25008','67471',
                          '28581','21971','95032','56299','89906',
                          '27476','46696','98492','44993','82218',
                          '57249','73418','87402','85490','62730',
                          '11701','71919','21173','62189','76053',
                          '61364','71264','16391','40231','17404',
                          '95833','98716','71093','10577','78657',
                          '25619','29062','15143','74640','71811',
                          '55829','61170','91820','33498','14733',
                          '91672','96010','27485','69642','56562',
                          '85287','72235','44873','76266','97937',
                          '28370','71531','39969','72864','30599',
                          '54790','17661','90640','78625','47233',
                          '54708','53359','67264','60785')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

