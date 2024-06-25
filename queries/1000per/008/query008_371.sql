
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
                          '53926','32256','59236','43272','86677','48410',
                          '64087','49033','26193','36923','20877',
                          '62762','15120','80667','89218','53510',
                          '10015','40933','99115','57512','94938',
                          '19150','73363','96965','11272','32629',
                          '96051','52751','34310','45546','66904',
                          '12502','73354','25017','86642','71128',
                          '39142','28043','64686','47235','20635',
                          '75211','64914','44494','56406','29573',
                          '92393','31990','59412','57742','78511',
                          '85338','68431','44521','54415','65875',
                          '41512','85142','89367','60146','66103',
                          '99007','81501','90632','10536','94540',
                          '52454','99853','83018','19374','48539',
                          '62507','74936','30809','63378','70393',
                          '50548','69170','82130','37530','41523',
                          '18292','47910','32770','81486','40023',
                          '82814','50709','73888','15195','64313',
                          '27731','89174','90792','99925','33860',
                          '26965','88273','74171','10615','47627',
                          '69122','89301','61675','48378','60391',
                          '47770','34539','51701','18197','60384',
                          '78520','55483','35198','92873','74557',
                          '54063','95170','78771','90635','77051',
                          '96356','74042','94851','87955','57404',
                          '98570','62875','96396','89724','44802',
                          '80979','28220','11189','50415','70781',
                          '71002','52358','93591','73375','88293',
                          '46986','53371','25893','11382','13116',
                          '86147','80038','69915','27203','55615',
                          '54978','15207','62103','52545','23971',
                          '10154','55723','29546','23873','89242',
                          '88981','24295','72768','20468','93424',
                          '52632','47394','95752','15785','44163',
                          '76591','79436','58998','29994','13521',
                          '98925','85540','60826','25317','77613',
                          '57047','11783','50514','68683','63213',
                          '38683','91473','93832','78024','57871',
                          '49053','97644','32386','92780','70816',
                          '17598','44732','98957','56363','83940',
                          '43299','67045','90174','86314','35919',
                          '11265','40553','63699','42126','72544',
                          '50532','78259','82573','81619','85608',
                          '65067','34484','83554','37415','35639',
                          '79989','85163','76220','50699','36931',
                          '15555','36232','39494','36148','14055',
                          '69565','70672','51744','69601','18926',
                          '63601','77884','24679','24369','47266',
                          '20724','42820','20539','18780','75549',
                          '21597','71039','31555','31208','88934',
                          '26374','41940','91872','27432','46322',
                          '32844','45465','95463','34917','12134',
                          '60511','97442','75161','72967','84870',
                          '58158','39441','28308','91680','70313',
                          '69624','54497','91113','42623','17134',
                          '19901','42790','40531','31975','59567',
                          '19643','26254','28876','20670','77990',
                          '82724','10983','83055','35307','18471',
                          '48562','60915','54242','65411','24328',
                          '34429','68199','96106','64550','30362',
                          '19639','67169','50760','14224','34056',
                          '63953','86572','35568','23679','21066',
                          '31132','94949','36395','37478','39905',
                          '39257','32252','78440','46283','47533',
                          '33038','54728','33766','96199','84224',
                          '34747','39519','70343','10800','75250',
                          '60650','56555','51305','70793','55909',
                          '23620','74069','20767','38539','57924',
                          '58352','37899','34312','44659','88740',
                          '90948','80934','98434','62114','50103',
                          '45216','55055','37920','45822','53123',
                          '96338','41958','47960','91643','66346',
                          '67525','57280','77964','20343','18303',
                          '65795','27988','65812','75067','99770',
                          '60872','82133','46256','56326','45344',
                          '60038','57531','94942','62478','46354',
                          '23394','45396','39700','88600','77448',
                          '88226','71187','40423','87318','56799',
                          '82911','39526','20123','41514','75951',
                          '59722','26024','29776','82674')
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

