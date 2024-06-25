
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
                          '91840','67830','46798','82915','45419','77147',
                          '38080','36894','53613','68721','66868',
                          '91621','13503','54999','81166','17970',
                          '45822','70361','81637','28072','67144',
                          '74826','53397','57959','56613','98819',
                          '47387','70050','88712','78151','19652',
                          '27027','80006','90212','36189','11553',
                          '10218','96961','14520','56377','40573',
                          '15056','71962','35035','85092','31498',
                          '85657','39741','75506','17144','31929',
                          '66510','68117','65458','33848','27647',
                          '23200','62910','90898','63296','88786',
                          '13453','42155','49964','67193','20278',
                          '11893','29355','21083','32829','85711',
                          '27787','14058','15661','52764','15115',
                          '69841','62001','93159','45999','41464',
                          '27829','17822','51592','78119','92154',
                          '44058','93696','36430','67759','77901',
                          '67298','57761','58088','33851','96972',
                          '69007','23740','84511','41040','96386',
                          '72972','32811','21734','58955','57789',
                          '88290','42003','20426','52116','92054',
                          '39915','32006','70646','24596','36785',
                          '38749','91002','77641','50115','72767',
                          '34234','10988','52482','98294','67090',
                          '95591','39341','80080','68500','93548',
                          '87379','30621','63036','24432','45133',
                          '64349','48435','98750','42937','87549',
                          '79622','87290','35442','84399','30769',
                          '72932','36114','93973','55599','67261',
                          '68630','95249','35065','87179','61876',
                          '10359','43380','71066','84206','55064',
                          '31686','27901','49052','46608','34686',
                          '63461','95231','57491','59198','75456',
                          '49833','15936','25309','65339','92549',
                          '81379','51023','46526','63806','49500',
                          '79693','30431','76950','23079','68756',
                          '23887','32876','99384','29688','38221',
                          '65481','41119','84946','35412','50686',
                          '41654','27143','90115','74536','79935',
                          '85211','18215','56903','95716','44251',
                          '30472','99464','92599','86654','62535',
                          '57610','13285','17717','96133','75295',
                          '35580','25645','66760','34130','92867',
                          '95479','72317','97534','18786','10164',
                          '55388','20134','20048','87035','49854',
                          '33787','73740','71898','16031','59164',
                          '81879','26529','16268','71767','28066',
                          '91367','49997','73661','83118','98237',
                          '11628','21213','24693','61602','29004',
                          '55549','71101','80741','92041','40516',
                          '40239','44900','89088','83595','31190',
                          '63808','65257','83182','18110','92083',
                          '39397','95766','51593','99229','78245',
                          '33076','37481','84272','84561','35528',
                          '38096','76625','29189','73202','38089',
                          '83398','43961','10586','24935','77258',
                          '69377','37229','61010','87101','41748',
                          '69916','76818','46123','18793','90049',
                          '82670','25492','29052','57814','28424',
                          '30061','63731','54670','46034','90941',
                          '16237','31391','71546','67029','91885',
                          '79432','27214','73542','59190','18821',
                          '76682','36700','72136','22962','61961',
                          '21888','53393','13397','89932','50186',
                          '74994','47183','41122','42875','61804',
                          '77503','20838','65281','56651','10477',
                          '24392','83833','49544','85186','12100',
                          '40551','38173','36583','57302','73092',
                          '81110','14073','27317','96619','31601',
                          '53086','47210','47769','29190','13469',
                          '88533','84962','46253','11182','45354',
                          '93814','66369','12148','51512','50647',
                          '95312','99916','25685','81827','78011',
                          '38677','31237','99364','23706','87577',
                          '10921','26528','66796','80393','80682',
                          '84774','60186','59759','34007','59289',
                          '80445','28623','11815','21496','72620',
                          '31684','56326','88287','35527','44404',
                          '13552','56025','54689','48195')
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


