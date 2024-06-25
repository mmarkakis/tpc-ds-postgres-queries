
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
                          '53234','34559','12045','85418','87908','91342',
                          '17154','87082','88037','84691','81963',
                          '86430','95564','12581','53495','13239',
                          '69835','63824','99302','16808','97187',
                          '67397','42752','75618','94446','61111',
                          '80470','71635','67744','97649','63941',
                          '92986','72028','10180','82327','26730',
                          '46700','68578','20207','42154','76140',
                          '15683','63234','98428','89749','25716',
                          '40229','60412','37400','56090','91272',
                          '54142','95743','95785','74810','84409',
                          '19415','38768','44276','34470','80626',
                          '77619','16975','23265','90411','96532',
                          '76028','29191','57218','29752','47067',
                          '34111','85405','79098','24537','23014',
                          '37171','24895','93399','62659','32044',
                          '49264','41420','36248','14093','58759',
                          '55666','59998','32803','68809','50583',
                          '22857','79412','37199','93556','10350',
                          '74630','50157','39032','52892','64825',
                          '28912','27341','35252','97145','91091',
                          '88191','61023','60524','51736','92189',
                          '32052','14285','79299','99072','62974',
                          '23610','81619','49846','92082','80970',
                          '45791','39202','88413','33053','14729',
                          '48358','75475','12119','33082','97756',
                          '39485','96098','98612','72319','98919',
                          '82269','46224','73520','39123','97633',
                          '18373','69513','29976','47329','86232',
                          '12604','77854','57750','26783','23169',
                          '96708','53537','77722','50832','48246',
                          '69473','25358','54583','86576','15976',
                          '17126','43455','12792','88266','83711',
                          '12375','93583','19130','84391','65642',
                          '98127','90803','97152','49343','58641',
                          '97833','29055','53124','25843','91470',
                          '42055','74135','65752','12161','26398',
                          '27906','74177','59963','38809','37393',
                          '88587','60658','88023','14933','37519',
                          '98432','54776','97111','48847','45269',
                          '38626','96373','22278','13444','45019',
                          '91902','66173','37636','59477','80048',
                          '78447','93125','47078','33986','79508',
                          '47297','90783','66434','20781','81513',
                          '20257','92577','33044','74157','67042',
                          '27354','64501','43301','85058','40538',
                          '30494','45231','82600','37541','70296',
                          '71424','21300','60971','32229','47217',
                          '37682','20461','54119','89916','12952',
                          '56990','18794','67842','44475','69389',
                          '40698','28668','30675','97644','65934',
                          '12202','13506','95771','92874','19087',
                          '47701','68412','67016','42787','42950',
                          '97315','76217','13797','28088','12044',
                          '77651','28662','33491','81985','31637',
                          '69301','38245','84661','39983','13612',
                          '94935','42432','47311','26554','41147',
                          '72291','53550','90849','20367','75477',
                          '27878','76247','49508','76485','16471',
                          '35406','80660','67168','13773','21149',
                          '50445','36539','18064','69478','70581',
                          '54729','86259','64555','35126','62187',
                          '33891','93090','53581','65737','20399',
                          '58510','77366','31473','19407','86095',
                          '20899','66490','48987','36136','44876',
                          '27984','61094','72555','47551','34806',
                          '59569','60334','61664','34382','92870',
                          '11760','17466','59638','60638','89551',
                          '37775','91136','96146','16865','91276',
                          '31362','98159','29910','68377','33327',
                          '98586','49701','31968','40789','78562',
                          '21613','14867','81340','15521','61772',
                          '65933','49479','18700','50896','55616',
                          '96222','50867','10105','65309','29588',
                          '70100','40369','63350','90575','25809',
                          '28005','52389','10193','36395','39009',
                          '99534','81435','44381','82363','82569',
                          '56001','90671','24332','34324','30874',
                          '60586','16358','73881','86016','60648',
                          '79490','78300','40813','77501')
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

