
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
                          '21980','52300','16741','47540','79132','80878',
                          '32653','40589','33985','77780','88893',
                          '47436','27484','41987','78488','43127',
                          '42763','46904','82514','29756','11371',
                          '25787','26747','73307','90407','21473',
                          '37822','52875','11228','44160','24420',
                          '90110','52799','73795','47591','13183',
                          '35143','62245','68373','94678','65383',
                          '23130','45079','29637','71672','14275',
                          '21522','67823','30751','60967','65499',
                          '35772','75709','94697','77920','51427',
                          '89076','46712','20589','91190','63070',
                          '49232','10566','42401','85715','33515',
                          '57934','67590','13404','46584','66474',
                          '68487','91934','69314','31949','81654',
                          '80719','47725','41072','49078','40409',
                          '86742','58233','41062','62812','70641',
                          '30992','93488','77571','34413','22049',
                          '47702','57379','40065','79140','25548',
                          '93687','86170','19626','42012','68763',
                          '83684','13750','39701','17896','99755',
                          '90011','35407','64983','98410','32125',
                          '87867','20814','18220','45436','82422',
                          '50744','14893','19562','82983','91922',
                          '67958','11525','83865','20172','68572',
                          '44684','37733','43343','88218','99763',
                          '33731','88733','66977','95250','16843',
                          '38688','30715','52261','82042','40789',
                          '62328','66171','33995','45619','83239',
                          '59923','95526','16087','36314','54165',
                          '47984','19432','24925','33273','77783',
                          '25735','24592','70466','63444','31004',
                          '85598','18229','16544','10291','71012',
                          '14488','93946','14740','42854','48613',
                          '80001','24233','93016','69353','87108',
                          '36016','28132','59684','27375','45454',
                          '84386','70449','74140','70828','74825',
                          '32205','41293','16668','73349','64241',
                          '95762','50589','71004','98731','92776',
                          '39990','56545','98005','92088','19441',
                          '69831','78430','35773','50951','57817',
                          '65917','48152','57594','37369','43163',
                          '20132','88978','36365','69959','79636',
                          '90219','64837','83623','61263','15713',
                          '10680','67205','60098','18020','68919',
                          '62562','16305','88558','41769','43814',
                          '29872','45240','30514','38044','27575',
                          '99199','56010','46281','25663','31077',
                          '86084','85008','33732','35300','82516',
                          '56178','56449','47027','51025','45524',
                          '27093','77149','39282','44730','77249',
                          '99423','85740','64176','77486','21826',
                          '35052','85195','73331','51558','83007',
                          '11339','24343','83273','32001','74328',
                          '94210','72284','31630','24352','82127',
                          '77362','82700','79577','67938','59299',
                          '18971','60956','79006','92780','43400',
                          '49219','77781','47757','97814','10108',
                          '91874','28291','87163','85591','17706',
                          '72386','73556','17757','17011','77631',
                          '70703','90812','73418','43481','10933',
                          '75650','18917','65019','11057','65507',
                          '51037','45538','30296','83316','76704',
                          '26078','54613','11613','96504','17102',
                          '56995','10498','53787','94121','42183',
                          '13501','94253','84504','30666','62878',
                          '30170','64281','29232','96244','22607',
                          '33334','76775','35552','53297','95987',
                          '62416','78490','43568','70966','93124',
                          '72688','74936','87339','96483','24130',
                          '87770','28395','13520','34498','41174',
                          '15236','44900','86442','48395','60397',
                          '59711','78414','30064','25990','57374',
                          '70787','86226','65554','22796','34668',
                          '90534','49933','44272','74697','56544',
                          '46411','83105','23910','32334','95438',
                          '32969','79070','10266','93714','32963',
                          '48796','55076','49181','10732','19940',
                          '92759','92100','39664','71252','84932',
                          '74066','55907','28953','43353')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


