
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
                          '72958','32392','38242','23594','21280','48824',
                          '90416','48571','79756','90344','31048',
                          '30052','69359','30420','48214','87907',
                          '84304','91846','34093','38233','38225',
                          '66476','33467','45402','17984','37102',
                          '34106','56150','71810','45732','46316',
                          '81330','40901','81157','55451','11051',
                          '31950','88338','76982','42277','47063',
                          '94222','92651','68350','60160','96602',
                          '27200','31763','46223','17566','69042',
                          '90116','77267','35793','33657','17830',
                          '67625','92803','16451','93499','45422',
                          '67538','11495','49898','75167','33367',
                          '42203','14478','29134','52282','99381',
                          '61432','76691','63499','78270','85906',
                          '25273','30642','98740','93607','97532',
                          '56982','39089','43731','25675','98788',
                          '59735','75805','37007','21892','46037',
                          '46737','46234','95152','14442','27337',
                          '56415','68309','53159','95331','44976',
                          '51785','16357','63422','56018','22140',
                          '66549','39484','15967','68288','91585',
                          '35387','51429','59660','42658','93181',
                          '46585','64896','85926','87357','77770',
                          '63215','43181','12981','79538','31166',
                          '99193','43057','50591','72405','41646',
                          '58134','29846','72649','71928','27722',
                          '48040','43723','13432','68247','91935',
                          '41405','70008','97642','88930','15885',
                          '91688','57553','23312','89996','52682',
                          '59215','19717','34380','19149','15520',
                          '47674','19778','71102','17172','56155',
                          '82114','35130','47740','14180','87155',
                          '41866','96398','61792','56660','67723',
                          '58094','93047','18649','37311','87421',
                          '56755','74319','82524','48318','61455',
                          '97020','15702','51595','48461','51786',
                          '22158','17927','10140','15979','77211',
                          '41863','17346','61653','85801','28612',
                          '81964','20114','15411','66486','39713',
                          '13223','58148','38392','87315','88491',
                          '36668','29671','93096','35968','13694',
                          '18237','16366','24913','15926','74311',
                          '28218','62755','95873','20126','30374',
                          '71472','37061','36918','84949','16294',
                          '69910','34515','47401','25873','76895',
                          '50552','98182','80033','30457','33968',
                          '21663','59796','47409','40211','33777',
                          '20502','24928','93492','70320','28488',
                          '84613','65820','95664','72296','68964',
                          '19496','30757','52480','67366','74217',
                          '55570','27247','84738','55429','51890',
                          '78574','40377','74010','16753','94594',
                          '15214','49326','66169','41207','54435',
                          '85655','32282','92606','60541','26286',
                          '58625','28614','76012','80966','97285',
                          '42694','65915','32951','64221','76576',
                          '92271','70978','19414','73398','50411',
                          '25344','50242','95770','79148','73879',
                          '58555','97548','87390','49244','19280',
                          '93735','73308','92037','42149','65250',
                          '57437','90197','13718','76634','19409',
                          '13461','92452','36774','77832','90611',
                          '79946','99588','75860','22590','88434',
                          '58974','56449','33926','88131','78419',
                          '85315','46763','67335','51750','60307',
                          '21678','14735','63955','42006','81783',
                          '91860','26972','95973','58244','29186',
                          '81370','18983','97108','65217','53017',
                          '52544','80730','84468','10864','20970',
                          '43413','91231','15610','93838','35610',
                          '45819','53663','31468','48624','60045',
                          '80134','71974','74266','68744','74664',
                          '10489','19593','57414','66871','47004',
                          '53879','89913','48240','37437','79204',
                          '58608','57790','28183','78217','38494',
                          '28852','45912','72121','27190','95540',
                          '33732','41911','41254','69338','59500',
                          '92153','16413','45965','67255','88644',
                          '73114','39232','96517','30337')
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


