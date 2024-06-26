
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
                          '22644','80715','14844','17130','46305','63839',
                          '13962','79437','84865','63866','47504',
                          '84718','50740','70820','18391','61454',
                          '77193','70673','88935','59492','59811',
                          '10705','52742','62882','27585','77398',
                          '70191','54747','31977','35226','43643',
                          '10552','45008','26855','94780','99454',
                          '67620','27500','83935','66740','37991',
                          '46166','89823','19944','71840','77504',
                          '46400','86302','55538','36137','72032',
                          '44663','13443','10275','40476','70392',
                          '87368','52453','77832','39236','48732',
                          '73640','77919','14921','17069','54566',
                          '66891','39732','34755','58417','36479',
                          '68569','85267','97023','67474','39726',
                          '73147','73779','64652','73680','74962',
                          '81414','20600','73075','70979','19201',
                          '13549','29159','63175','92943','16731',
                          '70008','99486','29166','99213','81492',
                          '36450','48255','30383','48622','44474',
                          '32620','38437','96625','17965','81323',
                          '96476','58718','40135','85467','92424',
                          '54872','24504','75314','45749','35222',
                          '22730','48853','91679','25859','82438',
                          '77513','84848','93705','12614','14434',
                          '17088','12906','13639','91850','25284',
                          '29973','74840','52758','76992','83814',
                          '89416','77695','62406','50306','34530',
                          '54953','46233','30211','92030','32190',
                          '84856','27834','57538','89995','69734',
                          '99323','76791','31226','67976','76438',
                          '91955','25716','63904','50487','22284',
                          '97000','51973','87078','66320','51779',
                          '68167','56585','25617','56428','59940',
                          '73501','81736','89083','56719','53887',
                          '40865','45701','63138','30806','64623',
                          '12395','59482','86516','29986','14566',
                          '44269','44457','99529','46546','13571',
                          '68028','22056','32329','29489','39852',
                          '16703','86856','25066','36657','63328',
                          '92861','94815','88562','38056','77762',
                          '31616','48803','23634','72717','97964',
                          '69773','99516','79554','50529','46536',
                          '62635','55872','81753','67001','89261',
                          '41610','80171','51663','42472','69807',
                          '75450','38933','56721','59596','48874',
                          '21311','67932','47893','64752','22080',
                          '79537','47754','58018','43650','11672',
                          '32459','29525','45194','58676','49683',
                          '79400','29343','12296','42699','90999',
                          '64204','26404','40423','98588','93772',
                          '46654','83192','14595','19362','55857',
                          '99815','10555','28592','93389','77094',
                          '37184','20619','43918','96716','57639',
                          '54286','68503','25059','84795','86031',
                          '75034','56167','55257','69349','11411',
                          '79665','79832','13817','43677','78535',
                          '43957','44778','59305','65727','42119',
                          '41300','78430','40776','50324','17031',
                          '61524','46711','37381','20247','62534',
                          '79789','69258','88588','51266','90263',
                          '90368','47591','32361','34926','79610',
                          '24928','92908','64041','41734','24580',
                          '80864','34221','55616','17969','54695',
                          '73987','52693','30633','87384','12968',
                          '55218','92684','61171','15203','53713',
                          '29171','62797','67148','77250','64372',
                          '18297','79612','39386','17863','25480',
                          '64224','12137','42966','23542','87455',
                          '62688','36527','64839','31755','69620',
                          '26431','84415','85933','88154','41703',
                          '43351','68584','77341','39031','17822',
                          '46319','86078','84912','57088','22863',
                          '56047','63387','71936','16214','92164',
                          '50538','22844','68014','35584','78498',
                          '22192','34482','58909','90043','41759',
                          '44690','94243','85902','36189','95749',
                          '11819','91125','48541','24769','71728',
                          '82028','39567','79561','76408','68042',
                          '31509','70298','78346','32552')
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


