
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
                          '80256','89001','15479','26879','21275','97450',
                          '85342','19041','87547','69376','81644',
                          '60708','35604','94544','13617','63084',
                          '28844','30783','90603','85125','53115',
                          '17244','58040','21705','42946','95109',
                          '23849','94214','17011','48634','86684',
                          '82426','67444','72430','92488','36506',
                          '74352','54925','25778','52207','13204',
                          '72878','44274','81133','29776','27768',
                          '95251','50297','70068','33121','59471',
                          '48115','86340','71760','48850','48840',
                          '16047','25077','65565','87958','83888',
                          '71799','90787','76163','51813','12766',
                          '16281','31697','52538','41857','84301',
                          '47339','27647','28652','20995','32350',
                          '25478','69441','46245','24010','66025',
                          '24727','23846','74620','16304','31039',
                          '28216','55706','44552','53229','53677',
                          '45482','59913','34743','67042','35007',
                          '76236','18890','91269','36238','49474',
                          '70732','90724','72869','65381','70378',
                          '10797','83101','96366','99295','42752',
                          '60186','44137','59216','18881','47661',
                          '42214','89282','67740','30637','99058',
                          '45283','84859','50218','17324','19591',
                          '40039','54115','85655','24020','19971',
                          '97295','61489','75870','50022','23799',
                          '28743','74548','83415','95547','42848',
                          '17072','16019','95820','52870','17179',
                          '52818','72864','53822','79532','33405',
                          '57902','92843','54097','38198','63955',
                          '52496','88449','60662','66178','26898',
                          '25532','58168','50160','55142','50812',
                          '43198','67389','96728','14251','38358',
                          '22467','31867','12863','10816','94502',
                          '21060','83295','85886','28907','10910',
                          '70682','72538','63317','56149','65451',
                          '19119','33665','73821','67566','92891',
                          '89894','57096','56012','12226','44941',
                          '62709','72593','34802','95091','55250',
                          '27514','61826','68761','89998','26562',
                          '61238','34090','69260','84358','19084',
                          '39350','65633','51889','98576','93938',
                          '56013','54008','89665','60286','17478',
                          '88530','17453','65879','77200','64005',
                          '51816','54641','81808','23260','78713',
                          '15249','55918','50077','33388','95179',
                          '64602','75856','38476','80557','61386',
                          '26205','11080','99432','38018','70585',
                          '20038','91868','68143','14205','57419',
                          '39625','98115','86706','34138','10068',
                          '71840','54724','75242','81303','91497',
                          '42384','27892','43873','36145','51997',
                          '49757','43888','81423','53525','19701',
                          '69575','75161','37152','91130','97925',
                          '99359','29136','94697','26050','95016',
                          '80669','89981','62478','34262','47253',
                          '41250','14672','25305','51187','78327',
                          '24682','74647','36787','31796','70789',
                          '50064','82801','13223','87916','72813',
                          '77938','85615','37610','33333','92236',
                          '42141','86987','54478','68360','91989',
                          '35486','38757','62350','83111','63136',
                          '88299','43220','74607','54447','17382',
                          '40309','61340','18254','68020','72945',
                          '99869','81521','66967','81062','12459',
                          '49626','34815','94867','51605','52535',
                          '41684','60768','97122','36866','86653',
                          '61964','30402','50853','64130','60525',
                          '64135','55560','51169','61129','52926',
                          '54293','57206','36123','79089','59452',
                          '65886','71931','24680','13271','66437',
                          '51456','75170','62421','34081','35740',
                          '42477','87014','19391','13935','15657',
                          '34323','81645','45581','49153','87075',
                          '82233','17764','40168','76223','81728',
                          '55639','13991','76655','35939','97564',
                          '50914','67201','19004','15292','35420',
                          '90909','26469','83211','38556','53836',
                          '71568','15062','75205','92988')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


