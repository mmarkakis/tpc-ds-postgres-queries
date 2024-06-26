
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
                          '48950','31600','68819','73764','59985','72936',
                          '51991','77472','92260','21181','81647',
                          '93995','71283','71889','80430','17778',
                          '44551','59947','71138','30979','22942',
                          '81400','26089','74690','79248','99521',
                          '75131','16074','45373','65872','18680',
                          '78738','19633','13672','69524','53161',
                          '75731','40963','63921','33304','30186',
                          '32794','67848','29854','34200','70693',
                          '74257','45057','98910','74471','60951',
                          '94280','86825','87314','16482','72994',
                          '81685','41068','55909','79162','60352',
                          '89608','52499','98507','35605','50129',
                          '23066','26076','86542','20227','26112',
                          '91327','29135','70324','69934','88150',
                          '94279','33003','89098','91180','76748',
                          '87199','93457','32845','20791','93546',
                          '32017','74074','43014','80292','81329',
                          '70448','87321','90763','74567','49948',
                          '16974','44217','86675','87754','90919',
                          '28760','97681','87114','10459','78833',
                          '84359','23909','91787','84740','78665',
                          '84200','19533','45265','89490','92512',
                          '17086','13055','95920','51737','43475',
                          '73959','62033','93835','63777','86848',
                          '93586','17231','98963','52873','52471',
                          '98215','96025','56992','92827','29053',
                          '44431','72867','10496','63700','67429',
                          '47533','49254','15893','74462','73713',
                          '76312','25488','16599','51932','22776',
                          '71519','68512','34398','61703','56697',
                          '22459','19632','68153','19031','56218',
                          '77885','84110','96472','55349','39960',
                          '72004','63394','67182','58398','54386',
                          '28195','87370','10029','24166','41399',
                          '76650','11873','95808','21105','46406',
                          '11740','42705','51333','73266','65714',
                          '77259','84663','19555','59642','15112',
                          '38556','33393','63164','43383','89342',
                          '74794','39798','20831','51890','60135',
                          '14645','84476','36971','56420','39519',
                          '96626','35062','94125','83625','94795',
                          '84791','44575','57863','12227','42470',
                          '48897','40821','72420','96382','49410',
                          '88546','22450','95782','54291','29379',
                          '46739','82996','89714','21777','29105',
                          '57860','32888','70342','51324','49192',
                          '56179','85062','94208','67004','77553',
                          '95215','16137','21771','81206','36817',
                          '93327','15902','67550','93997','11539',
                          '76538','67719','99485','76927','53652',
                          '96152','41748','91476','45930','13810',
                          '41115','48848','11160','33302','26204',
                          '77938','78594','16337','70779','39651',
                          '68767','96047','39958','53320','50359',
                          '25131','29981','87878','97450','84616',
                          '61076','22421','91750','56399','62720',
                          '63436','13552','86798','24177','92900',
                          '60297','86237','41252','34323','34455',
                          '64058','17042','25690','92398','85625',
                          '16047','56735','91087','46517','66240',
                          '38651','10038','30714','45672','13601',
                          '23683','77200','87860','95151','36348',
                          '43219','29558','40030','68236','59766',
                          '75130','18043','69571','40794','89648',
                          '46427','44771','85987','37272','29168',
                          '59540','78625','37463','60553','12598',
                          '97543','47652','32500','13338','30506',
                          '36706','81708','41836','24897','55338',
                          '78563','36305','80012','55428','33695',
                          '18356','54095','64366','72443','64657',
                          '62078','27138','58023','16890','18595',
                          '99506','43566','51406','87965','42965',
                          '99446','72799','66499','29285','36716',
                          '48272','74650','23270','38983','13649',
                          '77883','19934','29836','79140','13946',
                          '29162','89530','30358','83169','67161',
                          '14143','27206','66578','34043','56264',
                          '12936','93985','95568','44637','37817',
                          '50348','87605','43773','44097')
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
  and d_qoy = 1 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


