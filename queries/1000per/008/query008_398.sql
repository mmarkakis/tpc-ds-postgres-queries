
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
                          '19940','99381','23219','36283','39217','78727',
                          '12180','26151','87045','12470','65169',
                          '50326','40041','83195','10545','73606',
                          '46874','92882','19674','69963','25324',
                          '89803','90307','38681','32164','63019',
                          '58779','67618','67591','50630','57620',
                          '84215','28408','64923','67699','39882',
                          '16072','30736','62588','42615','61864',
                          '29335','42554','37112','15189','67329',
                          '60821','98470','41492','18187','12310',
                          '72663','80280','45647','29620','38778',
                          '59200','50537','66245','90284','95187',
                          '65247','91925','68343','77090','55407',
                          '15516','13761','58105','52368','44397',
                          '54819','12998','33238','70762','32651',
                          '85623','28410','39247','22018','30959',
                          '60699','85818','47592','68172','29080',
                          '82124','14220','93555','41211','55120',
                          '98980','81245','34771','86547','91263',
                          '74319','13925','81866','44090','92865',
                          '55254','39039','80309','88227','62879',
                          '28779','43836','26004','52236','44082',
                          '91063','38957','62985','60462','95737',
                          '89898','23280','89652','99108','95225',
                          '17523','66264','37427','85388','92393',
                          '39772','78242','39171','85173','79640',
                          '63857','37630','75703','75987','97118',
                          '99369','96628','52876','74462','53864',
                          '87502','73801','39787','77844','85410',
                          '90287','65326','97001','53200','33782',
                          '51961','12877','87611','52263','62022',
                          '91984','31525','72939','39278','29994',
                          '85895','25923','29162','92427','94080',
                          '93437','88954','72242','26143','29655',
                          '40176','10997','93075','72116','29682',
                          '84226','67979','90276','48205','62206',
                          '37075','60483','22891','96559','88251',
                          '63896','75779','81685','76845','94211',
                          '19383','51073','27817','94284','87115',
                          '30189','76358','66527','68819','97352',
                          '10858','76971','45095','97505','34065',
                          '77703','25529','93633','49383','81093',
                          '67945','86380','65325','97027','19228',
                          '93200','66224','11709','10155','59855',
                          '35613','13230','67610','94827','32665',
                          '75585','99695','79805','76937','51084',
                          '18446','49445','76645','77622','60766',
                          '31262','88993','80219','34480','15714',
                          '91409','72015','59873','95600','35958',
                          '73102','35799','23559','68829','66453',
                          '95050','94651','79328','16177','87592',
                          '50311','40877','47300','48241','20480',
                          '36494','36774','99239','26233','52615',
                          '65411','19124','47640','67594','44883',
                          '56814','15519','70296','78250','23591',
                          '32719','96635','38013','25461','75168',
                          '12774','33588','55490','53008','72001',
                          '42424','32242','41744','20047','27319',
                          '37891','13900','35864','29721','39605',
                          '47740','88978','26891','69284','89262',
                          '34349','16789','92475','65291','24943',
                          '74621','53685','10982','97531','48766',
                          '33866','94857','98103','38856','54963',
                          '68282','70209','64378','54157','60383',
                          '41608','83410','85792','46495','79623',
                          '38317','21601','29388','99829','22361',
                          '40986','25674','86006','97461','75341',
                          '60112','25706','43984','93313','21126',
                          '16496','31637','83319','42076','37327',
                          '41083','73416','86007','40673','37457',
                          '70161','48906','21982','27421','61259',
                          '40519','23906','86295','15623','32571',
                          '37744','34902','77299','17449','55831',
                          '94400','49604','78767','35063','98934',
                          '82993','59596','37646','10221','37179',
                          '96264','14451','55228','85555','55614',
                          '37058','42476','32392','42541','12436',
                          '55524','38628','24662','24008','40301',
                          '10659','94669','65217','92862','74997',
                          '47955','26377','47486','32325')
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


