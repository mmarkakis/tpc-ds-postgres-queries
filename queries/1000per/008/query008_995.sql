
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
                          '87221','39883','48351','25446','38699','89244',
                          '77526','92298','82844','79028','35191',
                          '25849','42416','51183','19933','55372',
                          '33368','78021','84262','82115','80361',
                          '43079','89550','46211','20520','24027',
                          '33046','66064','51236','70225','12340',
                          '19339','46380','46041','58480','19932',
                          '93742','94100','14026','72261','26585',
                          '34168','35152','30615','56666','32499',
                          '10149','81118','19546','91724','84797',
                          '65929','15174','73572','69700','52176',
                          '15385','83249','18153','81299','24975',
                          '85322','20662','96293','28268','38617',
                          '92368','43293','29602','15159','56991',
                          '27932','38723','97096','13662','56322',
                          '38932','27441','39660','46049','53919',
                          '77283','77575','35151','65260','69523',
                          '63632','62155','62725','82271','57126',
                          '75832','59653','33712','47234','77874',
                          '64381','67319','60945','74448','94420',
                          '14459','18610','41461','94717','92418',
                          '79857','39940','39286','80488','96939',
                          '99264','36993','92561','58043','69053',
                          '60181','82696','38734','39603','82235',
                          '96527','96663','72881','69748','79044',
                          '14048','94730','41469','98368','74438',
                          '92575','34955','28184','44595','50554',
                          '25806','61216','73961','84156','80407',
                          '76287','50670','38570','51151','89066',
                          '24076','57752','80111','75612','51997',
                          '79180','49816','90057','80844','76886',
                          '27058','68247','29945','60815','27105',
                          '32978','41943','86059','45927','57343',
                          '70975','97397','57831','17811','77436',
                          '60090','88240','82222','92602','40567',
                          '72424','89551','94276','36280','35137',
                          '21671','59203','67719','64300','86802',
                          '73850','74093','50295','88080','86362',
                          '26927','91775','73697','56443','23425',
                          '95440','77694','89720','48394','56676',
                          '56159','31998','11984','23027','52843',
                          '44743','39807','41426','26907','25882',
                          '77156','70673','62639','95958','19567',
                          '30085','33267','29973','22247','41084',
                          '18387','92682','63636','10980','34952',
                          '89999','59265','54784','55925','28137',
                          '22735','64858','25753','14448','33740',
                          '27054','95903','50078','53129','16108',
                          '82641','40677','26909','33093','51252',
                          '65884','66429','79567','60459','51678',
                          '48995','49232','28063','61075','97435',
                          '59174','95651','81983','72926','82874',
                          '20267','37900','84099','56473','95676',
                          '31992','99618','27541','47002','35206',
                          '80028','44433','93799','80215','66915',
                          '19207','97393','83386','31993','78437',
                          '69328','87678','51688','56875','36141',
                          '82929','35571','24472','95636','78083',
                          '75750','34252','53883','96779','23634',
                          '24213','82429','35753','73437','48685',
                          '87166','76995','17576','43374','86693',
                          '52285','83931','83159','90616','46028',
                          '38080','24737','19984','31646','50427',
                          '62152','74382','37759','25109','88792',
                          '59369','14213','95411','38968','31945',
                          '88283','45543','27502','61877','34670',
                          '73423','63604','14358','77496','12718',
                          '95164','49097','73590','31930','27280',
                          '67928','43114','65983','11400','74375',
                          '61996','52492','59935','95177','83538',
                          '85116','47116','90613','26473','74035',
                          '12708','47481','45167','71382','31119',
                          '42137','91797','74385','50722','66993',
                          '66974','12180','52946','93383','86631',
                          '65169','39568','53244','95478','66021',
                          '60666','83997','55323','56871','82772',
                          '94793','80866','82431','97516','28920',
                          '15467','83312','93929','44007','49912',
                          '64235','36410','60975','78117','54924',
                          '43191','79823','53105','12662')
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


