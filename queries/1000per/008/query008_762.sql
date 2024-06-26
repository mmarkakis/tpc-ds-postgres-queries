
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
                          '25176','65977','75410','82869','27710','90334',
                          '37276','94020','87209','28708','21852',
                          '31445','53992','59663','51365','92550',
                          '58895','65884','72595','71998','95744',
                          '21114','96307','27640','79335','97981',
                          '88330','97914','41058','71760','64831',
                          '43641','52204','37213','33644','18554',
                          '70702','30791','56031','25008','64061',
                          '87164','82555','96610','88310','65289',
                          '33885','45413','91901','76583','43389',
                          '65719','12439','52531','32421','58024',
                          '62326','87951','57741','74648','46967',
                          '55199','81109','13148','14155','89591',
                          '67006','95093','35757','91968','47663',
                          '11498','39038','20586','39390','18428',
                          '27925','22395','53655','86665','63625',
                          '41149','86636','81070','75271','61065',
                          '76874','68254','33681','47388','86970',
                          '59702','15739','25410','26491','16501',
                          '38016','45506','63936','20493','30286',
                          '75048','75287','55150','62759','92462',
                          '35616','70885','62519','34877','62106',
                          '52193','84234','21247','51716','34461',
                          '83769','56802','95424','46971','23458',
                          '35693','64176','52352','33803','77395',
                          '88031','12796','57493','82858','77812',
                          '77048','17183','37500','63674','75898',
                          '97780','85052','69925','55179','30880',
                          '94923','11486','33216','80681','10199',
                          '38813','72493','72400','17387','97343',
                          '95451','80980','69086','52857','11198',
                          '28943','19062','40017','40691','33293',
                          '62745','25613','49749','83650','84359',
                          '14835','63685','96233','18020','39631',
                          '54623','61093','38914','83267','18589',
                          '59965','48565','68393','74589','82365',
                          '85180','28918','94009','66261','78133',
                          '75061','76523','81056','78236','54809',
                          '42420','14188','82982','47683','32156',
                          '87176','11406','18457','74864','93105',
                          '88046','37473','43304','75245','11915',
                          '77532','44907','20368','81964','54419',
                          '14890','65742','66747','27565','23147',
                          '62530','13664','99800','84946','84876',
                          '75100','82925','60173','68931','83906',
                          '87865','95191','40561','35769','61197',
                          '95932','99605','57315','18815','99317',
                          '19030','92025','55679','86928','51483',
                          '37448','50274','50444','91795','33140',
                          '75865','11744','20129','23605','87750',
                          '53878','42556','73801','47982','53866',
                          '94256','61000','64701','40796','74125',
                          '87916','11204','85734','51878','82388',
                          '96904','24649','25384','69659','56076',
                          '71755','54805','48509','99229','97075',
                          '98382','18782','11823','31168','14619',
                          '14960','91271','13590','91872','54808',
                          '39707','26186','33851','66171','69354',
                          '69244','42508','87467','91047','54317',
                          '54463','55332','91268','85870','59266',
                          '28455','96157','46592','53101','55031',
                          '96802','96736','43874','89998','51497',
                          '47916','81352','63191','38046','64397',
                          '19790','87657','94470','10116','82500',
                          '49780','39884','39289','66649','11056',
                          '74239','40419','53262','51503','69095',
                          '88392','95491','60529','64403','72903',
                          '70459','90220','80684','29914','34863',
                          '15357','12838','48356','41703','53503',
                          '34549','28639','75480','36928','93538',
                          '80471','47649','57628','40514','89244',
                          '21502','67317','91627','26460','78233',
                          '21820','12031','26818','31515','62476',
                          '51239','27572','82036','71773','74798',
                          '62943','35979','89150','83880','59449',
                          '81959','31475','96446','43549','33469',
                          '82225','89737','80504','55011','16112',
                          '95094','94077','59002','96403','79140',
                          '54879','19054','91178','38538','18034',
                          '18772','51232','89274','31893')
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
  and d_qoy = 1 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


