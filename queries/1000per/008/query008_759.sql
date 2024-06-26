
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
                          '77763','81115','51598','16217','61189','72357',
                          '22854','49348','23948','76617','63768',
                          '10542','71710','22504','46237','25427',
                          '18790','51274','54623','58514','34490',
                          '92490','81027','66818','70804','36257',
                          '77857','58821','52663','16700','14395',
                          '53890','34594','43423','49616','33350',
                          '51560','49262','43036','13316','74993',
                          '69054','69967','93112','51772','97510',
                          '15430','89342','67933','19059','36250',
                          '87676','33177','76662','79143','68017',
                          '69590','33274','49086','65877','83043',
                          '57199','43557','54377','99625','64792',
                          '60950','62215','33336','31354','70117',
                          '38953','36617','93733','49864','48894',
                          '11537','49353','79726','10913','58015',
                          '17808','89089','72092','63627','56974',
                          '69042','68383','69176','74377','74599',
                          '17083','15397','41231','28433','28615',
                          '92997','83524','44807','34521','27450',
                          '36677','16647','82388','22004','41803',
                          '25447','85826','26880','32300','21500',
                          '33774','18440','47901','49951','47325',
                          '41783','31196','47577','89699','69798',
                          '49058','24602','61337','40678','15166',
                          '16534','90079','67691','12372','41964',
                          '27423','44508','73141','99646','89941',
                          '71172','16504','81501','94679','57121',
                          '63964','41953','78695','66729','28054',
                          '45739','94819','18348','79241','80444',
                          '14592','93961','86703','55653','51166',
                          '57484','50327','45231','46953','55757',
                          '91716','32790','41196','65231','42607',
                          '81799','91407','13583','78237','16558',
                          '33496','94991','13010','76079','47830',
                          '45567','76053','64436','20687','43118',
                          '99065','69765','56047','29970','53106',
                          '79245','84099','91122','69687','47297',
                          '72755','49917','47706','36663','60824',
                          '93084','80468','91471','49087','91171',
                          '76265','56423','73170','80986','36283',
                          '72042','70074','89359','70054','61976',
                          '90058','81180','27225','26384','81581',
                          '61239','39216','58679','61569','87309',
                          '88288','28371','22751','58787','56806',
                          '44097','21711','91419','56298','16031',
                          '50039','14593','51424','64244','41624',
                          '59328','13345','11108','17547','58623',
                          '62532','37125','68861','23290','23053',
                          '42270','42118','10715','32824','42202',
                          '74646','30082','37914','52476','52674',
                          '72077','10324','53881','77940','10597',
                          '77386','98687','56866','78675','82526',
                          '11828','55668','84549','27168','89966',
                          '77756','43561','24323','41504','19211',
                          '28630','95193','59795','59889','61912',
                          '76212','63018','75231','67735','52859',
                          '16378','74811','56011','84927','45606',
                          '57772','20902','46309','97177','12878',
                          '83292','42715','71640','55745','73991',
                          '77893','81679','55683','27407','75709',
                          '95528','82892','64318','10843','91149',
                          '81417','97174','11523','65045','70106',
                          '59454','32924','53207','42527','82623',
                          '34017','87625','61134','13555','48071',
                          '69435','78231','95009','92482','35401',
                          '68258','96594','69767','44123','13035',
                          '37038','29685','93113','23990','91612',
                          '35450','67124','71482','53984','51798',
                          '76470','25927','11302','97504','18422',
                          '70834','73626','94957','18542','54436',
                          '72113','93021','44879','98181','86337',
                          '13468','84409','37504','36570','93500',
                          '54283','83653','74741','77332','43656',
                          '87231','17299','73977','30816','10733',
                          '66908','24375','18702','61316','12633',
                          '95481','50674','60223','42855','50710',
                          '83202','66480','32531','82696','38856',
                          '27131','30852','41035','38767','48189',
                          '68663','99840','79231','94312')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


