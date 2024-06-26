
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
                          '13639','82687','63188','12734','11449','63506',
                          '19496','83148','49491','52312','34917',
                          '41955','90738','92809','92286','72491',
                          '93797','46820','87170','84977','20065',
                          '96892','51344','63604','89445','60553',
                          '61412','55325','81707','91686','91170',
                          '95847','97164','61984','83571','54714',
                          '54133','22111','42499','44293','85885',
                          '81622','97900','80683','23213','15429',
                          '36497','49785','41059','31848','39077',
                          '81454','58402','10318','22169','65571',
                          '19951','67939','72649','74237','24228',
                          '55732','15462','95011','83471','26654',
                          '23021','82644','75647','20462','55875',
                          '88537','79688','50743','35780','81171',
                          '19497','93730','81999','84732','64767',
                          '32104','19992','13289','92318','37158',
                          '93169','79694','78605','41125','93585',
                          '25960','90376','59534','39200','27733',
                          '68131','93429','78692','11545','78865',
                          '47871','12674','71039','39212','69537',
                          '53819','16757','80510','82460','37032',
                          '50064','72458','86934','64700','72641',
                          '30922','38009','84804','29622','85284',
                          '65619','92148','51821','37213','29066',
                          '61839','44257','74203','97615','89347',
                          '85307','83224','84588','18510','40294',
                          '29579','76135','12085','18150','38665',
                          '19535','73179','41458','13042','56556',
                          '94805','23832','92949','37927','92903',
                          '21667','46518','48039','36044','83538',
                          '56447','84058','13414','23069','67608',
                          '74734','94697','66244','99441','52112',
                          '32475','20905','19720','50302','27552',
                          '50269','91475','18942','15201','37934',
                          '49811','37971','68398','95318','34701',
                          '86426','21664','83335','23940','85547',
                          '35213','13668','86507','43548','24573',
                          '49661','64072','36549','88564','95447',
                          '47129','85015','78929','89860','39336',
                          '94623','96594','47628','54179','69249',
                          '50711','55389','40005','38720','83790',
                          '48120','52602','74002','58936','83195',
                          '10609','19580','83613','84299','90992',
                          '72875','49865','23156','54637','92091',
                          '23361','61368','57646','63790','72726',
                          '95678','93741','59018','87819','46246',
                          '69529','36146','39574','76830','34784',
                          '21758','42846','26843','88450','71235',
                          '37634','58903','20277','62352','75268',
                          '80462','89062','70803','62909','24664',
                          '70527','66394','43036','62894','40079',
                          '76697','81711','17514','74401','34748',
                          '66622','17045','39938','24817','83298',
                          '69140','56422','68955','58358','78083',
                          '23638','53057','88918','97418','22196',
                          '52073','70134','86040','34743','24067',
                          '62703','92041','16314','64133','23254',
                          '11578','18864','15776','87031','96961',
                          '73762','60737','92489','62329','33296',
                          '89716','63519','75133','90367','65700',
                          '19628','65997','91100','42556','12824',
                          '40716','95994','83447','39220','88109',
                          '29875','66996','87110','69304','94953',
                          '40300','92705','50780','10509','15327',
                          '58812','52092','51169','99579','54440',
                          '75724','21336','76285','70160','77920',
                          '74474','53029','17728','73174','85338',
                          '89776','51894','69928','86672','18710',
                          '95680','76837','39322','88828','39421',
                          '64936','33760','53942','61043','85267',
                          '43424','42947','35578','14321','18234',
                          '93244','20332','61692','98620','73468',
                          '17238','25899','69018','56352','86733',
                          '39357','43574','25626','79118','88967',
                          '10835','32018','61100','58685','91422',
                          '50837','78883','23808','38486','57539',
                          '61801','72073','79309','35393','63321',
                          '53642','30078','22881','85675','33709',
                          '89501','80526','36564','89768')
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


