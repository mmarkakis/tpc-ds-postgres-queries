
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
                          '72551','39954','54704','41445','45149','56416',
                          '15134','35733','19688','35991','90613',
                          '95142','79447','57118','77234','67128',
                          '13964','23385','26449','47805','43610',
                          '15901','96815','63896','81442','64684',
                          '71041','75288','57596','78229','69150',
                          '91934','48099','26145','62422','86256',
                          '37109','88540','91987','38033','90011',
                          '42874','71173','94782','64774','60623',
                          '54338','88090','14060','58269','93620',
                          '34813','88070','50424','44903','10126',
                          '19686','80571','54311','15206','79360',
                          '26359','70304','33273','57336','71791',
                          '77080','90841','46052','36465','81892',
                          '74879','16019','14031','40024','89151',
                          '99413','39139','79336','79934','64160',
                          '77031','21815','25857','13170','66071',
                          '55292','83446','28939','58385','32475',
                          '91772','51425','14755','18463','90003',
                          '19834','76133','33471','74598','97310',
                          '68815','41763','11174','18698','90537',
                          '74801','32476','97844','84380','24375',
                          '76262','27767','94584','13190','36898',
                          '15717','12498','31557','59840','51475',
                          '38866','97676','81619','64001','52525',
                          '23039','90013','22342','49903','32969',
                          '50590','96533','52776','88904','82078',
                          '55906','88483','25436','42701','25278',
                          '52125','17068','92522','57671','49019',
                          '54697','20721','79075','66176','40051',
                          '87942','74439','21159','93808','14773',
                          '25938','31586','72260','27565','45090',
                          '40861','57492','60118','54903','70595',
                          '92739','47328','81679','79345','96488',
                          '63353','96479','52921','22236','39485',
                          '42552','10888','92594','52627','29948',
                          '40005','78557','60703','64485','32242',
                          '76295','31572','49239','45507','80873',
                          '12368','57566','24455','54745','69115',
                          '25470','37317','26470','24165','91466',
                          '52540','84849','73884','56185','37170',
                          '45693','77901','68212','34497','69191',
                          '69851','73928','83996','14689','67537',
                          '63722','68597','90102','35727','76392',
                          '36496','11664','52347','46527','93142',
                          '74087','31285','43182','66806','29929',
                          '13431','43614','87083','57630','78897',
                          '73814','79593','83534','44041','45663',
                          '21045','55545','57667','97292','48695',
                          '99157','34236','12213','15399','15838',
                          '10536','74009','35104','34065','57623',
                          '90947','91857','25193','47782','37337',
                          '98713','30894','47362','71162','88790',
                          '88764','27218','82230','12951','13640',
                          '23962','65117','81086','60302','77899',
                          '61262','26480','89654','57841','28271',
                          '54520','20847','54686','27718','14074',
                          '69486','29076','59038','93060','24140',
                          '47323','98392','24477','78974','35794',
                          '22954','32422','89018','47792','23325',
                          '37545','18087','96756','16783','82130',
                          '31458','81885','33687','24175','76240',
                          '94452','84368','18353','32854','57277',
                          '95203','18648','65443','34280','17982',
                          '47197','84605','31287','59386','86831',
                          '84472','91765','47374','12804','25276',
                          '27625','12051','42051','52183','20709',
                          '52871','46547','67368','97144','88947',
                          '82889','82646','62222','74973','76897',
                          '86240','59334','42884','72368','70865',
                          '91509','43886','71828','96928','83237',
                          '96292','49996','67428','55612','62275',
                          '95333','28390','77773','71020','31095',
                          '61465','33286','28126','75388','86978',
                          '77941','55237','12695','74934','59669',
                          '24575','74568','26647','96412','56480',
                          '49483','49707','68978','27175','49115',
                          '83594','84465','78620','24197','21970',
                          '68105','27662','45494','14969','78241',
                          '90778','55046','62333','13657')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


