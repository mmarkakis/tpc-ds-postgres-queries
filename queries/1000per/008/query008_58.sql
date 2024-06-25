
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
                          '32667','29810','29243','58870','42177','73304',
                          '40807','11590','88200','73100','48563',
                          '46643','42413','87995','33995','42058',
                          '49969','18326','69064','63192','56898',
                          '65741','73941','87057','99801','82076',
                          '89455','51144','86657','90691','54659',
                          '86972','48833','10550','51430','28010',
                          '49747','96928','10532','54299','31321',
                          '51625','76398','35388','65683','43949',
                          '24423','60199','83104','80000','76067',
                          '26212','25226','63134','71242','11325',
                          '75759','30450','48517','53512','21865',
                          '99414','71828','33901','79771','12464',
                          '28469','45593','28758','13382','74575',
                          '43087','72953','52768','83693','91892',
                          '86062','16117','15499','98617','71952',
                          '33291','65184','63115','63804','68687',
                          '37914','60236','28232','96436','61270',
                          '40157','28221','16130','15645','68213',
                          '13072','90022','71631','72208','26611',
                          '64946','81308','90899','27423','41893',
                          '83122','96367','56838','88240','31392',
                          '54121','25481','69996','56618','59536',
                          '16948','42569','23625','67179','46283',
                          '27505','85648','88831','41710','10834',
                          '64804','20879','64579','99559','44939',
                          '47419','34870','87978','60037','84247',
                          '68070','60467','71729','72458','71988',
                          '32523','12029','32837','50066','60947',
                          '21883','62329','52375','57405','58498',
                          '49321','25122','76286','53828','20860',
                          '50597','27535','37457','71268','82115',
                          '86465','93728','34460','81693','11464',
                          '88994','45630','31769','62865','51653',
                          '88295','72464','71603','12258','80946',
                          '59112','39444','33627','32067','57885',
                          '88983','95152','72698','39606','48073',
                          '19922','78330','32177','47588','47678',
                          '17498','29093','75821','19954','92524',
                          '28148','45570','88274','93248','54823',
                          '49889','51573','66031','27986','13742',
                          '98896','72172','44844','88958','59132',
                          '64323','71036','33585','65237','68798',
                          '99006','24381','14123','54087','90181',
                          '96912','56342','43244','93516','24907',
                          '23701','56501','18438','28506','15388',
                          '89405','73599','98874','96362','98407',
                          '98020','70142','42481','29270','38807',
                          '57842','89882','30359','31825','42802',
                          '95619','81115','10462','45533','57183',
                          '77367','28218','71917','10485','82460',
                          '26070','33174','42834','28117','92606',
                          '94927','77026','15591','71358','88038',
                          '23790','57563','80956','18428','29698',
                          '37793','73677','96653','22513','77501',
                          '49561','54908','86915','82699','27517',
                          '77676','73332','67927','83193','98443',
                          '77006','29016','38297','71023','26190',
                          '95474','55192','11486','63040','41312',
                          '67422','59055','36499','80469','67385',
                          '34019','96956','65733','12714','71075',
                          '88758','90894','14319','71751','31996',
                          '51028','98609','95914','99654','55164',
                          '73787','51692','60416','47439','84130',
                          '91848','94449','90913','13839','76025',
                          '88695','55815','83251','29336','89255',
                          '33338','67372','32654','27055','76265',
                          '43855','79259','48608','24697','81393',
                          '36741','98540','36300','28911','33838',
                          '93426','78872','76260','89223','65262',
                          '64117','19027','25619','85872','50369',
                          '56406','87419','92351','19911','12364',
                          '45331','86790','77016','72783','36976',
                          '17707','44115','94711','47798','32080',
                          '55381','83932','60330','47910','79328',
                          '44772','82312','94593','77897','40627',
                          '75671','98828','72929','57943','43754',
                          '48960','25884','87928','13633','39564',
                          '18819','67799','62815','91073','13641',
                          '30626','63721','18966','78483')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

