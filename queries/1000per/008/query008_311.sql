
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
                          '85856','58735','88515','93440','11267','44486',
                          '22480','26079','94976','36893','39094',
                          '84765','18318','74949','76636','37610',
                          '83560','64312','67284','44527','98260',
                          '70553','76050','32877','12943','58886',
                          '95494','19568','80124','67052','85009',
                          '74577','83554','20752','16868','23051',
                          '11466','38840','84973','77463','77753',
                          '47080','51967','90007','96561','17885',
                          '95510','63196','29516','92993','14492',
                          '34466','67091','44046','52790','70834',
                          '32840','20549','93054','30133','26316',
                          '33867','18287','62619','27051','53092',
                          '56574','29248','40194','82112','91953',
                          '62200','19000','51884','55166','69937',
                          '61141','55345','52824','89823','60154',
                          '66503','29790','23882','11964','11191',
                          '15002','15788','48347','95470','29107',
                          '94207','97997','96864','66864','93912',
                          '61469','19655','30918','98711','45304',
                          '67578','75241','60670','29454','39344',
                          '36417','82633','43955','72132','21311',
                          '50755','89895','89358','97921','61745',
                          '42002','43351','62929','32169','52713',
                          '78337','18752','68624','58858','91809',
                          '95958','35335','43576','27632','71459',
                          '25038','99989','74286','15649','30658',
                          '49362','99453','93391','39499','62996',
                          '13904','39502','98569','74835','79463',
                          '18784','68129','43724','38740','25046',
                          '13951','84771','14438','91628','49318',
                          '59032','11264','72264','65189','15342',
                          '84410','64181','70605','30075','33654',
                          '57371','65014','34206','22186','54974',
                          '91729','65186','95306','47756','86236',
                          '23149','11979','78031','88850','53030',
                          '58658','97063','99647','91508','34690',
                          '19167','68948','76592','94606','47706',
                          '62436','64187','11128','20609','93314',
                          '98723','74817','20419','24500','14811',
                          '94710','67361','92269','66436','98041',
                          '49294','11552','52150','39694','72497',
                          '14389','65713','28918','51032','93192',
                          '58004','66098','77666','58770','34576',
                          '92154','14316','55632','13653','16198',
                          '85549','59777','83904','13352','18097',
                          '22610','57190','11000','62334','44620',
                          '63170','70804','16473','81785','89991',
                          '37750','30731','52753','90096','61756',
                          '12421','81721','32015','55270','15989',
                          '26354','97255','77931','68419','61338',
                          '38513','16756','17185','66251','31392',
                          '72443','53696','55502','38163','83504',
                          '62990','14910','35203','82128','92567',
                          '66161','43214','22723','19005','14836',
                          '17655','26197','21991','56995','61917',
                          '80993','63538','75431','46803','16771',
                          '90926','76900','69024','75150','74572',
                          '71787','80811','61828','63028','56198',
                          '44894','36786','56576','84567','29043',
                          '29499','48249','44784','68662','96639',
                          '15488','96751','35680','88330','69853',
                          '92813','81400','60381','58975','55158',
                          '58578','94067','62894','96137','22742',
                          '36131','52873','69440','92614','77914',
                          '12247','56131','12716','71263','42880',
                          '11147','45875','50110','82168','94986',
                          '57450','69374','45160','27671','76738',
                          '64245','29005','24771','80004','13544',
                          '68148','90841','23878','83034','89131',
                          '19395','57459','39924','30429','78668',
                          '51385','91527','34018','71863','20231',
                          '28885','36144','18468','32853','76537',
                          '89984','72716','24418','98283','37463',
                          '79409','73220','59322','38663','36785',
                          '10080','74863','62043','89394','95974',
                          '86584','87139','70442','32423','53574',
                          '19610','51363','51201','77725','20144',
                          '56677','22049','70220','80793','54455',
                          '13842','48006','91415','43564')
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


