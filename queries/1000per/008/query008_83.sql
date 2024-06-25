
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
                          '53728','20100','90645','71908','87725','65257',
                          '38521','68258','55002','67474','49241',
                          '64401','28109','10178','13333','35203',
                          '23255','16740','45120','26403','72932',
                          '15092','64972','50383','24752','44284',
                          '36473','16069','62991','13379','63434',
                          '83862','13267','86209','88398','10484',
                          '14459','16264','50207','23176','36261',
                          '58080','78282','23373','41880','46594',
                          '94366','18374','61426','12901','20618',
                          '39886','12188','46585','81304','67357',
                          '67431','96627','56595','49609','83332',
                          '57166','53619','99887','92272','68773',
                          '89668','88556','13279','29916','37603',
                          '84524','34198','45476','84720','92104',
                          '65691','86833','69375','81725','34569',
                          '44336','57232','89275','32338','55063',
                          '74809','40584','76785','41409','72053',
                          '76724','27725','10522','88670','68014',
                          '72639','21829','70206','78753','71630',
                          '20371','41835','38599','27316','56300',
                          '27890','19228','43740','60629','35444',
                          '82249','37591','35948','57350','98949',
                          '90447','44170','82371','44237','90277',
                          '58048','77112','60099','77302','63988',
                          '77159','39985','36884','45692','69528',
                          '95032','19411','47314','66344','62905',
                          '89911','15777','24444','35311','82120',
                          '19136','84931','32913','21015','94515',
                          '32037','72090','68633','65971','96977',
                          '42052','47826','58127','88531','16975',
                          '13423','93145','54309','69514','75791',
                          '72083','37409','49363','97715','69012',
                          '50802','66061','60278','50680','44769',
                          '89402','18789','28452','46195','88291',
                          '64970','95701','90568','90468','38498',
                          '93933','45150','79710','28003','40740',
                          '67192','33675','99667','53652','37036',
                          '72754','23205','35120','66683','76059',
                          '42476','92242','26159','27885','37142',
                          '94624','58602','14636','17930','66758',
                          '89239','28886','67914','78731','32469',
                          '23589','82557','85889','70908','77279',
                          '32769','79315','98035','91439','51655',
                          '82149','96603','97585','61900','49387',
                          '58940','21182','19339','65612','20735',
                          '15550','50890','42038','63987','87484',
                          '49010','98191','36178','20517','99726',
                          '75378','11401','36041','83020','30007',
                          '49880','79303','46537','35335','15809',
                          '20257','30493','61150','50942','10855',
                          '67719','45236','55604','27030','34908',
                          '54474','69436','61663','74056','50326',
                          '98575','12085','96595','71724','76546',
                          '88032','46207','63462','45438','30552',
                          '41550','84932','72444','54279','30264',
                          '47966','56874','26667','44156','99893',
                          '45478','77205','42381','23281','52562',
                          '26894','52070','18421','48465','39486',
                          '41213','84102','51494','98327','63982',
                          '52215','74260','15901','77081','25751',
                          '18107','51217','73101','97363','40311',
                          '48138','40941','81787','11065','99577',
                          '41080','40445','87380','99768','16051',
                          '97425','29828','12631','19184','20355',
                          '67095','31762','61599','31426','73132',
                          '72329','10708','67970','56499','38977',
                          '38815','36431','57678','21019','80267',
                          '19294','44227','39144','76469','96985',
                          '18909','12225','40092','81993','54024',
                          '57540','53253','38738','36335','73526',
                          '58998','62484','82787','33294','24867',
                          '80838','16308','10494','12635','27925',
                          '58102','47772','58955','42182','64938',
                          '16488','90372','45135','26834','44352',
                          '11608','72530','79442','12688','18617',
                          '65886','56075','62530','49186','83995',
                          '77324','12260','83487','77859','35041',
                          '34026','72832','51514','52628','77651',
                          '62282','12508','54991','79218')
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

