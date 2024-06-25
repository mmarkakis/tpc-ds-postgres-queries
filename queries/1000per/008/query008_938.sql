
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
                          '53192','51308','39557','26831','40154','14263',
                          '99868','85903','14111','32354','32055',
                          '88087','47394','53931','17609','47092',
                          '98240','59836','57176','75816','55098',
                          '89698','11308','46919','83364','52815',
                          '25064','83274','83445','15283','71198',
                          '24375','99492','13305','89293','81648',
                          '68430','15285','28899','60844','59915',
                          '99080','49654','77411','61424','64631',
                          '33542','67857','81007','90705','65879',
                          '96286','49994','99127','60359','76105',
                          '65122','76641','53054','10710','44199',
                          '41417','68464','67338','35292','53760',
                          '35158','40895','28477','61989','43316',
                          '93811','56729','23951','34867','81893',
                          '44786','57273','82188','68206','62211',
                          '47432','33094','42390','62092','13189',
                          '79225','10787','42090','23486','17803',
                          '86211','32189','20924','46735','32871',
                          '26490','60248','96364','34795','28914',
                          '35003','42582','89180','89396','39441',
                          '62038','91377','28886','69472','39121',
                          '47381','99758','64504','75052','39147',
                          '54060','95007','61728','41806','47742',
                          '66909','34493','48810','70815','59890',
                          '15058','94058','44317','63564','13033',
                          '40686','41394','33079','19960','63246',
                          '25344','58104','11120','10449','21867',
                          '96456','40553','51655','39613','71724',
                          '16386','47096','64805','27799','11242',
                          '48464','39908','43438','90429','86620',
                          '66502','89578','92594','52561','84475',
                          '27609','77392','64416','56037','47225',
                          '21612','15530','21961','41856','89010',
                          '87655','63543','55526','76031','43464',
                          '30154','57316','61663','44515','32604',
                          '73681','38725','32983','34437','46687',
                          '70626','93258','85574','51670','60080',
                          '96432','16440','37343','45401','57398',
                          '60721','53971','13768','47107','94485',
                          '12300','65960','22974','23206','94584',
                          '25549','14769','32722','70474','23082',
                          '97315','87431','24704','81296','53157',
                          '39058','41733','98802','64948','91336',
                          '87838','76560','28095','30302','69988',
                          '52087','23234','35152','23099','46614',
                          '59537','99429','67908','11753','54361',
                          '89683','64294','48823','53217','86376',
                          '99619','19392','24710','27321','49163',
                          '74671','58168','72298','24934','27899',
                          '37582','66951','11415','78785','54171',
                          '99139','18549','43202','50453','17223',
                          '62808','69605','33703','96059','45144',
                          '19897','76606','91938','21186','54936',
                          '53893','62301','57008','14483','28074',
                          '33032','52356','32149','33502','42782',
                          '55632','74955','28125','55217','39671',
                          '37696','31727','39688','42607','17948',
                          '55288','89737','78050','50044','45496',
                          '81862','78516','97287','71092','40196',
                          '42765','62263','56038','85863','57894',
                          '53341','31706','31680','34380','30440',
                          '83196','19478','37192','98046','74788',
                          '81074','92966','61917','70594','72424',
                          '93180','99876','67833','19753','21577',
                          '43385','75770','31099','53973','43270',
                          '43563','58263','30811','67688','84871',
                          '65841','28355','90405','94779','54664',
                          '65500','42829','40074','46366','37475',
                          '25878','50527','36175','46168','78401',
                          '33646','49444','50659','16768','15749',
                          '76370','57952','20427','33507','87757',
                          '43153','29882','37977','99284','14217',
                          '67383','68172','26025','71477','31994',
                          '47592','23240','76519','99308','91612',
                          '51407','13549','46708','92294','88190',
                          '89365','17226','71300','27951','89110',
                          '50434','73139','79750','78205','58549',
                          '50063','19736','53768','55207','75313',
                          '56902','19094','73906','68909')
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


