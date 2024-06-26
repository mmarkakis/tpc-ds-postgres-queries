
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
                          '59644','66354','63347','23072','39911','27976',
                          '25006','49699','71624','36091','67947',
                          '76084','63169','60059','69617','99197',
                          '37455','98957','33661','31576','44059',
                          '68710','23659','58052','99345','55426',
                          '21839','23869','95328','88094','26978',
                          '77648','81632','78380','32763','76498',
                          '36157','85794','99962','99485','12213',
                          '88161','52633','66273','52278','96434',
                          '56761','43204','21764','88877','76270',
                          '58242','27178','32194','79647','90910',
                          '16154','98840','40050','86593','92093',
                          '62872','95211','22149','79297','22045',
                          '72616','34839','26908','52336','74846',
                          '29613','65534','40775','76065','25202',
                          '57944','71747','51057','35481','63619',
                          '10967','87798','87959','76584','68963',
                          '61553','67173','74727','65916','72737',
                          '43979','72209','92642','50715','87775',
                          '65830','11782','57975','45258','29433',
                          '32022','61202','48606','45218','90386',
                          '21691','93570','19356','48598','63496',
                          '26812','85441','91671','63980','84953',
                          '40987','12960','44361','16710','47337',
                          '38210','56563','91176','22891','93164',
                          '95740','40502','46658','60360','79836',
                          '64184','67403','29322','66369','52601',
                          '60102','97290','64295','26233','72117',
                          '92504','66270','42932','33787','94979',
                          '41957','51380','75786','11590','37160',
                          '21388','31868','10744','71001','96341',
                          '17783','78231','58631','64952','36679',
                          '64476','65721','76096','71120','23076',
                          '88233','90741','34564','75946','19805',
                          '95287','91019','35775','85294','31831',
                          '76894','12446','32134','68978','11398',
                          '91102','73003','37782','17316','21960',
                          '85328','93238','11338','56784','14972',
                          '32857','97069','41455','70019','19812',
                          '80229','13303','66808','74355','40495',
                          '98405','36440','95659','99067','70944',
                          '59949','33846','92663','56505','93478',
                          '88907','85640','49102','38690','67183',
                          '65596','17169','38104','52559','86548',
                          '73909','99076','56798','69742','14047',
                          '22481','16569','25706','89303','65731',
                          '57882','26083','10972','35720','79957',
                          '72376','77618','97281','73148','85138',
                          '54730','48001','85055','27903','40607',
                          '58414','14037','66355','51101','26875',
                          '50330','62913','84598','36826','10105',
                          '94157','93241','72609','29051','98239',
                          '64745','99680','31770','10699','66272',
                          '46211','64060','79567','95221','23379',
                          '87209','75442','67610','51342','28413',
                          '82639','76031','31915','48457','23483',
                          '12085','79227','86155','39545','18079',
                          '56460','16007','83864','18360','21867',
                          '42734','58517','32329','35735','15722',
                          '72328','54373','26302','23489','30325',
                          '72835','61699','69158','18642','55633',
                          '25887','27152','41570','71782','85612',
                          '35276','28838','21866','75084','51265',
                          '48433','21400','45200','15226','37463',
                          '21903','43940','97894','84503','12288',
                          '58811','18597','32686','30653','90968',
                          '58748','16571','48486','79154','98120',
                          '67313','86657','53123','41677','25812',
                          '24620','37854','41338','74945','23762',
                          '12426','81107','20146','13497','77041',
                          '40472','26379','89468','55706','78776',
                          '71892','28796','65474','51844','71967',
                          '29488','10963','40032','27452','97456',
                          '81830','78324','94953','57152','76081',
                          '96888','82356','57651','10071','17776',
                          '87087','51838','41493','63968','74503',
                          '17301','27593','26556','73555','58662',
                          '39093','59939','98416','16920','40271',
                          '54187','79053','35487','78092','64215',
                          '10865','34146','64632','81084')
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


