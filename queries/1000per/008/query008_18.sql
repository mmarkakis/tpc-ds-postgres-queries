
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
                          '90416','12607','26205','33463','71017','32037',
                          '22779','72740','50849','69022','81823',
                          '19417','17686','58257','26649','12779',
                          '47510','86191','83841','64910','92272',
                          '72534','55340','54616','28050','90309',
                          '16061','54425','90662','97215','44744',
                          '70196','99597','49008','26651','64981',
                          '21204','72244','97360','74355','95657',
                          '65627','30732','72724','14712','83384',
                          '76346','31925','95510','83262','78612',
                          '35805','69164','19758','44090','70023',
                          '57470','61182','94434','99200','58677',
                          '51203','30881','32514','10393','19321',
                          '82033','90079','70536','32961','64510',
                          '53629','52092','29918','57268','35422',
                          '93048','37601','20198','41144','25520',
                          '27343','48101','17331','69581','45929',
                          '60679','71747','91484','63708','14566',
                          '93466','28330','81535','88956','87881',
                          '11895','50481','29120','54952','42082',
                          '91946','28753','51110','86461','23526',
                          '79042','33994','39576','16558','54996',
                          '41872','96238','30342','17239','24909',
                          '16068','15708','82829','76114','70515',
                          '57215','93293','20976','83555','63923',
                          '89810','80387','96376','95022','13704',
                          '77142','27081','12767','90565','78503',
                          '75263','53212','25121','57778','31275',
                          '64793','95509','88593','40117','77634',
                          '44218','73877','54652','24318','27285',
                          '88796','38098','28731','86149','18230',
                          '96242','96543','95511','42664','48339',
                          '43864','99519','30656','83738','54800',
                          '70869','37250','58115','41042','46074',
                          '47741','30007','27043','30918','59907',
                          '41981','97874','41994','84894','53727',
                          '55747','40972','59698','56478','86562',
                          '74955','56590','79544','96772','76765',
                          '34821','50313','22808','50823','23664',
                          '78231','58666','31899','64251','92147',
                          '45688','27280','36091','29019','53392',
                          '78105','40669','56896','36488','54879',
                          '19656','70572','14654','37441','21758',
                          '86470','82299','80867','35607','98391',
                          '18275','24869','23984','54923','24678',
                          '52791','78208','28811','36052','32013',
                          '92320','28150','24762','29043','78124',
                          '35771','28812','89887','74025','63200',
                          '89503','60686','89943','25789','10728',
                          '47178','38908','31713','17939','75916',
                          '67747','57885','65012','50079','43930',
                          '63410','42568','71326','29999','78963',
                          '89033','49344','76102','71795','96166',
                          '17746','21057','41970','60853','43401',
                          '31877','29007','11789','47559','63464',
                          '73019','13927','29410','93275','88892',
                          '37240','11955','67176','40394','24903',
                          '84593','93218','15030','10158','14526',
                          '13722','79284','62377','69634','58465',
                          '30538','10620','65001','31076','97961',
                          '87292','38526','53533','40904','42257',
                          '96990','64427','38657','74178','86919',
                          '41668','34248','44128','44020','65410',
                          '25341','47690','21233','12400','96863',
                          '85684','29224','99138','88821','69251',
                          '29603','90453','86008','99546','74038',
                          '71048','17282','98994','87778','19451',
                          '93923','38274','31632','76243','78201',
                          '18053','44868','79856','83035','90332',
                          '33607','18922','87993','27557','29541',
                          '96135','21726','50036','83213','84758',
                          '88420','35283','55069','11592','92468',
                          '89256','66317','71537','76268','18089',
                          '36388','65204','84256','43637','31249',
                          '21686','25251','79635','36825','63181',
                          '11253','48955','80250','33299','80641',
                          '88275','33465','61537','96005','89018',
                          '38684','26345','15942','13357','45946',
                          '78729','60985','63054','86661','64026',
                          '54443','52970','36794','71836')
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


