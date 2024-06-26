
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
                          '18378','52804','96859','60231','90158','96459',
                          '41249','28273','91517','37654','13360',
                          '83767','88323','37690','63441','27590',
                          '34228','21633','65821','83319','41679',
                          '78354','18486','45751','35090','71428',
                          '22125','29722','22946','74867','54200',
                          '49449','71390','41638','28805','85185',
                          '61744','37402','44104','19140','95820',
                          '99115','85350','91488','77042','38310',
                          '12978','16376','86453','61977','66051',
                          '89932','39278','39011','88777','95637',
                          '59639','39873','46264','81524','75094',
                          '72006','90501','14126','57526','34608',
                          '40772','58047','22806','77961','60033',
                          '10664','82491','34612','14088','36890',
                          '83714','51120','69534','62304','83422',
                          '62015','11698','31958','92742','41256',
                          '59574','39247','87707','44700','45869',
                          '31562','22899','18794','90862','15297',
                          '49239','22664','24901','35778','47662',
                          '75944','96336','25054','14120','78766',
                          '32175','57316','80145','73792','80908',
                          '84992','24225','14053','28079','77870',
                          '82135','60547','43724','14390','75468',
                          '18368','49904','76441','89965','27758',
                          '66661','39480','29998','24760','89543',
                          '91783','97407','95743','97597','22536',
                          '72058','77023','12612','73208','13543',
                          '49367','80708','20345','14656','14130',
                          '89145','19750','59636','48160','61071',
                          '12447','58481','20464','88427','90763',
                          '31700','52640','66904','61608','72871',
                          '39004','72902','18821','76296','55231',
                          '60209','93581','37438','91961','80528',
                          '37249','87225','88962','73029','11538',
                          '14517','87228','57232','13650','57690',
                          '92413','83209','64108','58227','19038',
                          '46213','93725','99660','38408','84958',
                          '66062','68408','44117','67241','56851',
                          '60422','47684','66270','85587','86967',
                          '87545','64924','92070','68806','32735',
                          '90699','68166','93418','97325','73946',
                          '38059','27505','59075','43774','42962',
                          '23553','67775','91140','74435','63091',
                          '22192','43190','98743','68629','96806',
                          '23011','98669','86644','61282','76664',
                          '49844','28507','43420','37626','96260',
                          '83525','70854','17347','61457','30250',
                          '99332','18485','90163','81286','96800',
                          '84392','69568','85091','72426','28697',
                          '89158','37060','74871','34946','20845',
                          '67657','44905','50603','87658','63612',
                          '41551','15169','57841','79658','49970',
                          '32256','64910','29736','67230','23350',
                          '10642','85997','81986','86053','67068',
                          '13260','90761','61850','30992','21347',
                          '43457','55191','65375','72331','98334',
                          '66514','23425','24465','46713','84052',
                          '87696','55287','64795','50290','12518',
                          '21535','79975','70146','78327','47279',
                          '19133','87831','97542','22968','76744',
                          '18908','61645','51230','79037','86585',
                          '68059','98163','33130','64543','87507',
                          '17620','58048','21520','35021','65474',
                          '52117','84454','38497','38154','73495',
                          '37172','14171','61512','58895','86412',
                          '58557','16338','61691','79315','79475',
                          '48515','12595','68977','41319','47062',
                          '19670','77369','67317','80766','45045',
                          '68317','80011','64967','90203','22811',
                          '72452','70705','44633','72325','32456',
                          '25462','72957','51670','26171','43968',
                          '88644','97227','11787','40685','10624',
                          '88019','77390','50708','94802','11369',
                          '29248','89225','58562','70270','87663',
                          '94097','45944','86648','86023','71519',
                          '50373','55839','40437','52886','36135',
                          '63926','78687','13112','77465','75271',
                          '85983','50999','73325','13138','93620',
                          '73073','83871','29108','96049')
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


