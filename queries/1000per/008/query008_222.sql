
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
                          '68707','56657','13555','76343','70848','24540',
                          '50425','50507','20707','76438','73551',
                          '70920','42780','56476','21238','20392',
                          '36659','87526','25487','99438','79014',
                          '86936','73156','92707','89913','86330',
                          '17913','20838','61111','87948','84410',
                          '21633','61221','28964','37782','94526',
                          '38753','64536','62371','62035','67703',
                          '57587','43170','73175','57136','38249',
                          '69674','44746','51331','19846','62446',
                          '60580','29173','84708','62651','57842',
                          '30405','97745','22183','17698','27744',
                          '28778','70227','30271','90989','15514',
                          '54516','52943','23902','12389','86845',
                          '74796','71543','89123','10935','38974',
                          '83935','78300','35773','33609','58972',
                          '10974','39664','29476','92261','15365',
                          '75583','34183','81118','10642','94149',
                          '48385','39896','53569','76569','68820',
                          '40713','39973','68791','70761','45827',
                          '82243','69689','27682','55859','32504',
                          '27795','75966','79682','85766','15108',
                          '83123','44884','72054','40260','10623',
                          '55260','16578','76629','35714','10592',
                          '11280','58414','93913','24039','49696',
                          '43311','14436','53548','31413','70736',
                          '75984','17018','71119','82076','18827',
                          '51676','34193','19389','75148','58008',
                          '52542','60840','78512','75131','72974',
                          '32527','97117','82786','66973','69384',
                          '15677','11329','68549','10876','52996',
                          '52191','42674','89713','16973','71225',
                          '19862','12740','35001','79204','48785',
                          '59410','33313','83496','85567','27510',
                          '39311','26084','38290','27380','44224',
                          '25113','51411','34748','88323','12894',
                          '11313','76791','88301','38803','15316',
                          '91171','45079','72034','77509','34893',
                          '66205','65341','43061','51782','11246',
                          '42625','38010','37263','83619','60291',
                          '69783','69301','24085','86147','56352',
                          '62605','53437','13780','33020','61448',
                          '54305','21461','84951','31815','59945',
                          '51990','39588','21281','87632','98003',
                          '91591','56556','33895','60249','83721',
                          '91068','18991','43200','58071','64053',
                          '28793','28097','14518','14956','90452',
                          '32278','29425','76000','39213','84193',
                          '66109','17401','74326','76400','68816',
                          '64406','50111','59198','48458','19024',
                          '58924','28494','10560','77470','25780',
                          '44162','92241','14525','64388','15236',
                          '95346','36282','57452','58049','64629',
                          '32232','73872','16638','88581','51318',
                          '91121','89023','38360','30065','65907',
                          '87208','90289','95548','15882','66726',
                          '36083','95868','26125','28682','26351',
                          '58587','72139','79078','90552','85082',
                          '46627','65056','92143','97673','18692',
                          '21159','21156','60113','80718','69558',
                          '80903','87733','41983','77999','34028',
                          '60503','46453','80053','79461','10476',
                          '87916','93764','67943','43156','10680',
                          '81936','82858','97510','31924','26477',
                          '51215','39977','54667','31604','75814',
                          '77030','95797','85986','54129','61123',
                          '10523','76256','26007','83766','37817',
                          '56137','81145','60373','44975','17657',
                          '38031','48731','60924','14800','38509',
                          '47097','57129','44667','50468','65265',
                          '33739','85153','51349','73948','29140',
                          '41012','21676','99905','63189','11528',
                          '45425','73937','40447','61992','97767',
                          '45889','99903','26121','53908','30900',
                          '33567','65766','56426','21758','28026',
                          '84868','82861','70234','93263','58183',
                          '57029','42397','51535','30768','63253',
                          '49959','86906','96858','70949','31243',
                          '73960','70505','69188','64491','91944',
                          '77036','18590','79379','78675')
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


