
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
                          '98945','49583','82959','90223','77193','92509',
                          '95645','94490','35386','16835','99207',
                          '67623','83870','39377','77281','38129',
                          '66929','35384','81640','12071','95369',
                          '71497','44272','95802','68631','85224',
                          '11724','37723','74576','73563','91534',
                          '39842','10941','21291','19850','75945',
                          '45208','64157','76706','35734','20778',
                          '25221','69444','29138','70010','57515',
                          '37517','29641','88884','22922','94759',
                          '75957','67630','93853','18523','49350',
                          '44798','89075','67079','65145','50166',
                          '52946','76796','39111','94626','59612',
                          '33929','30799','44477','86201','41567',
                          '18787','32747','76774','86074','46734',
                          '87829','68791','29746','71337','91010',
                          '15050','26209','90706','50179','84094',
                          '43939','53430','95273','80130','68264',
                          '49124','14907','53450','17138','35521',
                          '22890','28110','71417','68644','70156',
                          '72876','33945','19225','89761','45505',
                          '13541','47767','61995','44697','80139',
                          '51475','35032','13121','24344','91309',
                          '96416','22129','35486','64480','38030',
                          '93512','73793','93828','36368','62732',
                          '66033','67469','92282','11247','52156',
                          '83294','70913','33879','76856','84404',
                          '82669','48783','81325','57670','65615',
                          '10603','19621','35643','60079','60031',
                          '33124','47769','39725','59529','99103',
                          '72005','14036','17169','11497','99789',
                          '66063','94179','42725','49162','36021',
                          '84136','80367','89554','38724','79589',
                          '89935','45228','86039','52124','14435',
                          '17603','30256','14968','53745','91843',
                          '19406','49725','93885','22918','76649',
                          '79674','19431','39462','73813','90833',
                          '43587','19505','84207','51386','80702',
                          '58404','21193','17043','34915','91617',
                          '52522','56081','49447','61890','12659',
                          '93594','61182','42267','20486','31449',
                          '36926','62421','80525','30634','91616',
                          '58850','72012','55254','97968','21318',
                          '28380','84270','96204','99175','99959',
                          '57541','42262','51524','92407','77493',
                          '91279','39930','49813','18030','98666',
                          '57851','20445','46904','17375','39926',
                          '34902','97895','22779','11564','73951',
                          '17606','29472','49257','36644','18166',
                          '48913','66061','71728','48214','16423',
                          '88065','94198','92529','86510','79072',
                          '54635','38320','44506','78568','71315',
                          '83835','70793','12435','76537','66571',
                          '78790','62006','23732','85816','85062',
                          '99945','24411','72909','47729','83505',
                          '80162','39823','61229','93846','56957',
                          '22276','75183','29975','92184','86922',
                          '82905','66539','49252','60748','67689',
                          '97356','96356','23995','79718','60291',
                          '62657','53019','85103','46720','20662',
                          '52057','41423','23426','99802','15284',
                          '49322','99450','22242','97182','87078',
                          '14144','54328','32050','87302','31926',
                          '96658','23167','46385','13113','58207',
                          '34514','35965','41591','80354','24126',
                          '22960','39437','18402','93759','74767',
                          '50054','18506','87772','15518','58263',
                          '22781','66838','28289','20830','77752',
                          '29598','36509','73519','30516','62724',
                          '97750','13575','99115','87422','33966',
                          '72024','38219','79413','95910','75731',
                          '77355','62170','17565','61745','70140',
                          '42991','66890','83810','43185','21581',
                          '82265','44844','55439','20162','11063',
                          '98057','44605','54992','68930','48883',
                          '16489','92198','45273','88788','33747',
                          '10160','89567','96165','72689','87701',
                          '46914','55935','68377','64455','92463',
                          '77918','69337','81873','78901','40479',
                          '54621','50567','52509','79491')
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

