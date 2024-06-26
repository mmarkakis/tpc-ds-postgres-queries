
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
                          '58550','58267','20351','23210','58446','92052',
                          '34813','16946','14807','25695','95195',
                          '32662','58992','76498','45968','68347',
                          '92178','39945','55800','54207','44739',
                          '88788','83572','94379','38523','38506',
                          '30122','93737','11680','49533','29924',
                          '92148','23791','61399','86304','76022',
                          '25817','15958','11154','71230','77862',
                          '59352','68533','78320','51232','79529',
                          '97751','47295','94533','32102','19274',
                          '65468','53777','59304','60582','19886',
                          '70619','60320','85384','57951','64757',
                          '18883','39713','59427','42521','27020',
                          '68114','73140','35646','18866','36537',
                          '86072','56463','91255','54737','35322',
                          '68496','34935','90455','47570','59127',
                          '28992','55602','33898','99784','89954',
                          '48805','55538','84376','44634','65520',
                          '41168','45093','61314','73351','32553',
                          '34165','65675','55111','42175','21929',
                          '28702','59005','13573','90797','59524',
                          '34943','26688','45230','31396','94716',
                          '29929','62635','98453','76644','45548',
                          '14291','92346','98860','45113','18916',
                          '90413','19849','44141','53766','30000',
                          '10813','38145','30813','55787','29507',
                          '47743','74004','37812','83159','61522',
                          '47119','75189','80762','13843','95063',
                          '85810','71117','36870','20634','42423',
                          '86196','74556','29123','64511','37727',
                          '37154','42266','23976','34024','92447',
                          '36775','30113','38534','80142','59001',
                          '74045','66336','76060','38786','91038',
                          '66788','78338','55685','57785','91638',
                          '93262','71136','19239','81665','45211',
                          '90694','44507','93902','66929','53609',
                          '69380','48493','25599','27085','11073',
                          '31062','53895','89039','83891','12786',
                          '53089','59493','51945','51483','70525',
                          '97712','23755','39230','81455','20508',
                          '63617','84421','54477','72828','46780',
                          '96971','78465','39366','36209','36724',
                          '90200','45886','94683','12157','99346',
                          '54109','95812','12739','47410','31956',
                          '10412','57459','78643','55098','87864',
                          '32505','29270','86714','63999','79873',
                          '95323','29385','30360','71901','58044',
                          '29003','68487','55548','81574','57556',
                          '28605','20563','46838','52988','36020',
                          '95079','70061','22886','91070','48319',
                          '31235','47394','25747','79498','69210',
                          '43464','56994','35975','76413','72612',
                          '36924','73598','27652','65471','70800',
                          '43316','26378','95851','78278','47881',
                          '68529','60335','13792','74443','23325',
                          '95112','90594','82886','46016','91729',
                          '81597','85621','21452','41433','39448',
                          '58393','67805','95645','77881','93966',
                          '21291','22019','39363','12240','42713',
                          '87657','79420','60801','20564','68771',
                          '91057','62356','75157','24649','64880',
                          '20297','46881','54584','27792','75738',
                          '28253','53402','59281','53703','12018',
                          '75784','65428','91737','35595','39948',
                          '75853','64399','52765','56331','97773',
                          '50551','19879','42200','52777','23197',
                          '18973','50190','18444','59442','46929',
                          '34247','60897','55272','96758','46395',
                          '56398','15358','47316','51591','43688',
                          '15381','64833','14070','63897','98662',
                          '29828','99897','25102','56913','61999',
                          '17721','34759','33693','37737','36881',
                          '39884','64290','96719','19668','23569',
                          '34473','31158','38863','83883','35618',
                          '76917','77538','97565','14744','64326',
                          '54334','90391','90332','82847','70797',
                          '78523','87035','91203','52628','87389',
                          '88769','19939','89901','54631','26798',
                          '60057','80603','86922','58620','97555',
                          '97321','68871','99420','28537')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


