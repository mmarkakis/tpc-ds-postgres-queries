
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
                          '66447','17223','63546','83458','15496','66745',
                          '22018','17791','53847','70731','75273',
                          '52569','43348','66146','62571','96298',
                          '25645','47376','29652','41040','55070',
                          '78413','28366','65932','87801','49282',
                          '66780','56025','70457','80020','39568',
                          '83906','10432','59715','42096','16592',
                          '98461','88802','71427','33664','67654',
                          '36378','73217','68883','21832','59690',
                          '33255','33253','22272','51378','32607',
                          '15384','92340','87857','85875','88824',
                          '19676','35637','81782','54186','56839',
                          '80367','92644','33243','92696','34905',
                          '41165','59267','44596','29451','81472',
                          '98784','80997','70122','41737','68110',
                          '56930','23458','21687','45630','13276',
                          '72589','56785','22561','75440','18735',
                          '80801','80149','66243','15177','84629',
                          '10965','54403','71295','87064','28775',
                          '53985','34741','44740','45091','91645',
                          '38833','64552','22656','77759','46453',
                          '42240','14779','97797','76693','79368',
                          '75033','49111','60589','82340','53702',
                          '10331','50555','87921','34975','24033',
                          '20007','57182','46500','51788','57238',
                          '63723','93876','31464','46866','33467',
                          '37390','67852','52654','31387','22863',
                          '39560','90902','30241','12846','49407',
                          '61094','79638','49229','59010','54222',
                          '33763','51177','89621','19005','88745',
                          '95389','61929','56270','80760','69376',
                          '44463','45247','97818','11962','17830',
                          '81551','89829','41185','32794','98003',
                          '89831','36442','66885','65246','44734',
                          '38422','59258','39199','14756','79396',
                          '57447','89265','70008','49645','32787',
                          '61220','91634','56389','65510','12385',
                          '89807','18589','93805','62793','67877',
                          '89307','74296','59448','99970','57547',
                          '66619','64716','29740','71657','72816',
                          '75453','44388','12283','71164','65912',
                          '13180','42360','57869','36360','10095',
                          '31032','66022','31010','78251','29327',
                          '14495','12704','26734','30257','12543',
                          '76553','99355','44316','10579','94665',
                          '34331','32560','39173','41610','81999',
                          '40773','96474','85340','63157','39838',
                          '67018','28728','85274','57753','14342',
                          '58365','39029','49173','64744','16709',
                          '58675','54964','98146','74646','36029',
                          '97131','97790','93914','61341','32916',
                          '25925','86582','83997','91092','40877',
                          '80864','69539','88914','31267','46303',
                          '56087','85694','35947','72971','92292',
                          '16446','71339','80386','68178','15430',
                          '36407','43216','35295','26310','41059',
                          '75951','21609','93563','78576','81277',
                          '36623','62718','18553','44645','41704',
                          '72966','74992','95379','98353','29203',
                          '59833','65665','87754','79118','48718',
                          '63377','33718','45677','86067','65035',
                          '56756','84645','47366','54210','88574',
                          '45776','21775','27342','72425','48304',
                          '71316','14308','46337','77403','69609',
                          '80931','56987','40026','59667','99417',
                          '96319','82004','51134','76953','18097',
                          '45814','84669','10009','71217','79029',
                          '45872','88945','99683','44760','54746',
                          '33308','80797','87690','20187','61222',
                          '48267','69308','96867','77990','54392',
                          '59699','10896','61858','61689','37683',
                          '21916','72189','66579','30807','35961',
                          '99111','14118','63674','33342','33609',
                          '37948','70974','58484','98115','45369',
                          '19074','92958','86887','55175','78410',
                          '99514','88481','51940','39426','79082',
                          '99873','16112','99083','33568','89730',
                          '11032','99709','20435','51148','13820',
                          '41924','79666','41342','51193','76856',
                          '23807','77547','82094','67799')
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


