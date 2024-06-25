
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
                          '53690','38290','54179','73207','10745','58490',
                          '28883','71845','67425','56001','25829',
                          '76646','81733','76472','43959','36568',
                          '32734','89735','41163','68516','39448',
                          '61021','15843','90851','79548','56416',
                          '17199','17514','64039','12514','94805',
                          '45965','85224','36003','26954','92097',
                          '43297','43032','17057','23136','66657',
                          '96170','81461','33256','61379','43963',
                          '75281','58928','54520','77931','83159',
                          '41840','75139','46365','20896','95185',
                          '20738','61866','63842','60113','77022',
                          '66036','48828','29740','24631','49409',
                          '42806','11856','29112','92341','76883',
                          '77050','23767','41033','71245','52639',
                          '90586','26155','72036','97661','31102',
                          '10737','67192','47048','81245','81039',
                          '64207','43231','96735','37202','73082',
                          '75084','76021','65006','35180','51718',
                          '89495','72222','37961','32295','74578',
                          '31947','72687','25385','12629','20442',
                          '93315','11919','82876','14773','84116',
                          '81257','81338','40946','82409','26472',
                          '36581','92365','71694','38077','53897',
                          '62490','94318','54226','16893','30308',
                          '67429','81915','56741','79982','95602',
                          '78260','84060','81483','26628','91972',
                          '56407','72580','21090','96827','47191',
                          '39726','68741','72863','40797','88300',
                          '91549','56546','62224','53870','56120',
                          '57075','73112','88292','26213','18340',
                          '62122','66242','37792','84570','46392',
                          '94177','57078','83189','45787','23285',
                          '98487','35655','22937','45524','78947',
                          '77440','81250','25196','70118','81129',
                          '31169','99933','58149','28423','44895',
                          '54177','16562','54094','73524','54060',
                          '83380','15984','78720','36191','94167',
                          '11648','57600','92342','59808','86537',
                          '39309','29359','76148','31604','59227',
                          '77539','36452','39087','55859','35301',
                          '27517','90815','88544','86960','35453',
                          '54366','47464','90111','49375','47890',
                          '91295','83686','73673','63596','40653',
                          '19509','27414','37362','66140','65374',
                          '87147','82663','32585','70992','87276',
                          '94472','11106','75285','60141','55313',
                          '84326','76960','32128','32737','49863',
                          '94010','32698','38985','86264','95020',
                          '24241','34922','78661','79313','76863',
                          '91825','62800','28723','81726','16117',
                          '22656','27495','42759','69333','47505',
                          '34568','99489','42699','58978','96395',
                          '49246','89427','60673','47417','48580',
                          '99136','37200','28816','85812','98831',
                          '14074','85597','73101','95317','52487',
                          '61230','37911','50296','65582','66196',
                          '29370','85756','66121','85315','33559',
                          '33942','72570','99532','15197','70294',
                          '83226','41970','55744','73419','67972',
                          '29836','30349','55783','85314','82993',
                          '27042','72663','85808','84509','48162',
                          '77777','61538','32323','21335','49504',
                          '89746','37793','42557','98358','43289',
                          '17522','21293','85178','74669','87607',
                          '37728','48284','78983','68096','36324',
                          '87648','65592','57799','12330','34272',
                          '62494','76781','51709','47084','57189',
                          '82263','63705','13723','43813','72495',
                          '40846','88398','82989','28687','66395',
                          '13097','53179','53722','10755','51882',
                          '76839','71349','48300','49238','41762',
                          '59167','56921','30027','81004','43013',
                          '64952','12353','56328','25863','15375',
                          '94900','36793','49408','27342','45134',
                          '67763','68386','47739','29306','28582',
                          '52453','52751','96970','33466','80541',
                          '34369','79764','88601','16869','88820',
                          '44694','78451','32000','52373','72432',
                          '14591','49172','55828','79323')
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


