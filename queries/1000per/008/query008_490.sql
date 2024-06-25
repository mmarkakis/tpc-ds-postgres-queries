
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
                          '22335','79392','58200','61843','98210','60174',
                          '22495','90933','65778','62647','48643',
                          '95918','72604','10234','24141','52007',
                          '76088','65014','76118','68786','62234',
                          '95385','97912','45456','78442','92070',
                          '57027','30580','53223','99874','11250',
                          '79796','57667','36511','87906','14887',
                          '37360','18833','99890','76962','71231',
                          '61408','82885','19003','30578','83779',
                          '61191','24613','19232','38027','10107',
                          '17938','15330','52898','44715','17511',
                          '56427','46092','18672','54892','77540',
                          '90877','94686','37782','34710','33215',
                          '43759','95270','36162','88881','75225',
                          '70024','84569','64570','26320','66854',
                          '95241','14662','81192','46035','20883',
                          '24840','98657','94850','97728','69975',
                          '63961','52565','37425','32751','82630',
                          '81749','30129','62500','81160','47336',
                          '56726','16638','72635','23353','35727',
                          '11304','81911','53776','89456','35912',
                          '40768','84370','26462','36531','26806',
                          '34663','71599','46748','16056','73948',
                          '22398','79642','19938','95534','45551',
                          '57394','89960','59797','93608','29399',
                          '78716','85434','41129','26202','21971',
                          '89031','22758','35047','41989','82937',
                          '63201','92967','75613','56549','51829',
                          '45861','33592','32060','59291','85378',
                          '89874','50750','47882','68372','47990',
                          '70123','37723','19455','18866','10600',
                          '83110','52464','89198','32145','38111',
                          '56853','86179','98760','75737','85018',
                          '12103','27106','67452','55886','17299',
                          '83148','13135','78439','82425','39088',
                          '32284','52782','69145','80259','56510',
                          '16526','95494','34084','31839','47910',
                          '61397','59762','36525','93005','97894',
                          '31634','40618','47144','69552','51819',
                          '45373','44458','58238','98567','54956',
                          '58526','93046','95939','11809','96585',
                          '23743','32626','81573','12079','81377',
                          '88064','98682','64789','39650','62085',
                          '99001','40302','75026','76662','21177',
                          '78419','80082','12703','73002','98885',
                          '98472','66669','85521','54870','67104',
                          '89479','19851','25805','39783','79728',
                          '94261','77445','36018','54062','44003',
                          '81685','60226','16362','10784','55525',
                          '73917','64415','66806','41396','32498',
                          '95454','74680','61402','24546','93319',
                          '96640','83080','14556','77200','93389',
                          '72866','28067','50979','74226','37619',
                          '64242','97385','64974','25429','13928',
                          '94057','64033','44107','40952','80837',
                          '23357','33288','77530','34406','19109',
                          '21027','93551','57823','80852','90196',
                          '72347','62469','37103','93217','96833',
                          '21490','57684','62923','42041','80925',
                          '39052','62781','56977','55944','30336',
                          '75186','63235','63904','33886','38142',
                          '66650','99469','54850','79397','61047',
                          '61943','34964','92122','84120','19475',
                          '76572','97012','38772','97140','33005',
                          '90878','78761','21452','71189','73150',
                          '14028','89705','29310','40203','37622',
                          '17181','96916','96116','25526','83304',
                          '58772','71409','46495','21143','65235',
                          '53703','80071','80670','97254','28076',
                          '24137','10065','79186','10864','35703',
                          '11583','96534','79497','41925','96562',
                          '24426','47634','32171','81325','18021',
                          '78747','52206','79753','58923','15252',
                          '92679','68176','80386','47343','71195',
                          '61446','72259','65457','30214','60254',
                          '10944','25196','76776','77016','88621',
                          '28396','53804','85153','46347','31943',
                          '57766','24443','83959','20503','40710',
                          '38907','20193','10757','13499','13460',
                          '81097','55797','75852','90276')
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


