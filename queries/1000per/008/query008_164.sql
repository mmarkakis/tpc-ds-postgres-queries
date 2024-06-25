
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
                          '37205','23549','43988','95696','47417','25544',
                          '75700','77153','17326','38702','69726',
                          '90070','16735','98783','75351','62698',
                          '74953','60087','17541','19506','87457',
                          '33482','51471','95015','74899','12264',
                          '92859','34949','35205','71053','92107',
                          '40195','73965','85213','89296','51400',
                          '45142','95924','41992','16209','71407',
                          '20451','79553','27658','48248','76448',
                          '92136','31091','31188','87011','71790',
                          '23652','44721','95555','20513','84724',
                          '97096','23285','62842','93275','44719',
                          '61275','87610','59650','43947','23518',
                          '40494','11800','95757','31279','36978',
                          '89274','70473','33845','87531','44614',
                          '36474','39457','33268','73679','37634',
                          '93973','77935','74358','62055','27645',
                          '34041','86837','45174','29544','71622',
                          '47180','68547','64669','10487','71355',
                          '15880','18509','28549','48365','19618',
                          '36638','36477','41531','94618','62072',
                          '77023','28153','52910','90532','64214',
                          '71968','11153','53613','42161','27235',
                          '82168','70996','39929','77485','43393',
                          '30767','26867','98167','55811','34988',
                          '61561','51992','41052','92220','87220',
                          '77367','47874','20651','88653','43010',
                          '47700','51833','67817','87307','70807',
                          '67873','77432','21925','22167','97536',
                          '68391','14653','18739','60109','16330',
                          '18431','19927','36134','40337','95357',
                          '56195','72262','64333','11276','97801',
                          '52716','80306','10161','99826','55994',
                          '47321','64783','42579','47875','86782',
                          '93352','32664','47708','14299','49988',
                          '54491','35659','15192','89761','64816',
                          '98489','44884','14399','65967','59227',
                          '55384','99030','35811','99542','25531',
                          '90768','86847','59297','53232','63857',
                          '45567','55676','31518','77381','67951',
                          '78590','15886','78639','32085','82615',
                          '76289','12882','40217','53766','31421',
                          '18467','72232','53520','15051','41084',
                          '47518','28277','69653','56357','59818',
                          '93480','83638','90476','77732','40905',
                          '56996','37690','39222','87471','70342',
                          '54100','62355','56415','73826','96825',
                          '48250','75020','79805','33776','21339',
                          '83354','38941','30016','70610','92227',
                          '98514','46226','45345','43726','28300',
                          '99663','54329','99982','32940','97664',
                          '81979','28579','30495','69638','56655',
                          '60588','73054','28119','88041','44046',
                          '38895','78810','38031','74684','93074',
                          '66520','57512','10438','24233','52898',
                          '26234','42738','21219','53709','22659',
                          '10209','74131','73599','80660','13631',
                          '89885','74710','56342','60296','16847',
                          '38966','58842','95781','29311','94300',
                          '57606','40300','60210','60609','16443',
                          '36810','15395','72012','35972','48675',
                          '95895','25167','18405','36753','89037',
                          '67286','84142','34998','52546','28331',
                          '23074','73794','28230','92918','61160',
                          '26392','46878','64709','93581','97525',
                          '56885','68860','33175','48256','95456',
                          '25266','33734','28482','21544','36129',
                          '98734','64962','48224','43596','65640',
                          '44132','56743','59129','10153','29721',
                          '20909','68679','41716','82727','32489',
                          '74476','47410','88687','45219','34550',
                          '20374','19613','65966','22486','87335',
                          '51303','92001','64532','75564','53741',
                          '52552','34337','13148','76506','55679',
                          '20823','41662','97115','54645','34329',
                          '31551','55277','23316','70673','91913',
                          '87297','83598','20120','24278','43880',
                          '90183','89191','40748','91747','33797',
                          '96794','77105','90322','78369','66862',
                          '83336','86509','17113','39660')
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

