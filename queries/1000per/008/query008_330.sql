
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
                          '48919','68551','71162','21797','38568','71042',
                          '91440','33671','23930','17304','31713',
                          '57560','53924','30057','24707','65206',
                          '12812','92237','96792','71951','33497',
                          '50425','66613','16174','10443','21379',
                          '20912','82072','83106','62146','87255',
                          '98422','67746','37995','64918','77840',
                          '51662','81213','73179','93686','86269',
                          '42917','80141','94683','69529','29321',
                          '42424','57765','30668','81299','79798',
                          '75349','18091','91455','16105','23637',
                          '70741','37940','51139','50629','31195',
                          '65399','10909','55029','64448','73188',
                          '70370','17520','92552','83095','71587',
                          '72100','42184','93482','82602','94530',
                          '20067','91468','49763','81222','84118',
                          '61988','54444','81858','99540','33194',
                          '42396','33091','47587','65500','13513',
                          '76122','76706','99648','71176','39583',
                          '98489','85484','65088','74393','83728',
                          '73031','72548','81479','97701','98480',
                          '78042','99826','23752','13872','60369',
                          '10861','34501','14916','81475','30922',
                          '77797','92866','15659','69311','68646',
                          '64366','50340','69324','11692','21740',
                          '80112','52905','27084','30723','42683',
                          '19128','43217','68094','67653','69560',
                          '42565','90597','14038','18457','24570',
                          '24642','51370','47000','77316','28068',
                          '37278','78617','25726','23464','17308',
                          '61034','75567','82691','54371','14141',
                          '35369','49013','30050','25719','10522',
                          '92150','32415','26123','74539','78325',
                          '10830','30689','98110','16816','61257',
                          '78508','82668','68197','79573','46332',
                          '10991','88956','52003','86853','25691',
                          '68405','49455','21593','99949','25576',
                          '74023','37797','87240','47742','31774',
                          '84656','83970','87230','69705','67477',
                          '18012','99760','47483','76343','31321',
                          '67123','79761','30843','73648','59329',
                          '11272','58289','78320','14933','99145',
                          '89395','43492','32117','81153','36075',
                          '23257','75724','46583','85793','10480',
                          '65548','35482','53763','29913','20121',
                          '37046','29601','92671','71530','76514',
                          '30865','26957','45956','76174','25968',
                          '30978','51632','21502','75519','39126',
                          '87382','29234','48852','41368','64338',
                          '68159','31006','94185','67847','65514',
                          '43863','20460','30461','24032','96788',
                          '60191','27366','29143','59588','68132',
                          '64582','68826','46199','29297','56346',
                          '43839','50570','84221','86950','90485',
                          '94172','18197','12016','56910','79238',
                          '51889','73792','18162','67026','96260',
                          '67683','45575','23162','33305','48365',
                          '96544','74222','13311','54899','63527',
                          '55992','47806','41634','24686','70053',
                          '66581','96737','14037','22656','94598',
                          '78722','36482','58469','32510','42586',
                          '15286','53453','77004','98371','97689',
                          '53256','55056','67697','11368','68435',
                          '28578','43537','11149','52913','49621',
                          '54062','66908','61716','25688','98951',
                          '86450','11471','14818','78698','26787',
                          '40947','65635','28636','22647','29431',
                          '93713','27908','12212','81094','35449',
                          '31504','79147','95845','27848','16715',
                          '39402','49432','91452','43775','67846',
                          '97835','85064','28524','58657','14241',
                          '28630','26748','23078','85455','62088',
                          '13996','52487','73213','26362','99641',
                          '94663','46255','62580','88913','47699',
                          '39678','27289','18847','19142','76155',
                          '15937','15834','45271','74746','89048',
                          '31619','20682','36831','86900','71753',
                          '53847','20440','50661','57182','77401',
                          '46611','37416','40622','53810','47001',
                          '25875','54520','82486','90978')
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
  and d_qoy = 1 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


