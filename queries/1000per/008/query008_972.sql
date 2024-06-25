
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
                          '96568','39996','93846','29556','15185','32399',
                          '95781','56235','95240','97021','52687',
                          '17022','78417','82970','29095','94327',
                          '38010','40981','48781','90247','31447',
                          '18055','98120','63321','86499','90886',
                          '36640','11286','65987','22934','10280',
                          '68912','48153','78592','70571','96605',
                          '92886','32051','15519','90167','43446',
                          '11720','61561','29603','21880','71093',
                          '78848','17181','49414','99893','21122',
                          '78295','81433','47916','16045','82846',
                          '27460','35872','67042','78042','97173',
                          '71458','10708','29335','93267','14598',
                          '53024','48859','78963','96352','24557',
                          '86204','72361','22749','72845','72720',
                          '32917','68380','87321','93921','66191',
                          '97827','51344','92569','91856','98816',
                          '54351','67995','82541','60992','47992',
                          '77529','83812','26397','87893','42739',
                          '23164','27000','57975','97391','79223',
                          '44173','85632','11947','23831','59831',
                          '95371','68862','68695','78061','41065',
                          '10136','66062','40816','98753','89598',
                          '82583','52446','75484','82556','10322',
                          '29521','18603','98399','85329','58312',
                          '15213','95421','99556','69272','21775',
                          '33400','65378','37619','95750','52261',
                          '42440','95960','38335','39143','77639',
                          '31799','59736','44547','50297','79263',
                          '95639','32222','22280','57429','64381',
                          '60584','14748','70118','70718','25170',
                          '72558','34209','97291','40739','19085',
                          '98584','91851','42513','16880','18583',
                          '90736','41696','73992','92586','96519',
                          '68898','44167','25047','81299','46823',
                          '84519','60899','69149','59399','37993',
                          '77476','78179','58798','66370','91383',
                          '22637','60269','92151','86115','21010',
                          '62500','56704','44019','78763','38057',
                          '81815','94213','79276','16083','23481',
                          '36137','54811','25450','48869','32544',
                          '48945','40887','77474','44918','73964',
                          '15128','46471','89690','42811','19093',
                          '51038','85807','71263','88138','23060',
                          '39439','19266','58006','96093','60233',
                          '99364','82632','94653','96631','95718',
                          '83463','46494','36436','42556','56807',
                          '32352','79758','67261','79270','87704',
                          '27759','98680','98618','64070','63716',
                          '47501','35316','22040','40938','67294',
                          '63429','24566','92411','59614','66161',
                          '14255','77939','48553','64901','85236',
                          '47105','25348','18777','66923','74587',
                          '92919','94699','79485','84235','39952',
                          '73035','69526','78085','72042','69871',
                          '66280','76838','22553','68387','84461',
                          '77050','79267','31748','58872','17007',
                          '76012','51559','85912','78461','66671',
                          '66892','29183','58627','87138','27572',
                          '16144','38421','92053','78177','54982',
                          '49757','81382','21484','78927','75803',
                          '95475','33755','98097','17348','72970',
                          '31404','86409','59036','91018','85897',
                          '82330','76594','50750','27755','82994',
                          '74924','19705','71729','14343','38300',
                          '73674','12706','62384','19240','59276',
                          '22876','12958','17272','72331','44068',
                          '74717','47454','15393','78525','62881',
                          '12858','64568','57054','21857','60756',
                          '79631','63589','18369','48719','95141',
                          '75928','99878','28551','98351','22945',
                          '89846','85238','51030','92532','34688',
                          '49848','58779','70985','10960','38268',
                          '62609','99337','53579','57179','23770',
                          '35742','57717','55009','19160','17296',
                          '26895','10025','80232','61396','52944',
                          '25862','83934','43336','20241','15075',
                          '81157','65600','40353','89489','43284',
                          '90365','50621','46071','14449','58661',
                          '53882','46445','26093','31989')
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

