
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
                          '28787','74336','93770','96208','65959','68258',
                          '79013','24882','94117','81008','45772',
                          '85115','39909','69877','28114','52802',
                          '96665','97271','52810','39006','39815',
                          '97142','92438','17868','24293','55918',
                          '99193','22140','21538','35101','58314',
                          '83742','82715','65614','64005','74814',
                          '70714','92388','62288','33556','30667',
                          '83656','79215','35188','28642','65592',
                          '19023','46157','78566','83919','57330',
                          '67996','77774','29444','77561','82630',
                          '59637','90843','63922','95454','78424',
                          '63757','69414','51138','93187','46356',
                          '43222','78651','35184','78077','49992',
                          '77736','76439','35044','21115','73216',
                          '44428','54890','45251','27073','76093',
                          '23498','16700','57895','99279','11854',
                          '37080','80888','37359','83337','92030',
                          '19193','44970','24285','75295','34855',
                          '29741','86691','28410','32795','36686',
                          '33933','18173','67776','48123','57618',
                          '65144','43809','72718','80488','45531',
                          '73035','36931','78180','98827','15589',
                          '95407','27277','35878','67354','15410',
                          '16349','18479','74615','82283','62540',
                          '40289','41654','11733','78213','49627',
                          '44808','54770','51665','17053','55458',
                          '40989','40700','49031','29948','29591',
                          '28240','93136','22100','24140','52699',
                          '49334','83809','96159','25124','86296',
                          '90632','91422','99482','89337','70463',
                          '21733','43208','44195','93989','70634',
                          '15250','89697','16908','60418','56397',
                          '76577','33340','37654','69443','50972',
                          '19464','57645','38296','34370','84897',
                          '26982','63941','59586','97721','47986',
                          '15049','83172','29724','95688','73478',
                          '52013','82919','22768','37106','25090',
                          '68842','28648','79584','74926','94980',
                          '46459','82774','12252','64787','39167',
                          '99228','31785','84624','40130','18982',
                          '10717','98631','88932','76024','69261',
                          '20196','11142','87294','48534','73196',
                          '28310','56849','46246','85971','58343',
                          '31130','33720','53592','15242','30277',
                          '86072','89761','34141','48575','30001',
                          '13025','50181','29538','97200','16577',
                          '65745','97404','61936','64359','96347',
                          '65306','16735','23269','66340','32765',
                          '49889','62302','35338','50534','76993',
                          '88935','94485','22762','44441','61882',
                          '53365','62807','29889','17479','46870',
                          '61299','45548','77236','57322','72889',
                          '14537','49611','22081','61346','16378',
                          '52593','31253','94622','93333','50307',
                          '79175','78961','90281','32272','46291',
                          '56096','41755','21873','80039','28090',
                          '52558','31561','29752','54200','36278',
                          '42557','77647','86777','67397','71453',
                          '12202','95694','51136','57637','58636',
                          '14123','55046','24224','51729','77713',
                          '34282','94138','79702','83887','69351',
                          '20520','99373','59849','11047','83200',
                          '63497','91298','32823','84592','69409',
                          '94029','82867','11139','74212','96143',
                          '59724','12403','58380','38622','12923',
                          '43897','69393','68442','33418','67583',
                          '74229','87883','79096','83965','32148',
                          '68388','22222','33510','33624','39621',
                          '17075','49970','49662','80723','30065',
                          '69585','49967','37373','11644','65451',
                          '20527','59748','75363','44829','52891',
                          '15741','30827','42704','21646','96496',
                          '14647','15856','80267','25268','50616',
                          '74912','10376','67099','14803','36317',
                          '18545','16978','10102','50456','23852',
                          '20749','62970','35148','30340','16358',
                          '39988','59191','52603','97548','82378',
                          '18944','94684','51985','81681','14672',
                          '54209','11597','13623','80933')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


