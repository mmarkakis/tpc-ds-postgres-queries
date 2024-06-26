
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
                          '39046','27721','23157','63504','84733','47246',
                          '49015','39434','80419','64844','39740',
                          '71662','45019','95282','94329','49514',
                          '50131','98126','57902','75592','44219',
                          '86377','65964','13769','88525','98745',
                          '61332','54496','79416','59736','34805',
                          '80700','19128','18927','62368','20787',
                          '50022','27470','76307','12458','43022',
                          '53804','73869','39196','84011','33961',
                          '19228','58192','71718','12031','22200',
                          '17527','13681','43465','46526','38275',
                          '58932','60546','15789','16652','65136',
                          '21390','43775','88324','49642','44271',
                          '77637','90936','99709','11319','15529',
                          '48613','53926','47977','59387','92330',
                          '89316','92600','67261','48593','39327',
                          '78786','18197','27068','49562','93885',
                          '65362','87260','57662','45742','89764',
                          '35981','21060','18362','24393','76243',
                          '35097','80267','67301','74575','39783',
                          '13903','82879','81399','10194','89571',
                          '90004','15364','75342','17448','20202',
                          '77867','97967','72208','39064','34213',
                          '44345','40321','27106','27315','24383',
                          '27686','97807','30614','20474','46282',
                          '71421','82618','32076','56211','45689',
                          '98784','68010','87707','40776','54904',
                          '41860','66223','56766','59492','94822',
                          '15066','11165','51390','27598','86857',
                          '96491','43976','85324','81724','56460',
                          '99525','31338','56969','58079','31184',
                          '54917','98267','96528','65802','30632',
                          '43958','25493','55102','69067','21360',
                          '44229','89750','64290','60148','86501',
                          '60896','86837','72346','18595','20249',
                          '11458','51355','37423','89135','93520',
                          '51595','12034','21624','67766','73775',
                          '76612','69176','63960','17676','67510',
                          '95946','91400','69706','68358','84573',
                          '48822','19361','85468','49031','75163',
                          '29292','76497','24348','37396','71341',
                          '64114','22207','73165','63400','90155',
                          '97097','32433','65414','53541','40866',
                          '88066','73320','12958','38532','76907',
                          '87496','30690','72391','10838','98877',
                          '63938','52340','80527','67384','95026',
                          '25901','69943','85881','69499','54185',
                          '95954','69077','32460','73809','75020',
                          '84683','96386','59002','31455','12081',
                          '55701','48502','27132','11240','92891',
                          '96503','47355','92558','96076','45936',
                          '76154','81152','85479','27355','63825',
                          '64515','86910','38142','79824','82864',
                          '97805','95227','32882','16981','98050',
                          '22029','75142','68744','57194','19083',
                          '10739','65393','72607','68450','93149',
                          '21507','61758','19836','36246','23524',
                          '84300','98618','77189','15637','40208',
                          '90687','28493','85109','20944','23735',
                          '61149','95631','91891','39244','91385',
                          '53369','52367','45026','82810','38045',
                          '87202','60210','73095','90764','42203',
                          '90287','72414','41202','26635','31888',
                          '39131','57443','24315','24684','79269',
                          '94667','54479','27079','48811','13591',
                          '39807','53535','80640','85988','38103',
                          '41455','30438','50627','73602','63380',
                          '72605','79114','66936','88754','46289',
                          '25900','89194','22346','79786','55546',
                          '38800','52279','61886','74115','12791',
                          '84802','17208','35448','87168','62971',
                          '59745','11127','34062','49858','41798',
                          '61500','45275','82070','11890','81522',
                          '53248','96037','14752','63271','60106',
                          '89591','56387','12381','16352','66736',
                          '95241','80211','91054','86966','32719',
                          '53510','62765','83088','17458','18196',
                          '81027','38493','63822','61160','77343',
                          '36356','28783','41498','44953','85632',
                          '83256','10063','69449','70854')
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


