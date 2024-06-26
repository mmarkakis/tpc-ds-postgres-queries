
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
                          '67617','48947','22610','65617','85380','32865',
                          '99133','99699','17738','52715','59991',
                          '66400','56641','11630','57714','21537',
                          '37709','89874','93244','76571','91200',
                          '85254','70607','61729','67747','45146',
                          '58488','63399','65813','35363','50493',
                          '10156','54035','99411','21761','42672',
                          '43363','65277','89709','96031','72032',
                          '13608','82269','61846','68336','90531',
                          '12801','98393','84610','92082','56480',
                          '36519','79211','90194','43899','81025',
                          '94065','44838','97708','53577','44884',
                          '92162','83480','12101','45834','87152',
                          '51682','59804','94435','61283','17105',
                          '64068','35102','48467','73063','28990',
                          '84053','38919','85515','22987','71629',
                          '76272','32833','55381','60261','14416',
                          '23018','80017','36528','10396','45057',
                          '32583','79070','44429','18431','36327',
                          '63795','22962','67905','76542','32776',
                          '80763','67217','95094','51863','54724',
                          '36527','69135','62277','98770','19262',
                          '22145','10339','86101','45729','70864',
                          '18481','22555','10078','35058','32087',
                          '36410','57776','33679','25671','29750',
                          '55509','63420','29883','72823','68446',
                          '41547','15285','60124','95574','18205',
                          '58034','23570','84649','71202','87960',
                          '45337','36239','19372','66555','11854',
                          '99328','24400','88024','88930','40551',
                          '36846','19472','22745','83642','11149',
                          '90488','84178','50204','63207','78947',
                          '63062','45368','67300','36993','40507',
                          '47474','61630','93630','42004','87665',
                          '80158','40719','94887','49273','99926',
                          '38704','60562','48147','32216','61564',
                          '43723','84000','36623','84004','10427',
                          '36138','35439','19628','14099','41466',
                          '57540','14150','42614','35453','20206',
                          '24507','46850','11478','44011','99485',
                          '41559','10500','79616','20724','90435',
                          '53528','12433','22207','87871','29346',
                          '79741','16428','89389','20863','83538',
                          '66211','50793','86113','93178','18257',
                          '74720','11839','41332','40364','74023',
                          '98126','58643','17694','33014','50050',
                          '79804','85004','54109','93537','29918',
                          '50106','32047','58809','35517','77965',
                          '15326','43167','27333','23316','54788',
                          '46762','32687','76926','39399','78598',
                          '87705','11160','47747','61499','16288',
                          '65555','42102','71774','66822','23873',
                          '72038','25940','44377','67656','29316',
                          '43800','11457','80537','43280','89431',
                          '71056','85007','79925','16824','10189',
                          '57239','53168','34281','43668','76754',
                          '57154','65820','30340','62516','37634',
                          '97227','95774','70305','29038','48533',
                          '22914','36569','46657','22379','39712',
                          '99093','84621','18351','78784','55207',
                          '91655','25381','47255','99301','54231',
                          '27244','73515','14903','28688','71112',
                          '83166','71585','89617','32234','11202',
                          '44541','11616','56130','44103','17081',
                          '72087','88111','52016','61316','26725',
                          '19796','95056','77106','82065','54932',
                          '86472','76921','15449','47370','34107',
                          '46094','77436','19861','35125','70731',
                          '70232','59610','65182','50529','55001',
                          '41511','62918','61328','89926','12413',
                          '27183','57426','66969','35091','37801',
                          '65783','23804','93559','29064','53200',
                          '69793','90532','82157','33750','48345',
                          '67298','51777','67179','99445','60511',
                          '50049','96174','20372','67371','68146',
                          '21802','81751','82870','11235','50838',
                          '95271','34267','46984','25300','97208',
                          '68648','47073','47511','41453','91118',
                          '18736','51803','65433','17563','59103',
                          '23181','57221','92519','84940')
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


