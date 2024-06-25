
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
                          '64644','88248','59864','36237','87135','67894',
                          '26745','15523','45019','84937','24832',
                          '11991','59853','36333','44492','97515',
                          '82452','66851','65962','38417','20702',
                          '88678','26914','75089','43831','38566',
                          '51208','12486','54780','38908','96072',
                          '25337','10585','71362','13114','74398',
                          '46883','89711','66059','36714','80367',
                          '48682','90332','45944','24815','67295',
                          '96385','56852','53197','50163','10735',
                          '23807','93517','80085','67648','52224',
                          '46453','67485','51659','54025','65958',
                          '37286','83068','90881','50503','79322',
                          '36987','47081','58521','78924','30816',
                          '88697','93903','74578','38724','58322',
                          '77012','39282','28685','56395','46153',
                          '61754','50727','19521','56501','99577',
                          '88666','19838','62402','74502','62160',
                          '60529','58587','97541','25006','87833',
                          '49249','30203','47832','37558','70880',
                          '72549','97200','48642','24138','33410',
                          '95520','62431','52809','35345','92557',
                          '31768','40874','23258','63801','50331',
                          '85538','79379','29948','10162','33384',
                          '42962','36152','72204','90823','78733',
                          '85903','46508','48550','30729','63646',
                          '72635','40355','37135','40289','55397',
                          '84528','50850','88609','88126','31478',
                          '20491','23858','39809','66971','71835',
                          '26963','24665','47471','72931','54313',
                          '14854','93700','75631','10945','43430',
                          '19584','53717','67577','50212','96148',
                          '96074','54709','27098','85431','22055',
                          '94351','34839','20656','77525','17710',
                          '60716','29023','69676','70005','38186',
                          '45805','16453','40300','82281','26992',
                          '20211','79195','11643','98058','10267',
                          '31702','52486','73738','22097','19985',
                          '39856','72874','25384','12086','72565',
                          '75978','66897','14013','30519','28700',
                          '92467','91567','32802','30437','37206',
                          '75122','92275','12566','84846','31340',
                          '88056','14501','99741','66300','22421',
                          '13375','32908','79330','67313','41065',
                          '49515','12460','53768','67052','95463',
                          '28623','94155','56762','55860','26809',
                          '95385','28063','59693','94267','51311',
                          '92194','73811','66422','91664','26443',
                          '52191','98778','93272','14068','52156',
                          '26208','42298','62789','87536','83038',
                          '85396','98235','66869','15171','51211',
                          '16693','63713','91839','34621','29616',
                          '81562','63823','27916','16069','23011',
                          '24659','47977','61874','75899','14843',
                          '58433','42387','12576','82573','21239',
                          '54799','66403','25871','11646','46597',
                          '81970','30751','63502','31865','15092',
                          '40896','29114','84966','69300','84878',
                          '29204','25894','61133','91779','47705',
                          '38121','76754','24698','72855','77893',
                          '86496','64594','63547','52144','62832',
                          '15488','57540','79388','16579','87495',
                          '58634','86939','78852','38548','73307',
                          '96505','37481','73783','23269','42178',
                          '71376','75752','52134','73762','85667',
                          '52903','52360','84072','64872','53037',
                          '40453','78024','23397','37162','55927',
                          '43192','62451','45160','48956','58661',
                          '15022','56315','61742','90986','91182',
                          '30115','99067','84180','28188','35262',
                          '57385','72616','68106','19492','83177',
                          '47637','57555','24344','97413','40659',
                          '21132','44380','42594','99007','93048',
                          '45968','93572','82178','50582','62629',
                          '37615','70967','40858','94872','25230',
                          '27129','88677','15336','93427','20400',
                          '39483','79978','60834','79647','81544',
                          '19246','97560','41208','36703','67637',
                          '40487','48282','61886','21474','49293',
                          '73393','80817','67604','39672')
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

