
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
                          '11975','43578','19664','91453','16921','66307',
                          '50374','60607','32451','38816','77228',
                          '25176','99806','21079','83310','33753',
                          '90280','64086','72286','41675','77348',
                          '74493','22831','85314','77904','87430',
                          '77956','48106','18101','41429','71149',
                          '77805','29637','85533','85547','77144',
                          '20687','77284','42301','43655','27361',
                          '63486','62866','69054','51383','56104',
                          '46393','15861','24183','67618','29089',
                          '82168','76015','95593','97257','70641',
                          '58760','95572','57261','21750','71330',
                          '39381','46192','64788','77698','49265',
                          '28676','62343','95807','39160','42310',
                          '14436','92802','46405','21150','87847',
                          '69088','21873','95401','71179','79687',
                          '74158','84876','25178','11914','58955',
                          '10823','53598','33130','23927','92279',
                          '99809','11955','82695','67352','77995',
                          '20155','18824','59168','23054','32872',
                          '46613','91592','64388','28302','79441',
                          '59449','74948','35945','47139','42871',
                          '22542','27372','85192','56271','11206',
                          '30018','38085','94969','71094','97168',
                          '51486','15733','58091','63268','10907',
                          '50469','99333','58138','34650','67472',
                          '27675','10484','63676','12213','61103',
                          '12922','97110','75929','62183','92145',
                          '93517','72001','17983','97860','63818',
                          '11041','73286','93151','37937','90256',
                          '79111','45123','87462','88223','29698',
                          '79341','57405','84169','52862','36858',
                          '99871','28168','19473','28796','30544',
                          '65163','81734','84790','28404','27241',
                          '94359','67947','55833','36524','10793',
                          '13382','26513','21818','38866','35076',
                          '14989','37228','30712','29244','68868',
                          '46344','99020','30901','76135','10169',
                          '70705','81530','98096','46697','23090',
                          '39966','58615','49075','76035','39065',
                          '46028','42710','50265','16153','98836',
                          '81380','53031','97080','94593','38842',
                          '80411','98399','95563','71100','90228',
                          '79920','53140','92610','16850','10089',
                          '69135','90591','20984','29997','37056',
                          '32423','37250','61970','21201','60668',
                          '21423','52012','93507','58931','72106',
                          '41525','61026','15326','43433','95345',
                          '94975','48091','22576','85972','96601',
                          '90309','39624','13961','31523','86344',
                          '45575','72297','23686','57414','38739',
                          '66496','26509','23581','38672','76468',
                          '43090','76481','39416','73636','68385',
                          '46527','84534','20283','16884','24117',
                          '42584','12015','24837','13699','20745',
                          '26842','84717','64938','38377','41380',
                          '15206','38772','85847','77056','36366',
                          '43592','67944','82991','77352','43368',
                          '61206','59476','82585','64465','36832',
                          '15933','78144','49529','10477','37919',
                          '32715','48611','39232','49598','60539',
                          '65003','25240','18974','37310','31171',
                          '95486','68116','17521','43605','75273',
                          '27326','52986','18378','73196','14649',
                          '85098','68429','86694','80865','34342',
                          '80408','34730','33622','25873','38942',
                          '24419','38331','40855','75172','24489',
                          '72813','37177','78546','30299','97921',
                          '31702','83743','76328','62262','94949',
                          '32103','22871','13226','37329','59252',
                          '13086','66481','72395','90362','26650',
                          '76797','39148','96800','41534','67050',
                          '35765','69824','27887','28150','12996',
                          '64590','85040','91470','35216','83460',
                          '63183','14355','98541','89452','32550',
                          '25601','58643','37666','78632','42044',
                          '20979','76919','58069','21886','77690',
                          '30175','98765','81864','71158','90426',
                          '80692','82751','17912','68048','86572',
                          '24536','81605','44817','17104')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

