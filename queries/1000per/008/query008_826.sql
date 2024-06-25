
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
                          '36272','33237','63677','30644','89771','95049',
                          '34867','57640','82513','17337','97577',
                          '49230','19460','14119','89492','35207',
                          '96103','35311','51610','39766','46480',
                          '11582','41136','52570','29926','88303',
                          '40822','58135','32090','36851','67828',
                          '22846','38766','98847','38237','18589',
                          '14826','55168','20732','33708','76827',
                          '89822','12476','18913','44515','89509',
                          '76478','86305','25218','66299','92210',
                          '84375','19385','73023','62992','65544',
                          '61760','29652','12875','11736','37955',
                          '90312','71789','96502','16444','95644',
                          '73020','48628','59573','14792','81860',
                          '38678','72857','91752','23709','48006',
                          '78082','59903','55650','72310','26670',
                          '26387','57272','82148','82989','98005',
                          '11949','37050','10112','84276','88819',
                          '12575','31127','74817','37183','46105',
                          '56659','76297','96761','52713','51554',
                          '62410','87648','27020','57387','84325',
                          '49199','18019','24054','69139','95371',
                          '12530','88192','70892','62211','88495',
                          '97280','20315','32013','42251','32521',
                          '52375','42063','52970','12597','72393',
                          '83553','59699','71195','78871','95169',
                          '11854','89027','90061','58446','86075',
                          '66550','76804','81013','38262','54669',
                          '93184','54521','21038','80845','76584',
                          '32982','50868','40057','77770','76755',
                          '25312','94961','99428','79941','51019',
                          '82417','41096','22166','57459','77426',
                          '29084','17455','51343','62154','96644',
                          '39562','38014','16943','42188','20135',
                          '20257','25382','86874','67773','65596',
                          '44731','42809','15628','73080','48256',
                          '86165','95641','30073','59574','11086',
                          '91890','37941','63442','78892','36846',
                          '58886','55464','49045','74729','26246',
                          '52412','81908','90787','27943','43083',
                          '69044','34467','75784','63009','53249',
                          '40698','77413','54026','68818','32605',
                          '30883','48059','44634','49806','34238',
                          '63230','35788','64098','38638','93919',
                          '37112','72543','25916','52037','15719',
                          '76085','38592','31354','24430','91425',
                          '95474','64844','58315','21692','88344',
                          '73854','22921','65104','81075','29250',
                          '88654','79465','85821','41944','56504',
                          '71852','86529','93645','98146','27982',
                          '11976','40750','71837','83332','86866',
                          '29040','25722','50947','38152','59694',
                          '73586','67278','32463','17031','74008',
                          '24379','31387','29870','80256','60827',
                          '74754','54125','55637','80750','41163',
                          '14965','73403','17952','59463','26505',
                          '85364','27195','62061','75429','80224',
                          '52233','65969','42868','83144','46946',
                          '74782','46295','70020','96967','91966',
                          '28212','98195','37900','83468','52580',
                          '52264','18203','78354','42999','51262',
                          '31223','67894','94088','54764','24992',
                          '66446','26948','31496','27560','66779',
                          '98943','36445','87339','46862','36191',
                          '65132','55912','11849','28046','54568',
                          '18746','71712','58510','69791','90214',
                          '82675','45985','18805','77665','63526',
                          '26057','46011','25028','75985','26198',
                          '47716','61164','70849','88142','67241',
                          '15612','41757','47748','35345','64404',
                          '66807','42578','49656','10217','77293',
                          '14759','93886','97669','70961','77980',
                          '30599','36092','96964','10539','89582',
                          '10528','16428','55224','25583','44158',
                          '41211','26268','55745','70079','68423',
                          '84846','26429','45492','26388','33949',
                          '65431','66625','34906','72963','86512',
                          '67377','16904','72686','82344','32782',
                          '33947','75686','10402','64073','82503',
                          '63173','36751','72687','41177')
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


