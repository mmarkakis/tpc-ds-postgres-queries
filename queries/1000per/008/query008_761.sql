
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
                          '70765','89477','69974','22792','35724','37169',
                          '66253','53449','54601','33534','69692',
                          '40098','88138','58514','16317','74324',
                          '12364','99717','54259','43583','40519',
                          '11522','47511','34816','88714','15095',
                          '38075','71104','39993','24454','62796',
                          '51004','12431','90305','96037','14755',
                          '43901','29256','33413','47682','30664',
                          '27150','90605','73672','29978','71234',
                          '51534','88613','48929','84886','20167',
                          '97840','12754','31953','79281','30768',
                          '40599','73546','62129','45724','48905',
                          '13817','85999','90665','35106','39645',
                          '91184','64362','12039','85491','42707',
                          '68986','75732','63567','93643','86663',
                          '51758','65574','50404','92520','92733',
                          '20949','91260','84302','71912','11068',
                          '37217','45421','94492','56056','39835',
                          '95554','19330','89137','79264','21116',
                          '83049','61176','14850','65408','19210',
                          '82617','55288','31533','18767','12083',
                          '40781','99663','57012','29625','44227',
                          '62393','39759','72422','27656','69953',
                          '41108','99785','57891','28758','14672',
                          '89996','31034','96939','40967','73414',
                          '75745','69461','46178','56784','19434',
                          '75751','71749','87712','66781','39876',
                          '28439','89272','87215','24997','80601',
                          '78025','20008','82475','45967','44355',
                          '24415','54954','56939','29614','78792',
                          '79140','60903','26471','92378','71366',
                          '80233','82044','64656','21570','11773',
                          '53536','10559','79481','66567','77626',
                          '63682','10232','34120','33395','39704',
                          '44424','34819','44174','40301','28378',
                          '37542','52235','83259','88485','31753',
                          '38015','43451','56439','79075','16700',
                          '25274','76231','58972','16281','20190',
                          '83056','93976','53751','33399','21227',
                          '17234','93455','44853','67129','28557',
                          '24101','23408','71569','98975','37689',
                          '88413','91782','61529','18399','51101',
                          '98833','27052','52987','97106','77330',
                          '78905','83082','67403','36959','29697',
                          '92341','39117','10065','30942','16426',
                          '37815','67051','90527','46145','69700',
                          '93280','19956','54113','35029','87054',
                          '82279','39806','28166','92033','32315',
                          '68391','21087','81509','89660','90924',
                          '97944','88456','69470','53191','87345',
                          '91452','66820','27847','15612','13821',
                          '19603','93566','44017','55380','22867',
                          '31393','70589','38169','31514','58221',
                          '67067','29701','21219','15372','26800',
                          '91145','57404','31707','71246','71334',
                          '24958','51465','11947','18357','68966',
                          '79176','51128','87541','18317','15175',
                          '50677','99458','19181','10142','48831',
                          '98316','52843','49133','39712','87597',
                          '99140','29675','14644','58568','76064',
                          '73409','18414','20216','54422','67917',
                          '48182','92436','93256','38165','83270',
                          '45945','39908','31142','93349','29246',
                          '36127','27464','29444','67760','51347',
                          '91393','71684','70302','50696','74485',
                          '43083','68907','89316','38832','20253',
                          '57122','48954','20458','69249','72154',
                          '21648','53443','92989','30466','76540',
                          '59938','96474','75680','89788','79867',
                          '59047','94081','14984','46995','61919',
                          '38525','60606','56277','91919','57354',
                          '86037','86036','46008','77830','40875',
                          '75041','12407','51999','96648','91147',
                          '77151','95680','76352','37982','94033',
                          '91438','66531','57680','22595','61985',
                          '79619','61922','68412','98071','80511',
                          '92995','55202','97020','29393','72281',
                          '18298','91445','10004','19769','34165',
                          '59851','15549','32951','69044','93580',
                          '23791','74985','38254','89372')
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
  and d_qoy = 1 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


