
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
                          '92476','34121','45439','96030','24096','79628',
                          '96991','93980','92438','56854','84858',
                          '36347','52066','56256','11375','45484',
                          '30229','68766','80018','73337','88660',
                          '16231','56623','56525','25314','57908',
                          '43980','24734','18234','23327','87952',
                          '39376','61391','59786','79232','86106',
                          '73106','58846','31973','44974','59530',
                          '49581','99582','65818','13867','33814',
                          '27707','90621','81198','28901','87710',
                          '54532','41127','83133','56151','28440',
                          '17572','80130','41654','19608','12566',
                          '41261','69998','85519','45224','83698',
                          '16042','51584','45472','43403','50535',
                          '85647','81184','26354','12368','16829',
                          '80482','94645','35706','14446','54468',
                          '42535','58788','82105','33694','75104',
                          '82911','17892','78641','43235','40066',
                          '96046','88855','70850','88024','38211',
                          '66630','54769','28225','92407','74136',
                          '60218','49377','13890','37710','29994',
                          '89739','14898','41133','40304','27540',
                          '60996','26226','32972','83420','62963',
                          '36909','92703','74379','73818','92198',
                          '84415','50630','55742','69227','66911',
                          '85094','81444','43181','79775','52531',
                          '62925','53037','79519','89927','47245',
                          '52794','71935','96953','68172','30772',
                          '32860','35414','74647','48482','98332',
                          '51630','68538','92961','13128','15501',
                          '93604','26971','60698','78752','55995',
                          '73099','42109','69657','52745','12769',
                          '81759','36701','92603','26419','17214',
                          '17804','68230','82599','21807','27815',
                          '37996','83862','18733','17136','33545',
                          '94743','34091','77651','24713','17120',
                          '26262','61553','91549','36582','46741',
                          '93883','46173','67773','14393','74644',
                          '98933','45264','35497','90093','11273',
                          '95261','32617','38018','88612','68278',
                          '62828','53967','42813','11368','60112',
                          '86072','14786','35228','88735','33031',
                          '22136','61837','56952','69796','30497',
                          '74988','99373','18846','84455','77986',
                          '60787','68621','92345','25168','38444',
                          '57604','41840','29554','74797','50963',
                          '56776','54988','60454','74050','66136',
                          '28144','70927','15727','17838','69837',
                          '80238','32719','71183','84051','85980',
                          '85262','23021','26941','75216','12130',
                          '14250','59033','21312','81219','67292',
                          '25669','41460','62751','42783','95987',
                          '63075','19654','19929','80458','84903',
                          '55256','50596','40753','25108','49907',
                          '48966','74317','94415','22976','78342',
                          '90464','58792','56026','71693','31578',
                          '59473','73881','53980','54601','63425',
                          '43690','35296','16997','86385','81987',
                          '47208','59614','13712','81957','62813',
                          '28501','78723','97407','37521','99334',
                          '71399','76921','62954','34967','48171',
                          '22069','18550','10990','57914','87305',
                          '12898','77995','55205','90231','56554',
                          '88730','79143','26069','37404','13726',
                          '94627','25521','50020','24108','11389',
                          '69282','76570','10791','28204','25862',
                          '92208','45715','71487','74634','34811',
                          '15031','48721','11682','84485','17618',
                          '79292','10283','96390','70590','24643',
                          '89512','20034','34186','61878','75184',
                          '36521','15579','55351','74010','93066',
                          '30998','74998','92037','91353','38875',
                          '12131','90224','75499','28572','51193',
                          '23588','40658','28209','67931','22835',
                          '47752','97993','40307','13897','85955',
                          '50208','47076','26171','62295','25195',
                          '32092','82480','10102','79488','72072',
                          '15373','99420','81660','34087','29134',
                          '39596','20619','37804','14355','20998',
                          '34249','13279','71625','48076')
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


