
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
                          '63247','96215','52578','33426','28988','26589',
                          '36780','94139','94398','91880','66437',
                          '34224','54748','11895','35465','83112',
                          '96925','66720','76952','77472','43593',
                          '43830','81711','81380','69607','58335',
                          '67239','67121','32047','83631','71360',
                          '23831','82083','28254','96296','16767',
                          '36171','35446','62362','43102','69681',
                          '43344','80410','77133','31749','78973',
                          '89787','97683','18730','23402','64434',
                          '91652','44599','89379','43199','23616',
                          '13374','39796','89438','67737','10212',
                          '72655','57981','38847','45078','33887',
                          '97497','12337','68208','56706','21182',
                          '25214','43689','39710','32848','82264',
                          '25259','55081','47718','32172','52961',
                          '59046','50154','42638','64490','43057',
                          '16104','67654','94803','10320','62452',
                          '18459','26976','36438','39882','84577',
                          '21045','99041','15466','79749','54169',
                          '51606','63641','24074','68669','87692',
                          '86964','65196','71937','16788','46049',
                          '35407','90202','71021','58728','82636',
                          '88840','42237','73547','35475','41182',
                          '87078','12175','35815','46246','99365',
                          '76661','62188','50654','41902','87836',
                          '40257','60388','42280','10143','74668',
                          '53171','35187','11937','15221','27445',
                          '30420','45625','88739','70689','80872',
                          '38635','30604','79598','72877','79724',
                          '91422','55851','33590','12872','19240',
                          '89334','20485','77396','74467','35196',
                          '43225','64594','79499','66213','18601',
                          '30457','86405','33936','17169','24383',
                          '82654','15056','29021','39725','97435',
                          '40222','44354','89974','46843','96868',
                          '84195','23752','32966','40909','26824',
                          '98116','31955','40673','30921','14844',
                          '49904','93279','45919','34686','96087',
                          '65289','17992','92875','44442','83201',
                          '69023','37797','80405','34263','43924',
                          '40596','65398','74395','88560','48502',
                          '39590','51601','15854','38381','39017',
                          '94569','96046','30237','18694','96616',
                          '12672','70654','99934','71990','22494',
                          '46821','19921','87571','83158','39333',
                          '38787','17969','61101','25556','83313',
                          '31868','91643','14292','36952','45261',
                          '74900','29998','91818','48022','94127',
                          '43699','48952','87281','40606','45995',
                          '96592','25334','34155','18041','60360',
                          '44331','85664','95374','48949','52561',
                          '16649','78250','47377','68828','54076',
                          '96486','69227','96085','84468','57423',
                          '62189','51770','77274','60176','48601',
                          '51654','24871','40250','20773','37000',
                          '72651','19994','60065','72731','18818',
                          '98172','37726','38736','73767','84445',
                          '79747','98392','27517','76330','28341',
                          '95314','21022','52053','91590','74893',
                          '56216','72799','40829','71494','37071',
                          '15165','42620','75332','50393','36353',
                          '97824','14845','70600','49138','85693',
                          '26293','63077','43430','22318','70093',
                          '14185','18793','11197','62561','79792',
                          '28738','51750','29861','51957','35682',
                          '14423','12866','72601','77252','26795',
                          '12320','29225','34066','65295','99040',
                          '43912','62356','28172','69324','52671',
                          '47760','44723','59832','36513','98145',
                          '32592','63332','45650','12635','32773',
                          '16211','85631','15646','63076','46111',
                          '80561','75631','30468','66271','38357',
                          '83088','33666','44811','91629','27092',
                          '13792','53270','48315','53788','67604',
                          '72937','98048','26214','90494','31056',
                          '24348','49092','20286','84204','82314',
                          '67806','46688','88986','77702','67472',
                          '70914','19711','99833','29662','51106',
                          '58269','34412','35033','65757')
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
  and d_qoy = 2 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


