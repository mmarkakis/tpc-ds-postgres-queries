
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
                          '87941','84649','68867','64782','46173','95962',
                          '34411','51862','32262','35845','25229',
                          '62899','18562','12171','17974','46937',
                          '67626','58533','50383','58685','71496',
                          '30829','80171','47444','48872','39192',
                          '77670','18856','18558','37686','30755',
                          '52831','99984','83109','90315','87385',
                          '38412','89439','51010','50346','35356',
                          '55444','82757','73325','58124','55369',
                          '38736','59000','11826','17241','88460',
                          '53330','45215','28977','93387','41435',
                          '93925','23341','79042','92857','31644',
                          '76797','86707','70501','93548','83675',
                          '84690','58098','41644','12420','55587',
                          '97199','34018','28322','66578','72892',
                          '10227','96036','51525','58277','37901',
                          '93011','13531','68800','85960','51986',
                          '12269','95923','97968','50687','32921',
                          '19713','50326','62186','35046','92449',
                          '64941','73776','21035','94537','96769',
                          '68845','72548','92482','93401','82386',
                          '71123','71408','98697','90618','18723',
                          '36174','35915','48675','82481','65880',
                          '26838','32243','72899','85584','78245',
                          '94673','34218','49526','72231','82786',
                          '99609','85312','48371','61303','64416',
                          '10306','92801','19813','95253','13323',
                          '42751','67522','72337','27621','28633',
                          '14488','84048','64522','86856','60028',
                          '49059','89091','28933','53210','55096',
                          '64882','91930','41941','56479','91840',
                          '99119','70870','72347','26405','15741',
                          '29751','47503','65326','18340','76519',
                          '78103','67742','40922','60431','92042',
                          '60534','53596','85936','77113','33951',
                          '69575','71746','22592','71575','31736',
                          '53847','42047','41051','28225','42348',
                          '77317','12903','44515','87743','69256',
                          '73369','64951','64215','15742','30398',
                          '64776','70705','20283','46179','74346',
                          '41202','16120','21059','25254','84953',
                          '85732','42973','86711','98874','62349',
                          '20746','36458','33751','56414','50011',
                          '43468','30318','21533','77207','22541',
                          '59144','74198','99315','49949','23192',
                          '39790','71349','19991','21064','36679',
                          '10671','80259','73193','40311','47274',
                          '39873','37291','29427','84960','69771',
                          '45379','75940','89033','25777','61521',
                          '58686','26117','19563','99154','53163',
                          '69939','65533','49335','59469','32204',
                          '29147','30361','48423','18319','19023',
                          '90062','50141','27569','48231','33622',
                          '45890','78153','45119','19123','41231',
                          '76089','76240','45526','32186','88631',
                          '26245','23688','54893','36190','90911',
                          '11658','45992','38657','55854','49556',
                          '53293','40205','24107','58441','59247',
                          '55124','60556','11372','68335','87898',
                          '82110','76712','53521','68368','77970',
                          '47917','88302','92561','67988','37326',
                          '94711','41719','31990','37124','15612',
                          '83553','74677','80619','55990','93497',
                          '44613','86558','77966','73433','55176',
                          '87401','35422','45876','81806','91467',
                          '91302','44400','82810','85139','40986',
                          '62415','37540','47052','69135','57647',
                          '72613','90826','87730','35359','92842',
                          '65816','36800','61792','46064','89023',
                          '40601','40800','69209','86272','55165',
                          '38105','88223','30810','37880','59820',
                          '98815','39016','32660','48891','91293',
                          '19250','83786','95485','30654','23447',
                          '57394','68762','27455','70510','63966',
                          '92554','12605','92416','50155','26727',
                          '36858','57896','37507','64153','99838',
                          '93267','90929','67274','78644','38629',
                          '10447','25625','88498','85630','31479',
                          '92101','89698','65541','79489','80667',
                          '66925','57223','84497','71671')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


