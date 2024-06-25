
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
                          '15918','25340','89465','85006','88311','78406',
                          '59408','45160','63952','39761','91129',
                          '35843','12273','33466','96413','57532',
                          '76275','80181','15142','49408','80762',
                          '48569','17763','57454','63736','22925',
                          '76861','66319','41545','85991','39514',
                          '32780','57035','68760','21217','19497',
                          '62176','83197','38247','65163','72433',
                          '68801','50050','47095','48061','80725',
                          '65560','36317','44676','10944','67831',
                          '98033','31165','83126','10456','13719',
                          '81223','98808','62426','93712','92272',
                          '29074','67427','40838','87805','83935',
                          '75708','93216','94227','64303','31636',
                          '38673','39262','80382','81689','67836',
                          '62857','30574','78636','22945','87192',
                          '83111','10048','76483','35508','72526',
                          '28249','86907','18280','32499','68639',
                          '99785','90139','41843','67476','94157',
                          '45551','75072','59118','57476','85901',
                          '90860','40057','23098','12715','19309',
                          '64972','56437','33983','86000','98779',
                          '93031','92083','30454','68164','60713',
                          '37955','10309','81607','67711','92088',
                          '36134','73715','53465','44009','33371',
                          '19542','27791','24708','83215','71950',
                          '84355','21585','49113','37701','44982',
                          '10287','76346','76031','27782','86711',
                          '13759','30388','55873','72545','94580',
                          '86432','72964','93709','58312','79346',
                          '26403','59637','91375','22447','48174',
                          '41952','54671','14536','38142','34834',
                          '85883','71834','81238','23047','11948',
                          '82975','62386','69191','77476','44977',
                          '52842','66616','51674','61048','48028',
                          '42112','94326','29689','14338','40508',
                          '26632','45221','67479','12369','91848',
                          '65227','98126','96603','36591','53001',
                          '88263','94385','68312','71609','63195',
                          '32771','69423','16256','86552','63059',
                          '17072','43455','30037','43453','38505',
                          '34535','59072','80474','57372','13733',
                          '20404','20978','42322','49082','26567',
                          '13567','19649','99174','57243','77511',
                          '10007','42934','30067','82472','14473',
                          '83369','88315','17214','81921','40744',
                          '19461','21865','58333','72646','78826',
                          '21963','25387','57597','93065','45662',
                          '54823','95223','67691','35250','18660',
                          '18717','54953','35776','41030','30381',
                          '91971','22272','26765','47274','21003',
                          '32108','20094','54250','68300','81953',
                          '87156','52275','99601','56286','47689',
                          '85110','15361','10410','57602','94328',
                          '85813','94100','52002','13703','11090',
                          '19693','35915','56765','70874','60557',
                          '70155','45769','63540','38441','50059',
                          '88258','95661','87428','76123','36960',
                          '35118','48748','38026','57152','71545',
                          '77653','30540','22872','71159','60971',
                          '59988','94629','10476','24249','87924',
                          '67665','42819','86306','45190','25945',
                          '17347','38159','73563','20247','99969',
                          '56123','51001','98188','78219','54184',
                          '51690','69544','50771','29694','33969',
                          '38812','63197','81619','51792','87151',
                          '94908','46950','35489','26202','35736',
                          '16659','77577','70059','93795','61287',
                          '25932','14610','99513','44981','64848',
                          '80713','95539','76530','64057','40713',
                          '87266','56026','70646','90958','65100',
                          '41532','15559','98326','53750','85629',
                          '40940','78645','87368','47906','56487',
                          '72767','17808','16479','26761','11176',
                          '12958','47951','12407','62293','43473',
                          '76296','26143','63031','92424','70691',
                          '81687','65312','82898','26835','16710',
                          '96989','43161','47832','92737','69641',
                          '63347','86224','80653','64295','19362',
                          '70740','19625','12178','52413')
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


