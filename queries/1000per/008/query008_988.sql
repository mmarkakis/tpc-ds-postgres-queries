
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
                          '40388','74109','86311','75482','23492','71768',
                          '76485','66946','33470','60348','73420',
                          '71308','24941','63312','91543','19902',
                          '86315','15742','44313','99191','11038',
                          '28910','95695','89404','33248','94437',
                          '77431','34423','71325','91247','56270',
                          '32495','92441','35284','78643','47157',
                          '61692','17202','42869','78444','28703',
                          '60049','96072','91413','20431','91681',
                          '10921','75264','49524','89881','36331',
                          '92581','97600','44441','15136','13773',
                          '13827','12688','33280','58670','20870',
                          '60095','86387','90764','17829','38241',
                          '66494','75977','64737','99622','29384',
                          '73347','73274','41147','91801','80918',
                          '62319','92506','20528','98648','13582',
                          '44912','57175','63331','75215','54140',
                          '11951','82949','22702','72468','24852',
                          '82968','46903','71146','37222','73518',
                          '75632','69415','88651','32548','59645',
                          '62022','63865','21626','35316','48054',
                          '50213','91796','73778','83906','30946',
                          '86382','34232','27190','36074','10581',
                          '85829','82192','10882','82572','76097',
                          '28162','22475','26945','40887','62244',
                          '68395','55249','85693','59601','70034',
                          '43328','56301','49261','95642','37581',
                          '32296','98343','30868','67671','35119',
                          '30960','67978','25564','77428','32608',
                          '41352','80507','61235','38293','31347',
                          '58928','83943','64466','53764','98604',
                          '66867','62186','95027','17966','34642',
                          '92129','76681','47898','54613','87280',
                          '86492','36169','61542','89050','97230',
                          '83827','71605','89103','29738','50746',
                          '19181','65380','96130','81786','87391',
                          '11891','36718','34143','94868','73837',
                          '67444','51793','30035','37820','94714',
                          '93752','89167','94863','65245','97908',
                          '52244','98749','69605','35335','79276',
                          '87104','71354','36818','27368','19076',
                          '65775','59124','17990','59784','40783',
                          '93178','90371','87400','30981','58655',
                          '68493','97154','47893','24001','61732',
                          '80366','43628','93952','54093','21777',
                          '23516','33327','45163','24499','99454',
                          '25519','23313','35731','89649','61205',
                          '34849','75098','61750','70937','42859',
                          '89845','64217','40519','35420','18710',
                          '38543','75799','20090','83802','54578',
                          '73497','65242','89015','17415','83653',
                          '79504','74712','77594','40186','35002',
                          '82519','15438','20456','58445','95690',
                          '97859','11290','13167','92168','51137',
                          '80448','55355','59986','38040','59953',
                          '54500','78180','65694','90008','13164',
                          '39158','93990','15980','81422','67476',
                          '12499','56811','30174','25969','48445',
                          '79484','77135','64994','43281','82683',
                          '24860','91148','87815','62447','63053',
                          '47264','90835','78464','57840','68185',
                          '55629','90257','29086','57652','82257',
                          '13340','58149','34475','31178','89773',
                          '63009','24035','31170','61990','55906',
                          '44089','77941','74092','52757','84305',
                          '84064','91308','10503','14760','25338',
                          '59914','85917','59399','69655','48517',
                          '10486','59888','97525','45987','43625',
                          '79161','87243','70157','69696','24140',
                          '11030','66209','34680','31838','79356',
                          '80977','29367','60679','96410','47034',
                          '29955','23927','95700','10495','61252',
                          '68718','70049','19277','52787','34224',
                          '62810','79443','27440','22743','67127',
                          '24932','14446','19149','16193','53359',
                          '63627','27157','51425','49930','26852',
                          '36570','54963','14131','73287','60259',
                          '85167','88971','59800','84552','75239',
                          '27876','91210','39751','24090','91430',
                          '53028','45613','16354','42944')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


