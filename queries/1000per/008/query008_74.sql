
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
                          '78441','72382','18105','50682','97147','78994',
                          '31782','13006','10123','50295','21322',
                          '15083','20682','63961','97313','94049',
                          '37667','24141','76254','95004','42577',
                          '40587','50134','31057','89831','41359',
                          '89504','69163','49358','66572','45414',
                          '30280','51112','82407','35591','76164',
                          '43503','10796','29040','35485','26376',
                          '82902','50233','10483','52132','59409',
                          '37442','97261','10312','43918','60155',
                          '52827','93749','81437','47138','28389',
                          '86617','98892','16297','77337','35177',
                          '34678','85682','32694','68535','75593',
                          '95872','68583','74372','29894','44325',
                          '63428','88159','17101','48877','84145',
                          '21894','95639','64952','86814','38151',
                          '32831','22007','20483','61930','30073',
                          '34424','66307','88626','69883','83776',
                          '35989','60018','97328','17514','90096',
                          '99857','14767','72161','96549','56794',
                          '99561','82863','11017','25706','95421',
                          '85037','32173','36737','70054','78628',
                          '85034','24556','73051','72716','95619',
                          '72356','14870','30780','93637','48898',
                          '18191','91797','95671','57426','97776',
                          '29759','99260','63523','46211','10019',
                          '34080','53240','18354','57288','93246',
                          '23733','10772','33786','31742','61169',
                          '76159','31179','80334','18666','52218',
                          '15761','29687','23883','66243','15052',
                          '40153','28629','53317','74122','90668',
                          '30659','92625','31833','64338','12210',
                          '55964','36332','62827','77980','10698',
                          '78661','59057','44526','44520','27553',
                          '92589','67896','69544','13914','53345',
                          '77265','12834','21687','84805','60999',
                          '95600','84352','79482','53378','83204',
                          '75023','84929','97309','41264','21378',
                          '86859','65625','35028','44729','21848',
                          '22247','26236','23695','54360','10628',
                          '41959','35497','25867','20418','26251',
                          '73613','72515','22709','95431','82129',
                          '88534','71256','68638','89281','20808',
                          '75712','92292','80910','24144','90554',
                          '73141','25863','84322','71844','23485',
                          '30113','16374','82403','83819','10696',
                          '71196','45228','52317','17875','64325',
                          '11203','73747','88388','84940','82459',
                          '24509','59219','51733','35153','63883',
                          '36176','59768','39477','17184','56407',
                          '84734','81438','25216','89382','11252',
                          '46898','56156','28074','44478','32942',
                          '36541','51169','49263','72209','84568',
                          '57888','39139','50994','58635','14533',
                          '88049','81226','53416','41349','99825',
                          '57318','54907','68324','32747','51094',
                          '78624','13294','90634','59960','79578',
                          '17737','34507','99447','19035','87912',
                          '97484','81477','45055','28046','10852',
                          '38420','22673','92555','37703','88331',
                          '10087','93581','66890','89034','10706',
                          '35144','97857','32045','82544','82969',
                          '22647','33414','72164','38462','36202',
                          '65609','79799','56363','29020','96826',
                          '24006','50099','49726','58911','82531',
                          '27159','65892','13038','44884','84387',
                          '11043','65130','33950','51106','21736',
                          '76986','66218','73683','36437','34739',
                          '83020','74431','32154','77347','41237',
                          '47605','19298','69787','98181','26119',
                          '30682','70022','85377','80824','28663',
                          '43318','53118','23591','83906','40971',
                          '50761','30641','77153','16133','83816',
                          '84582','81977','57651','19635','26364',
                          '69322','81390','85606','40122','25855',
                          '84469','52056','71292','36923','88038',
                          '12728','58799','37032','62399','28245',
                          '28442','25472','86931','58750','98180',
                          '55811','90674','27798','12031','26764',
                          '61056','22268','14114','72386')
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


