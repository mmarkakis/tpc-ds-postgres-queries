
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
                          '76017','23635','70423','99540','23650','47204',
                          '89172','49869','80004','20642','35356',
                          '24713','34181','19939','45557','89071',
                          '55169','72617','49933','33331','86420',
                          '40030','74071','62169','15857','88578',
                          '73192','79931','45036','50998','51008',
                          '70515','88405','99492','54646','22166',
                          '24101','77369','32591','70871','80052',
                          '83307','36606','83980','32415','30626',
                          '15331','18965','11265','26987','46735',
                          '28692','60362','48078','27305','55050',
                          '96102','59320','29113','29381','86700',
                          '41141','43030','73952','65721','93948',
                          '43042','28689','92567','27450','13942',
                          '30813','45768','74850','12112','37713',
                          '84496','41506','78312','89354','54137',
                          '54854','23010','58209','76638','42929',
                          '77848','29818','46035','88016','16658',
                          '82114','77989','19383','69723','73219',
                          '94658','43374','76566','77746','42878',
                          '41294','92175','75585','33641','23657',
                          '96026','17559','48564','51567','95383',
                          '74794','46767','42129','69254','79496',
                          '85333','61966','25720','64656','91409',
                          '68701','54460','54944','61094','73628',
                          '32856','83112','17228','13320','15064',
                          '93520','47064','36458','67067','46215',
                          '41057','28654','47856','56834','22114',
                          '12184','42952','37408','49689','94740',
                          '81102','79499','85216','17195','55293',
                          '29543','35455','75950','85568','66556',
                          '88065','53501','45852','40370','73008',
                          '16753','36122','22320','84866','72411',
                          '38785','71670','48005','65212','40358',
                          '80907','99594','31394','79236','97809',
                          '75289','63121','54725','46670','99014',
                          '56256','52832','52894','65748','80654',
                          '39107','79253','71924','59907','59559',
                          '49675','38664','61593','90904','94517',
                          '10824','15421','99066','99713','35661',
                          '46557','63231','61521','78512','57245',
                          '87705','11835','32503','64336','53654',
                          '91011','75902','78009','83142','31015',
                          '12419','83459','51879','23735','81707',
                          '54297','83791','96599','91734','14563',
                          '22159','34808','42937','92232','17054',
                          '98358','12338','62743','91911','37413',
                          '65165','95140','45605','13505','54354',
                          '95929','88285','31172','42004','84522',
                          '43266','47494','91353','54820','47103',
                          '29530','65430','58041','18088','59440',
                          '74065','44007','61184','28358','90129',
                          '66268','56872','25859','70780','93420',
                          '65047','37006','89204','72597','76326',
                          '46109','55879','62381','39908','81978',
                          '98627','82413','14148','82150','20502',
                          '33516','91726','28578','73699','95870',
                          '71360','82616','47565','10036','41909',
                          '57688','29423','27098','44278','36433',
                          '51784','89323','54870','19782','61445',
                          '65359','87613','90139','53961','55947',
                          '98489','35743','85533','75284','36219',
                          '78520','23755','24898','74456','10579',
                          '38396','51860','56651','73373','41462',
                          '30759','16548','26345','30622','48489',
                          '69092','48210','88884','51532','40869',
                          '86684','37390','41408','31521','32822',
                          '32718','34073','57957','97876','50403',
                          '45626','77602','35104','71158','12181',
                          '36647','35941','11814','50289','36386',
                          '75194','76734','16121','40551','75810',
                          '38523','14659','25707','49299','71733',
                          '51891','88562','18472','41114','75632',
                          '31669','49126','82659','10731','94775',
                          '47127','56190','76397','53663','57127',
                          '72498','97219','99169','89564','20163',
                          '51925','76913','30932','99172','86462',
                          '36743','83012','69005','77502','69267',
                          '69622','66814','29764','15712','36083',
                          '24963','58289','15587','19031')
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

