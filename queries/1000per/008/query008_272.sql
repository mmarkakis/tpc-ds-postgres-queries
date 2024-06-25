
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
                          '51061','71100','75833','77662','17920','35570',
                          '14597','49307','46548','54056','71547',
                          '79766','48208','51503','61753','66344',
                          '17963','96431','19149','60286','12420',
                          '19046','23588','84707','88135','36433',
                          '73796','92731','53587','56163','90493',
                          '66392','21465','34617','77394','20008',
                          '42825','89495','92292','13210','31018',
                          '89186','90385','26862','93358','44589',
                          '21741','48713','46645','88421','68000',
                          '24563','40448','34065','11096','41605',
                          '66574','35688','59998','39738','76338',
                          '74923','24668','55315','55421','97906',
                          '33808','63129','32232','37824','84596',
                          '39521','50196','93424','49470','19186',
                          '43034','25270','83039','56950','50333',
                          '86951','10441','29853','12588','90059',
                          '80736','93399','40049','70633','12712',
                          '67783','65014','90517','60539','79527',
                          '51744','99246','29512','36617','11246',
                          '37957','67641','43645','74466','79285',
                          '94432','96765','92073','18850','79459',
                          '10344','81610','52131','77500','64189',
                          '12920','68666','34095','94451','34215',
                          '84476','88158','51539','38436','21725',
                          '83936','36609','68895','69390','68672',
                          '40333','30128','67648','35137','61087',
                          '62062','10459','23670','86234','79131',
                          '97727','40594','52591','30537','52654',
                          '22776','31304','71041','13106','74154',
                          '97217','38844','73893','73389','40878',
                          '25202','60532','70008','38643','82908',
                          '33233','78129','27564','53340','81900',
                          '18835','75998','93308','68209','22801',
                          '87566','38729','16573','72668','10146',
                          '75029','44661','10350','99212','65639',
                          '78570','32977','91125','32963','38527',
                          '80672','21358','18871','73202','24995',
                          '57692','15991','95281','10305','93360',
                          '60932','74915','40431','12556','55039',
                          '98929','48803','52288','82877','87911',
                          '99282','26836','50423','44531','37746',
                          '67482','44683','64754','11901','27090',
                          '36139','75980','10569','84127','60623',
                          '98932','44013','43027','88415','33093',
                          '19722','96380','26461','64045','77628',
                          '18841','18760','65824','35477','51731',
                          '64874','90226','59906','26890','40140',
                          '85522','90871','54674','85939','64305',
                          '89354','85382','32606','17101','71440',
                          '59634','67973','36458','49624','50586',
                          '70373','43575','15085','74362','91309',
                          '89526','15429','83909','83709','73232',
                          '49790','32938','18617','20482','42307',
                          '69256','68340','38705','51433','62817',
                          '54553','44843','10069','25199','48806',
                          '23857','50344','53032','48323','87644',
                          '29382','83779','31489','39389','98584',
                          '35157','10672','58902','84849','97464',
                          '83573','48825','37737','68777','97474',
                          '24836','22477','35511','93046','34016',
                          '65603','50939','21586','75353','11085',
                          '23581','75056','13238','91038','58101',
                          '65411','25776','24275','92885','64319',
                          '70216','70313','64359','69721','21507',
                          '57643','60530','50982','23859','18028',
                          '39152','32790','65689','52734','89396',
                          '17301','21821','35996','88886','45588',
                          '96178','57374','25913','56000','26896',
                          '22864','80649','30524','27593','61360',
                          '25247','45029','33828','26233','74549',
                          '53029','39055','16075','46572','75295',
                          '78336','57127','19711','48167','81112',
                          '18372','96433','35100','83975','95328',
                          '56717','36837','92204','89746','95867',
                          '47117','78962','96854','19661','76580',
                          '52682','80615','32085','81358','38697',
                          '40730','88144','85469','59637','50191',
                          '95510','18300','95711','93805','31373',
                          '86341','33353','54124','58467')
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
  and d_qoy = 2 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

