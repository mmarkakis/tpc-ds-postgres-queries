
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
                          '60282','34596','20818','34202','91312','53525',
                          '47581','89855','39269','57094','81775',
                          '36343','97124','94977','62107','64638',
                          '29486','88876','73819','62900','45825',
                          '83894','23173','62567','60548','24375',
                          '95227','52640','66198','40676','52271',
                          '16397','64043','37702','13841','18606',
                          '92228','86171','51164','59157','37687',
                          '28170','36434','46875','97869','94336',
                          '99376','43286','20741','20256','26921',
                          '76836','47752','23412','30506','88591',
                          '75336','31822','30596','57292','63039',
                          '19566','52030','34342','62570','81960',
                          '25843','51012','94865','81222','69897',
                          '12613','11932','73501','36244','49904',
                          '66333','49420','38615','61878','13210',
                          '78911','55790','93780','79071','38695',
                          '85542','20628','26004','12387','45690',
                          '57809','77616','63926','99097','51522',
                          '47312','69932','42726','73611','60921',
                          '11972','98443','96347','72440','40379',
                          '56184','88398','78899','84798','93434',
                          '22899','40640','70344','12735','98273',
                          '59847','75187','87705','59352','92352',
                          '76762','44472','19538','86474','48944',
                          '17443','86921','22229','31694','38856',
                          '33600','26505','19468','53300','17784',
                          '78284','24969','36577','10975','85207',
                          '65504','48580','79281','59086','70626',
                          '76842','52260','57071','39906','71008',
                          '86444','45223','50545','20592','86180',
                          '12337','18853','11782','77118','18450',
                          '62111','36722','54937','59344','20342',
                          '58581','80534','13911','63382','61479',
                          '56292','29835','60896','94184','21505',
                          '86186','97333','24239','98903','26425',
                          '26965','13815','90997','88560','31412',
                          '12642','59846','21629','70272','44324',
                          '27361','99363','24745','18696','12856',
                          '81995','40861','29612','80329','70661',
                          '59699','12291','72615','86701','39320',
                          '64768','39407','59619','29174','32225',
                          '13918','11585','88519','34076','92688',
                          '13762','25135','99972','46375','77804',
                          '93319','72029','59737','92467','74673',
                          '23753','35932','34287','13864','10705',
                          '80162','20349','14661','28799','76285',
                          '77351','34055','79856','10997','79713',
                          '22614','62820','75626','77810','58049',
                          '44057','20593','88095','17793','81822',
                          '34540','35162','46496','22972','17090',
                          '25521','84640','97578','87769','19972',
                          '14748','17503','11183','81382','39941',
                          '20371','91239','49109','55514','53627',
                          '46039','33495','85756','84494','41631',
                          '94998','79496','49588','64704','71409',
                          '36809','34620','55427','77523','37282',
                          '19443','60041','36533','84601','54125',
                          '35250','92908','72789','66644','61217',
                          '77778','99809','89891','63903','78056',
                          '31149','87536','12893','49415','52660',
                          '10444','98029','52976','20465','49299',
                          '60522','40646','58385','97974','12715',
                          '81868','19461','16473','23308','38785',
                          '57307','25897','89971','95674','24109',
                          '39602','35738','69988','58697','36175',
                          '42597','91518','81772','39922','83183',
                          '53209','78831','57037','36382','88010',
                          '11707','34028','27724','31534','78702',
                          '93837','76303','60693','35593','22099',
                          '70201','44008','59976','81469','20683',
                          '28590','52600','68688','51854','24641',
                          '16752','12663','17256','59095','62670',
                          '60443','66855','15505','53602','43298',
                          '71177','97386','93402','27799','57716',
                          '23266','15621','17556','51373','43463',
                          '42384','71482','45013','42418','47403',
                          '90610','35257','21645','99277','79326',
                          '20910','85951','27279','25169','56731',
                          '72456','62895','43991','33984')
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


