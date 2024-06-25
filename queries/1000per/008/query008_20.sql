
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
                          '25479','79060','13026','50279','38614','50838',
                          '79964','95215','68493','33514','69736',
                          '48619','80133','31715','84869','94667',
                          '36231','43751','35350','72858','39889',
                          '39346','51877','72512','24136','12725',
                          '75530','43725','72074','80660','56836',
                          '18466','23567','37130','65984','68527',
                          '47866','12975','98294','73740','65123',
                          '47757','56242','53214','11334','37980',
                          '20682','67607','67446','24939','29368',
                          '79937','62479','25783','97415','68000',
                          '85746','38348','27974','25520','36219',
                          '44374','99775','54030','53369','28750',
                          '40491','94962','60014','96942','59093',
                          '13058','36919','21810','39073','53319',
                          '63857','43347','71500','40628','47667',
                          '47719','73498','22324','21680','20884',
                          '76084','77510','88526','42925','53781',
                          '98899','26154','20275','97999','95573',
                          '21390','46813','14458','18819','46488',
                          '20839','89886','74133','79815','58082',
                          '19937','31149','42065','49750','23871',
                          '90885','52818','94303','40018','14086',
                          '78088','59144','74044','22143','24235',
                          '15555','80384','68525','73708','23948',
                          '31292','79951','13970','30218','28912',
                          '17204','98174','45308','46714','62847',
                          '11561','58493','80584','45700','33046',
                          '72535','80926','90467','87810','15559',
                          '45046','63065','83826','76315','18156',
                          '72311','85223','84455','69664','71840',
                          '65559','38133','33936','14433','91997',
                          '80845','80397','29399','34042','86092',
                          '87198','68866','97576','79604','78228',
                          '87129','51895','30474','67405','65036',
                          '85363','37451','63597','41721','79484',
                          '11348','98059','63584','77567','53585',
                          '38257','77840','35895','27744','52110',
                          '25321','81807','52983','46079','18528',
                          '83027','20965','15224','54341','20037',
                          '34214','54963','52413','15078','40590',
                          '41788','63439','77605','76180','55901',
                          '89320','35255','93644','18120','33372',
                          '84881','77300','66680','29923','17815',
                          '43507','85051','43396','19381','98129',
                          '20466','91965','95045','65165','33611',
                          '75526','62621','37733','25424','53653',
                          '75709','63453','25719','39276','90430',
                          '48098','21864','41368','52185','94974',
                          '65046','93764','46750','72470','68379',
                          '96737','29422','12835','11628','15682',
                          '19948','83917','23430','74368','53545',
                          '82975','18570','39013','96076','43880',
                          '66360','63182','32848','27586','17814',
                          '84286','44491','22126','48953','45844',
                          '84936','68095','81314','62455','42900',
                          '95420','83040','87736','44011','48880',
                          '92537','15328','53804','64356','52240',
                          '79463','64811','85452','96404','92042',
                          '74037','27349','27525','66618','24076',
                          '79956','53410','71778','73968','12793',
                          '68781','34170','63296','78471','92012',
                          '22051','41044','50915','48547','73238',
                          '23246','15757','96165','88930','98351',
                          '93512','51898','29926','16301','41254',
                          '25995','15947','12110','57044','13069',
                          '72822','31045','69853','20861','31807',
                          '92888','68857','77770','83608','75083',
                          '16978','75393','15083','88191','64292',
                          '12572','46216','17602','79092','74340',
                          '18023','88527','42500','10583','55006',
                          '39323','12313','37361','38944','37691',
                          '54929','55918','42299','12873','58433',
                          '88665','20191','77392','92017','27124',
                          '51461','40668','27509','68052','98530',
                          '49259','15483','62096','93205','12354',
                          '89032','78477','66512','20292','23313',
                          '73429','92620','84654','91264','32764',
                          '95645','80798','51135','81499','68163',
                          '85703','13338','46722','60495')
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
  and d_qoy = 1 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

