
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
                          '43824','67907','12162','85362','83894','15436',
                          '96061','83797','82135','47402','14935',
                          '89564','94288','80534','48474','55834',
                          '89515','15798','22252','70240','78055',
                          '12836','68468','26168','10784','79328',
                          '94229','59971','20142','89929','63162',
                          '99560','30491','78312','11473','35168',
                          '72882','73690','66634','36684','30918',
                          '53589','19419','99869','33559','91456',
                          '96261','75662','16274','68243','16247',
                          '59020','50019','85967','48436','82719',
                          '70003','11704','87470','37999','86440',
                          '70982','21488','57602','23247','74720',
                          '76164','43573','13441','36897','78008',
                          '91959','30760','89829','17795','72025',
                          '23903','79589','21627','51923','70271',
                          '17332','96088','72079','18416','21962',
                          '78351','78149','70018','54712','75916',
                          '74861','79941','95739','70629','60046',
                          '60780','89091','23549','77209','90185',
                          '48445','52506','19212','50969','65523',
                          '93157','35527','11833','74245','68239',
                          '96052','78594','77985','98558','50001',
                          '82446','49606','19081','91321','56731',
                          '28328','60408','42105','49376','10300',
                          '53263','40823','79870','28393','62173',
                          '40841','70217','83446','20526','97564',
                          '94076','89541','83045','48835','36291',
                          '97582','29481','40261','29306','35318',
                          '15180','87712','69641','50850','45518',
                          '18801','36451','86359','70689','13698',
                          '21245','42757','14930','15005','30977',
                          '20413','66828','59329','89950','27123',
                          '17211','11376','71618','21088','48074',
                          '20143','42512','58151','47172','97628',
                          '49156','22582','59340','20415','86402',
                          '27846','82291','24881','79960','47495',
                          '57133','87423','25025','25822','56186',
                          '61062','46280','13472','49035','85972',
                          '87418','76454','80033','52786','60112',
                          '42666','55867','87857','60028','99753',
                          '58640','58112','89059','41419','49014',
                          '19827','36012','13503','15304','83439',
                          '62149','25795','51878','90928','92424',
                          '92251','40029','77214','51947','26390',
                          '19087','65444','34298','11411','15205',
                          '70103','10504','92893','66514','90064',
                          '89558','47582','41851','61227','81558',
                          '83635','44731','43790','10389','57953',
                          '29931','51458','79513','41184','78619',
                          '11003','93404','61440','74217','30407',
                          '22406','42038','78237','79959','84898',
                          '73553','79549','36146','70787','83755',
                          '64600','18431','15230','97031','46186',
                          '97199','17180','87503','21794','32643',
                          '83877','41625','25309','39224','20357',
                          '66217','57353','96100','69407','45832',
                          '44432','54124','68645','51669','18141',
                          '55493','51841','72864','53697','45611',
                          '53377','17307','29291','17035','29354',
                          '89404','86674','31509','46243','32107',
                          '65931','82813','86547','18693','28500',
                          '87261','42290','10567','68021','55597',
                          '32214','34182','37552','62190','42952',
                          '73272','41218','73458','20816','67022',
                          '47507','49219','18684','30588','73205',
                          '46769','68993','12875','72476','94723',
                          '46181','42582','98531','80986','32825',
                          '95259','24793','27998','28711','67682',
                          '80241','20327','95187','66686','41221',
                          '62398','50534','94508','93172','23867',
                          '32468','42444','60521','56077','82638',
                          '49685','22094','66251','98237','16474',
                          '82735','98799','28538','21865','97203',
                          '89528','34457','61253','11118','36988',
                          '83058','73580','30552','34580','48410',
                          '32008','38521','94098','70637','28152',
                          '60968','29457','60519','78499','65349',
                          '70427','82720','57430','23980','84833',
                          '72471','59822','53671','37801')
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


