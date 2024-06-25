
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
                          '35240','37466','91488','98160','62137','39578',
                          '32048','39384','41505','15937','79886',
                          '94563','63294','72361','44714','80216',
                          '55817','73850','73488','44006','83288',
                          '27036','65531','66583','14298','41718',
                          '52811','95017','96733','93553','72881',
                          '54829','96058','21935','75109','76264',
                          '28917','19194','48885','65725','54465',
                          '74327','78223','24173','66414','88875',
                          '94124','58256','60073','90222','93946',
                          '48904','97047','39809','62478','21833',
                          '19300','63670','59100','46703','18791',
                          '17710','97346','92117','95615','51279',
                          '33299','87252','19930','60383','26678',
                          '89528','85261','42662','44778','38739',
                          '10119','39600','33600','25166','57436',
                          '82873','71790','83963','21319','67520',
                          '91029','77121','69414','28124','59567',
                          '66534','74494','11609','20214','20202',
                          '48590','49139','32231','44704','50311',
                          '98969','25888','11797','47481','47923',
                          '50221','38976','20212','20355','60698',
                          '51019','72060','38134','38858','17627',
                          '14677','54144','80965','93501','15821',
                          '32144','21574','38272','39012','16032',
                          '27742','88621','87436','92313','81776',
                          '56494','20762','45638','50137','57319',
                          '70065','90221','42357','36690','10229',
                          '27792','78796','72214','63121','40964',
                          '57748','54041','60045','72547','90242',
                          '71689','58528','56637','26541','31132',
                          '50813','36777','56517','16634','19597',
                          '62660','68433','93142','67229','69742',
                          '40593','21442','96099','18342','44379',
                          '25146','77171','88418','96053','81535',
                          '40485','19821','65620','92400','62799',
                          '83068','97130','67924','82993','52401',
                          '52096','52125','87036','52836','95152',
                          '95631','66428','14696','59601','46361',
                          '84418','30539','94755','78992','94122',
                          '53502','19848','78420','88571','79395',
                          '41381','32551','95371','23996','52826',
                          '95413','23542','71478','62194','36985',
                          '43371','51783','55204','69560','85706',
                          '93764','77072','10305','84490','58166',
                          '47053','71784','23390','35917','38012',
                          '75958','44665','94593','13842','50941',
                          '18307','94179','37113','41963','11214',
                          '92461','49090','74416','31379','25443',
                          '75763','86866','49752','65072','70816',
                          '52113','54089','85906','40801','26766',
                          '84049','80879','30936','28488','94596',
                          '20600','36921','13474','17861','59730',
                          '12259','58062','99869','10871','94090',
                          '66753','10715','45608','66737','24675',
                          '84855','10234','73092','98400','35570',
                          '89568','87407','65093','81355','92608',
                          '84019','83065','10529','48552','43208',
                          '63240','75976','61874','47029','86362',
                          '46852','61255','79645','43213','87013',
                          '55283','71323','90352','15875','18165',
                          '77721','81201','67878','19262','30868',
                          '10437','31694','59618','52189','54248',
                          '55332','60164','71451','92642','92747',
                          '88036','16414','89918','85461','42943',
                          '69634','91086','53874','74333','47832',
                          '33509','75081','35100','40626','53521',
                          '70314','62329','52120','17452','54263',
                          '38646','45291','53002','16335','53424',
                          '25004','84433','48373','44550','52286',
                          '64453','26997','26717','48532','51422',
                          '58300','50739','37439','10612','70211',
                          '88069','21444','45393','31044','10230',
                          '40688','19960','75626','46688','45851',
                          '90110','73996','78364','33252','11674',
                          '55010','30255','84876','43400','89346',
                          '90832','83155','26911','10017','87753',
                          '24461','53108','23333','52594','34941',
                          '50431','51264','27783','38743','11439',
                          '35297','78027','21554','32653')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


