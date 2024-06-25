
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
                          '42932','49557','49722','27724','97559','35807',
                          '92187','23273','49184','48563','70969',
                          '73503','71917','94226','11645','31726',
                          '60412','94434','65838','22241','27265',
                          '14788','75940','45911','14515','15563',
                          '77080','58721','95970','96942','55024',
                          '31102','68660','23934','79404','80105',
                          '51420','30364','46579','42853','35301',
                          '40939','76683','63788','87343','85862',
                          '45796','57400','11021','54439','73920',
                          '68895','26371','88690','62323','27186',
                          '28673','19908','26443','72270','59546',
                          '68222','21677','96046','44946','25915',
                          '75853','70276','37018','82311','65301',
                          '25830','32675','23512','62465','10086',
                          '64816','30015','67629','31168','30413',
                          '26917','35852','57416','67064','12073',
                          '49377','43336','23149','95005','28194',
                          '74195','21061','75759','62844','25903',
                          '36487','72082','54421','84468','59958',
                          '61511','53419','61404','78936','15151',
                          '85657','32126','19974','86674','17006',
                          '19708','65932','14864','37831','46489',
                          '65620','47210','48380','97215','91280',
                          '87092','82783','83921','73326','52115',
                          '85506','58909','35028','89873','17225',
                          '94113','64267','51338','50797','47300',
                          '19013','67031','83548','91418','35700',
                          '90772','76682','45196','73089','27225',
                          '53054','33806','80311','27785','22828',
                          '29514','88344','15798','88870','54229',
                          '22361','24311','96165','31522','19716',
                          '39643','66141','50217','25734','11075',
                          '61350','40257','10071','14252','29185',
                          '44756','62409','99910','14073','11029',
                          '17056','61700','17385','48492','22329',
                          '78014','50044','13887','83584','29886',
                          '26314','86521','35634','89059','15309',
                          '19024','48284','37158','96414','51887',
                          '35770','69695','52642','82621','41135',
                          '85908','40023','99397','39715','88425',
                          '43897','35255','39288','86782','72154',
                          '47509','56137','72262','82601','55580',
                          '53942','58449','26900','26386','76027',
                          '50385','44158','27055','19866','22720',
                          '26066','11365','55311','88257','71539',
                          '91903','37402','75497','75922','90649',
                          '99392','90625','11028','29907','18854',
                          '49333','41528','50328','99713','32010',
                          '26623','10168','83708','64672','56592',
                          '80800','90956','53926','82788','16515',
                          '95358','93511','86153','50614','15082',
                          '76448','93327','43289','69740','86193',
                          '80646','69074','31128','16972','60746',
                          '74253','84546','30619','12450','81468',
                          '46326','38455','96601','20268','89632',
                          '69433','63823','76818','48206','35617',
                          '79856','40360','38928','30149','23110',
                          '68364','70013','73477','76548','23982',
                          '31069','45035','54647','79759','77366',
                          '56525','13254','49010','42389','50594',
                          '31479','94943','42262','29796','78199',
                          '92869','76279','57109','20910','46364',
                          '91685','43271','36613','14637','17503',
                          '52919','61880','61076','74514','84199',
                          '21838','78134','15385','71105','56830',
                          '72880','73610','52501','96668','44113',
                          '16379','61715','15045','28363','77570',
                          '57038','13097','77331','75181','62668',
                          '48215','79022','68727','47058','99431',
                          '32460','65710','47526','48123','85870',
                          '53006','96994','99997','35627','43451',
                          '14448','27343','29717','75818','36015',
                          '41806','28880','88600','83190','98688',
                          '62726','98047','32092','62558','29927',
                          '64429','65475','96223','56732','66422',
                          '21290','61970','63154','40463','83053',
                          '52352','51500','89858','42333','52265',
                          '80564','99932','99881','31238','35260',
                          '86800','60348','25224','40518')
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
  and d_qoy = 2 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

