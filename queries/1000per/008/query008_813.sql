
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
                          '58470','95944','30933','95490','69339','45533',
                          '77917','68745','60379','80927','15541',
                          '89225','67042','47596','47701','49355',
                          '96516','98903','82494','77032','66949',
                          '76019','20174','21782','22427','50009',
                          '63528','58542','27061','38907','91868',
                          '75017','39016','40758','11825','94628',
                          '52839','22789','88044','26192','66028',
                          '76990','45995','76803','30994','38482',
                          '87429','89405','74868','74222','71285',
                          '14743','77879','53873','13378','97744',
                          '75406','62062','66644','64580','61893',
                          '56524','99032','49348','57330','45008',
                          '64738','20102','66425','22131','17884',
                          '35498','27546','67220','59145','45905',
                          '20670','50502','55289','11737','79529',
                          '75363','93042','70589','87439','11593',
                          '55059','58963','90435','99404','49836',
                          '18657','51692','62466','93387','68575',
                          '29884','43192','50632','58620','45980',
                          '61771','14075','15273','73209','97195',
                          '97579','98900','37843','99604','98563',
                          '52543','58901','68415','76101','60104',
                          '79201','39951','36783','15986','18429',
                          '21783','78255','21116','26534','37102',
                          '99782','41982','41461','66550','76746',
                          '30197','17465','48142','42959','56172',
                          '94946','73295','61976','88741','86573',
                          '89545','68756','59865','14560','43019',
                          '28807','56385','46307','31998','89873',
                          '42692','69903','82285','65687','98384',
                          '48967','37084','60334','12409','66617',
                          '87563','70411','82217','23111','13865',
                          '82237','54075','79413','94428','69464',
                          '55003','59310','26158','73383','53644',
                          '95171','12135','89656','73310','28018',
                          '93241','87552','12930','62882','12677',
                          '70654','14491','84736','42921','84128',
                          '53274','44858','46366','94349','64985',
                          '27492','92242','60279','62689','70373',
                          '62245','40598','68101','64016','19121',
                          '87877','57898','43718','83765','90646',
                          '61216','13956','61735','25785','84557',
                          '47086','73221','28551','27320','38929',
                          '48699','49409','39705','93208','26617',
                          '68546','72701','54416','22241','12366',
                          '49746','20150','35598','75640','86373',
                          '36808','43800','32251','88643','90845',
                          '80961','91519','65761','16947','85923',
                          '97644','23072','75542','85315','36012',
                          '95266','83811','20212','18939','69571',
                          '88415','90432','49254','14914','21909',
                          '21372','20117','35034','18060','80757',
                          '48528','34804','37986','52170','28314',
                          '20106','16243','73427','54944','93854',
                          '24323','12055','33508','14787','40558',
                          '79335','21570','16122','90524','70436',
                          '25735','74769','65365','33244','21564',
                          '48454','37024','50069','16795','47234',
                          '77816','49385','80114','14763','42755',
                          '99777','88551','12021','56073','22149',
                          '14372','36852','95326','14781','98619',
                          '57056','78174','47147','33607','30422',
                          '58697','18549','79368','62130','26168',
                          '66964','88288','30714','69678','57297',
                          '39352','47425','12594','63117','10655',
                          '11597','86678','80411','51626','82911',
                          '20957','15727','39372','72636','26460',
                          '60828','11156','30893','61335','89562',
                          '22228','63876','38933','88316','77803',
                          '85679','27934','54776','64884','20360',
                          '97487','22402','32573','65818','96413',
                          '39964','83002','82424','46842','78131',
                          '44700','92803','72906','45718','20347',
                          '90628','56930','66383','42728','69195',
                          '73671','57087','27477','28296','37553',
                          '24849','76957','66946','98421','12785',
                          '21542','82672','28849','56167','95185',
                          '41375','39268','71995','84492','38861',
                          '75057','56572','32335','89189')
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


