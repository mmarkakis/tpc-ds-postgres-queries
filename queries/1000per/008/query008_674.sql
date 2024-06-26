
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
                          '13733','30175','77680','64316','38007','44559',
                          '81840','51134','93455','34710','22748',
                          '27598','70188','35041','12002','87448',
                          '43307','82883','56252','79980','82738',
                          '49521','48325','25493','65276','77389',
                          '46169','31471','18420','67724','74071',
                          '97452','65415','42471','88646','89831',
                          '37423','30609','75284','47849','20384',
                          '30018','67312','44057','98281','94132',
                          '68679','31592','89937','32971','91618',
                          '32887','80054','76016','29910','53588',
                          '60814','35324','81732','19168','29318',
                          '87739','56599','84649','21095','12557',
                          '50948','87721','83047','45681','90974',
                          '51433','94470','11438','12461','73075',
                          '90444','81076','59334','33771','61012',
                          '78019','59507','69313','27544','86633',
                          '58631','78498','90170','54066','33370',
                          '16228','63881','70804','35325','88790',
                          '69299','76506','37751','30868','47612',
                          '19289','53293','49733','56399','10271',
                          '91506','67274','63658','63529','42022',
                          '59754','56396','96271','89180','79516',
                          '12105','35903','31896','91056','31395',
                          '68118','96959','56496','57672','87584',
                          '37142','32511','14376','47015','94454',
                          '67540','66050','90573','92410','97811',
                          '97719','87552','81062','86312','56293',
                          '23674','18267','69617','11775','45690',
                          '14310','22787','57987','49072','88411',
                          '25915','43156','36297','53173','94114',
                          '88503','63891','56658','62968','27492',
                          '50085','93910','37959','45610','37735',
                          '40655','51937','85515','74837','72457',
                          '62881','37887','21708','93595','44934',
                          '27772','99683','32838','65053','24936',
                          '70618','14757','75464','76896','89834',
                          '86926','36288','51346','83237','84354',
                          '38316','28104','59101','59600','93526',
                          '78016','13525','56452','15281','38899',
                          '83338','65698','24970','30157','95763',
                          '44845','36385','36628','10520','45810',
                          '53406','63205','47526','66472','89083',
                          '80137','68495','92341','29509','91122',
                          '80228','68281','47372','20222','52547',
                          '86358','85138','78468','39130','44505',
                          '21436','90331','70538','98235','56375',
                          '24819','56662','44463','36998','35594',
                          '17408','89145','74020','67002','22648',
                          '47276','74987','60784','83828','12972',
                          '19493','40172','22679','27532','43122',
                          '32723','79080','49557','86621','22465',
                          '94381','36404','58655','25406','75267',
                          '60718','36542','82243','91383','15693',
                          '84188','78535','19914','58821','66122',
                          '85929','55770','97347','73736','33550',
                          '27168','98794','74387','66559','79608',
                          '71075','95504','48771','74380','52887',
                          '82759','83633','96359','20085','43634',
                          '28375','38913','58366','74926','84377',
                          '45539','82866','33139','78520','33719',
                          '47270','75100','11500','22471','33047',
                          '38516','13351','95194','33438','82051',
                          '79572','10733','30312','87666','11359',
                          '80664','29404','87644','54705','16740',
                          '56784','15668','47374','92499','20159',
                          '63421','45097','86646','18237','64256',
                          '35683','77370','58315','73974','24974',
                          '22198','43377','80118','53207','54279',
                          '97084','84585','56504','28995','63743',
                          '90336','47822','14479','95761','90946',
                          '63200','37991','33419','17390','78141',
                          '33783','55181','93559','79061','80150',
                          '91904','54319','57517','67535','16766',
                          '86037','41991','23072','78305','35985',
                          '29790','20988','29262','49514','70754',
                          '36635','71849','60015','79982','80892',
                          '64578','32655','76493','70624','41318',
                          '61207','24097','74642','60516','13159',
                          '55215','86538','90112','21391')
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


