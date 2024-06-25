
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
                          '12926','79476','44906','62950','96535','40195',
                          '57543','37787','53789','41341','94022',
                          '86500','77262','44942','53715','19516',
                          '88680','75079','32519','23018','31731',
                          '32861','26010','31210','96592','82898',
                          '88176','31361','25379','14490','92493',
                          '59749','95914','15543','34907','21119',
                          '86655','25002','81887','49120','49297',
                          '18652','97187','52704','68343','23833',
                          '19572','29431','69249','37459','89181',
                          '87561','71098','37711','20822','12891',
                          '82349','19614','33753','30278','59072',
                          '50008','56731','34926','53261','58366',
                          '24060','16274','78007','80812','37262',
                          '77331','88190','17967','76125','34030',
                          '67857','37278','84140','25606','85720',
                          '82582','27043','61723','46307','78924',
                          '39711','29472','19070','49874','64377',
                          '50415','43465','26700','62201','54117',
                          '56328','96370','72004','26585','56808',
                          '78417','89872','81089','80365','50316',
                          '87913','24679','20538','70072','49495',
                          '19407','69533','40728','74819','69628',
                          '84995','55336','65175','88419','46435',
                          '86538','44802','83635','29963','48072',
                          '99125','14903','63564','26037','52492',
                          '77654','28220','30620','29664','74145',
                          '79414','24293','78954','46099','21491',
                          '27028','97830','23937','73612','15008',
                          '12401','68431','90315','90439','59983',
                          '43945','44642','60559','84310','39475',
                          '90745','29869','16671','56878','60656',
                          '27868','69531','81682','53449','74139',
                          '92760','21659','27068','99955','87758',
                          '28378','88141','73573','74867','68977',
                          '77309','43012','97556','15034','96939',
                          '40538','53193','18204','92797','63098',
                          '52754','62731','49736','38376','26423',
                          '97418','82328','53941','41638','88567',
                          '75048','49410','25796','67859','70288',
                          '16081','39314','45188','75867','66035',
                          '48179','67812','18593','45618','93252',
                          '93471','44675','44338','13822','62373',
                          '56202','76861','55842','66668','91933',
                          '38801','86368','94029','99461','94198',
                          '10320','61943','22877','31968','80299',
                          '15587','90635','60839','91919','51722',
                          '96559','19271','47359','89332','32695',
                          '91898','59845','75523','32298','71022',
                          '23584','98144','47730','96346','18487',
                          '66413','13362','35092','59468','15904',
                          '74553','57237','50866','44042','65726',
                          '13883','97645','52640','97101','59261',
                          '74733','28376','12814','29925','71151',
                          '41188','32726','18395','23316','89366',
                          '33246','48409','19269','64284','44284',
                          '80024','11973','29286','95934','12163',
                          '11022','19336','32814','20249','60358',
                          '18656','11051','22969','44953','93282',
                          '52289','49054','92820','18636','54104',
                          '17419','10020','61033','26833','95445',
                          '12806','42772','68606','39084','84459',
                          '79997','78583','82817','96397','14229',
                          '92852','14088','53764','19783','58536',
                          '35446','62459','44814','96255','48905',
                          '57476','48824','37949','93450','50673',
                          '41740','73959','41735','97437','13482',
                          '93477','75101','77353','96041','88983',
                          '99355','20365','46419','73506','95774',
                          '65391','86887','16350','31952','25011',
                          '68265','11926','17749','16584','44179',
                          '28544','93766','12178','30230','88670',
                          '96940','44671','17769','12113','68440',
                          '76769','34686','34649','99970','62296',
                          '14863','68803','58466','56422','16154',
                          '68802','29072','18663','94945','16597',
                          '62450','64505','93301','88763','85014',
                          '14488','38470','62524','39291','24636',
                          '54168','54683','73801','89609','47631',
                          '40677','99751','91306','30644')
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

