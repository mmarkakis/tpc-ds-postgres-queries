
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
                          '58429','31306','14157','47306','75149','12839',
                          '75532','48757','39115','16744','13125',
                          '35128','90486','43252','41137','54728',
                          '29832','38705','69723','91738','90181',
                          '20423','28615','50660','11255','55614',
                          '90643','90787','82730','56298','68394',
                          '21504','13966','55062','61987','41058',
                          '11864','83334','23334','17337','64571',
                          '62058','38789','94851','98140','99801',
                          '83362','33633','81640','15802','47042',
                          '42583','66110','66940','54545','26923',
                          '79848','31795','93192','53169','36976',
                          '50049','53536','92425','28875','89164',
                          '36654','22637','67517','34012','36764',
                          '64578','36884','70607','15590','81100',
                          '80327','67530','67708','78145','94417',
                          '51344','18891','93065','49322','16739',
                          '82268','90387','94432','34948','61008',
                          '85021','33644','92048','22881','70915',
                          '44925','77870','51055','34059','19079',
                          '16722','83720','14962','26945','57261',
                          '55095','20762','47668','42716','16087',
                          '59581','13836','61109','98211','30235',
                          '41310','51942','64445','38479','62415',
                          '16974','67902','37661','72809','99014',
                          '18908','26716','25573','12729','58538',
                          '75629','26988','30721','99941','85802',
                          '38655','49581','60802','50320','38348',
                          '33302','35526','31013','34901','59888',
                          '48048','28492','90680','86309','45252',
                          '17823','84264','59048','99757','35359',
                          '51227','54483','23780','59743','18168',
                          '85134','37653','58371','25475','49708',
                          '81177','61060','73422','78683','89365',
                          '59916','14923','41268','91422','70251',
                          '33767','86108','18590','37757','74956',
                          '69714','97734','96572','52009','65401',
                          '92438','53083','94905','39473','89359',
                          '27388','93843','84216','70587','95561',
                          '55545','65638','93251','44965','10738',
                          '78019','52157','90404','29340','75447',
                          '20921','26214','76474','96659','94411',
                          '22069','85444','64957','91533','17674',
                          '87569','40666','49696','79549','55097',
                          '60381','11831','27252','24786','37070',
                          '92063','95227','18407','23461','36002',
                          '48078','75757','63079','52811','26307',
                          '53507','89220','72211','42780','11735',
                          '99605','44778','57806','66700','90807',
                          '96704','64840','15656','80663','39382',
                          '30554','95893','19346','93380','13881',
                          '95966','14390','38816','29014','93201',
                          '77060','88410','30293','82574','86629',
                          '51501','88182','42873','23467','38646',
                          '38374','40003','90967','46451','56048',
                          '43849','67213','15554','61954','94557',
                          '69752','43800','32176','46227','95355',
                          '86941','39984','61328','45354','29592',
                          '24233','45513','68543','76954','92448',
                          '74708','54257','27058','43228','89269',
                          '26351','16881','33813','30904','38717',
                          '89686','82505','57783','28555','48495',
                          '34496','47684','17384','31021','33571',
                          '28202','67690','72444','85355','67889',
                          '48929','64030','10996','68937','83005',
                          '97945','79746','33798','56825','71435',
                          '32150','25732','81339','72422','71901',
                          '11551','26852','76176','37457','84565',
                          '26372','83003','79803','14175','80769',
                          '25531','13814','68926','26558','39892',
                          '34557','53474','25447','42964','15655',
                          '96689','93333','10957','93369','45141',
                          '53744','31165','81772','17977','57409',
                          '99193','82707','59442','71597','35547',
                          '39179','88714','68870','53005','59761',
                          '63076','58142','45685','55965','59646',
                          '26227','83186','19234','92694','76171',
                          '82805','85212','16003','47912','34863',
                          '97935','12781','19309','91829','57564',
                          '70726','10664','96249','46886')
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
  and d_qoy = 2 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


