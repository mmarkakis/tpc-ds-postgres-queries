
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
                          '10498','25460','25734','79898','73551','44082',
                          '40575','47813','49376','32047','59435',
                          '21819','55334','15979','20057','51509',
                          '57807','50602','81962','59905','30217',
                          '94967','67714','56765','14844','86483',
                          '80517','31037','30413','32231','58906',
                          '64764','48709','44572','96430','91358',
                          '84365','56885','64449','44300','32823',
                          '54837','91064','85029','46538','77301',
                          '68144','45145','60597','14146','16288',
                          '74538','38470','18688','43889','78370',
                          '26772','46269','84304','43791','15508',
                          '10913','23460','74236','53149','79920',
                          '19249','58921','45880','89773','82807',
                          '39650','37094','16213','31715','49641',
                          '60666','28377','36547','97258','35145',
                          '21160','42693','22397','36275','24209',
                          '25218','83125','83732','29085','72098',
                          '30035','33442','93048','14280','11102',
                          '13754','49062','44439','39405','68934',
                          '35967','69025','33739','75275','93351',
                          '45595','27284','92502','19790','80487',
                          '85984','34318','72256','68441','66621',
                          '99071','72710','19478','80223','16231',
                          '18444','38770','91179','42806','81725',
                          '49937','38861','58502','85215','99499',
                          '25885','93638','44469','29655','56881',
                          '92788','97158','36334','88720','36992',
                          '93521','21714','96084','67052','74871',
                          '49461','21409','80664','79187','68819',
                          '39621','52167','15001','15767','38802',
                          '97325','58010','54919','68627','82501',
                          '38858','26926','63008','36250','12938',
                          '63109','39576','26498','35009','59224',
                          '75763','10322','61653','59330','84467',
                          '41679','80526','14890','58397','73546',
                          '23351','22857','87978','64499','72854',
                          '80706','45850','34838','45698','55037',
                          '10739','83608','37812','88247','21165',
                          '31747','72622','16593','40994','80793',
                          '94408','24928','15244','84034','86381',
                          '47472','26942','23534','21191','62275',
                          '55393','49651','30360','96255','72308',
                          '84687','61711','23467','48849','17729',
                          '44372','49278','52175','50910','30216',
                          '86774','14756','74016','17624','14852',
                          '64928','36886','66258','11353','80930',
                          '53350','27447','71349','99833','70475',
                          '90088','16485','65770','19323','77594',
                          '41391','99887','27653','40796','88107',
                          '26207','48858','97340','42521','91172',
                          '84263','56281','25613','76681','98270',
                          '37865','27748','33585','69172','45159',
                          '34059','68497','37116','20203','56425',
                          '51690','13547','54951','42708','33795',
                          '65109','33454','27271','60166','13125',
                          '16031','40329','17875','68308','68622',
                          '18844','16810','17543','52192','89930',
                          '54670','81790','16021','74244','24043',
                          '51745','28175','23543','29122','66484',
                          '18849','14614','63047','75837','33710',
                          '37979','52646','30304','16881','52432',
                          '51990','64854','91665','93645','61924',
                          '89857','79182','73602','13262','22587',
                          '13584','43069','65007','82856','70734',
                          '16908','27933','60585','10489','34411',
                          '78095','49025','39487','78554','20357',
                          '59168','43899','58489','52851','68884',
                          '36499','85770','57834','58465','34765',
                          '84917','20544','93577','90857','56068',
                          '60059','45794','88093','52540','29019',
                          '22166','23260','67333','12533','68217',
                          '69144','63072','75218','64376','50368',
                          '78989','90450','48813','51391','58842',
                          '42299','99249','73450','83494','95254',
                          '80614','24731','50587','13914','84316',
                          '85014','98661','59499','14137','17441',
                          '98079','62460','54049','37186','45182',
                          '80376','11264','54724','72031','67843',
                          '41383','84854','33424','88769')
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


