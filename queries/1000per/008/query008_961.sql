
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
                          '74229','63132','27460','57587','89822','62045',
                          '19202','20573','72046','77790','41172',
                          '18631','52984','63012','54670','21332',
                          '49300','67902','57470','26754','39384',
                          '99114','75215','79923','83292','34834',
                          '89438','72824','18697','54403','37696',
                          '49332','10495','75266','27451','46125',
                          '64409','46229','38967','81670','54604',
                          '46914','99583','94554','57394','33777',
                          '77929','83817','23783','63476','30212',
                          '61051','77459','82932','67045','97501',
                          '29804','73510','19192','56459','37578',
                          '30246','20532','33000','36088','73572',
                          '53688','20647','49002','29576','30204',
                          '17250','34152','52664','64629','93467',
                          '37116','63828','37054','13429','33103',
                          '58499','58446','48610','98960','38512',
                          '51747','50218','32477','45104','51343',
                          '89336','54922','46672','97583','61702',
                          '20269','82543','57288','80292','61392',
                          '40529','71925','52420','88542','50508',
                          '19330','44710','96152','71537','51336',
                          '20657','22129','79411','43512','37279',
                          '41383','48967','56480','15733','68694',
                          '26699','37940','30816','19868','26533',
                          '43844','59626','11414','55870','21684',
                          '59006','68566','66980','90698','26872',
                          '23107','22933','98654','53352','87277',
                          '45287','46881','70835','44056','97167',
                          '30096','60018','80294','56427','39607',
                          '72396','52701','52278','21557','20908',
                          '52817','82950','90947','41812','40138',
                          '57975','69050','71232','33375','16143',
                          '13863','60988','80900','78952','48905',
                          '84168','53484','56759','88475','13888',
                          '95703','40715','74393','25755','44724',
                          '20829','69215','35347','72767','36277',
                          '99808','68933','28958','37457','78454',
                          '80340','34226','80320','85283','24605',
                          '83417','55289','48542','81187','13089',
                          '87106','42093','82755','46287','30850',
                          '15613','26908','46066','99088','58918',
                          '20907','94584','84667','86100','71123',
                          '98940','49748','71214','19023','46510',
                          '86441','81657','13392','44916','37612',
                          '20738','19873','90187','73608','91193',
                          '21951','53050','58508','18632','29017',
                          '66025','88123','13818','16965','65507',
                          '99711','11731','97030','60560','93371',
                          '26194','34884','21113','53555','21415',
                          '77095','25999','21587','11343','88226',
                          '67050','17671','91919','32307','48092',
                          '58772','90858','70418','25347','93848',
                          '10592','41377','29567','52258','45180',
                          '45206','67245','24576','83312','73892',
                          '23439','34470','81736','80308','42881',
                          '57515','56079','89221','68181','23058',
                          '10825','21750','58245','10520','47117',
                          '16250','28899','29092','80557','19905',
                          '84413','98110','37061','13206','80907',
                          '22876','36919','56368','58986','21625',
                          '47456','60759','24517','68360','38779',
                          '36792','22451','74578','61792','27715',
                          '38144','39868','92351','29559','21892',
                          '77849','11173','38919','25923','36764',
                          '62181','23375','76556','84535','66620',
                          '69281','97046','33950','34507','18198',
                          '18093','82855','11861','66391','54500',
                          '11737','53015','76433','77636','60183',
                          '17940','47164','74118','40086','33303',
                          '28316','28911','19156','36854','33645',
                          '17096','37682','49350','99714','25992',
                          '89990','46046','42025','40584','83276',
                          '22615','46515','39170','64803','20923',
                          '98543','80638','44839','15106','88536',
                          '98190','85729','88939','80195','16778',
                          '75692','89613','47797','71347','46296',
                          '57125','20927','32836','11205','10115',
                          '60767','28137','23135','53904','61317',
                          '19891','20202','39214','42463')
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


