
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
                          '56402','17843','12339','33354','34529','27983',
                          '25983','85938','82262','32754','51401',
                          '31687','56225','67729','25686','92316',
                          '70133','61735','43870','18975','47993',
                          '12125','16465','69511','69563','18306',
                          '65263','57452','18838','53929','55615',
                          '26144','15557','13975','74130','57180',
                          '71743','79026','22849','94125','53128',
                          '74328','42420','84218','94677','92677',
                          '23634','38846','44798','43245','27669',
                          '22807','49735','42271','18298','54767',
                          '60513','98810','14421','18434','97141',
                          '98734','41363','83940','14426','18336',
                          '63523','60125','80143','52691','78450',
                          '47189','19320','62940','36197','43676',
                          '77301','84042','67117','91558','36821',
                          '45088','13173','91363','49298','43869',
                          '41140','52827','73110','86666','23273',
                          '46834','75240','18173','33461','27319',
                          '27113','84800','11587','10179','93021',
                          '33650','32675','45472','48005','99915',
                          '53446','17587','79628','88630','56091',
                          '21429','93882','85216','69561','98003',
                          '94012','91628','97191','50962','69453',
                          '50240','39171','17492','61787','99590',
                          '85116','95381','50517','89030','24769',
                          '43237','24544','52198','49117','18494',
                          '18744','33164','44899','59074','87887',
                          '25092','98931','65165','63703','25870',
                          '39356','87838','74506','32213','92386',
                          '83690','25825','53237','41550','55799',
                          '46059','62750','93826','23813','98130',
                          '74103','96186','81130','64290','38798',
                          '80604','33233','99438','33945','77053',
                          '67550','33180','22799','43710','12431',
                          '33778','47100','16044','52966','16025',
                          '98745','22748','15186','45324','92611',
                          '68741','51608','15943','84264','39582',
                          '50154','83099','29925','22990','26375',
                          '17984','54304','32251','79501','73533',
                          '35164','45004','72183','24131','67584',
                          '83700','62164','48605','19063','41299',
                          '51162','43784','76113','62993','16323',
                          '88319','40798','94367','78535','99044',
                          '95924','62483','65207','49755','17186',
                          '27531','33258','48120','50357','41956',
                          '18292','86980','28160','32673','53023',
                          '27117','49937','62098','70583','80205',
                          '93795','54583','18654','14263','55481',
                          '75957','18377','52851','21368','49962',
                          '41826','21714','12532','39018','29335',
                          '75073','71925','33027','12600','24607',
                          '64041','83712','17696','27168','39994',
                          '62527','64936','11714','24273','69466',
                          '20160','87064','72037','35243','76447',
                          '92003','13595','41467','19927','28178',
                          '59865','26084','86791','28862','82665',
                          '56784','74346','73950','75895','41273',
                          '46881','37376','42579','12548','59171',
                          '27872','82625','11308','94772','97945',
                          '47354','31573','40600','28130','38230',
                          '37329','69372','88147','95319','25721',
                          '33637','67929','37610','30462','51763',
                          '52708','54898','63757','83480','54965',
                          '56583','60282','11082','37392','26453',
                          '59003','65564','55561','62413','26920',
                          '80641','31385','35951','58466','40382',
                          '60586','38515','76608','92948','65565',
                          '26117','12277','36547','61473','97431',
                          '12418','76983','95149','45781','15765',
                          '64164','35551','23408','15793','77902',
                          '75701','66048','64508','20121','81722',
                          '50194','43302','83101','63462','77908',
                          '39563','48516','34755','49616','92229',
                          '29713','58237','83102','77442','73076',
                          '80729','54291','38993','34181','29905',
                          '14545','90991','44301','49394','54539',
                          '70959','45638','31276','17541','56479',
                          '59562','53984','86868','18893','81766',
                          '70346','67847','60208','74271')
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


