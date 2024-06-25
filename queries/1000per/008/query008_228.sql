
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
                          '23895','32394','87190','47864','13661','18018',
                          '76812','71441','81398','17852','90591',
                          '46965','17230','87132','48321','60443',
                          '30596','60526','47958','72079','69838',
                          '32321','11270','17604','76111','62657',
                          '93436','66976','91420','79312','86601',
                          '90914','35119','20672','93858','82243',
                          '24740','43271','51381','25677','38089',
                          '32201','70134','30539','55298','21239',
                          '38708','28080','13557','57437','86527',
                          '52375','67696','25946','53634','55957',
                          '58493','57778','40259','81345','21279',
                          '27039','25177','52616','83599','18987',
                          '99398','18949','27036','80855','54754',
                          '53277','99678','95769','60123','83289',
                          '12206','26521','11644','51012','37418',
                          '58201','85496','17419','94726','57460',
                          '13850','62260','69632','19254','87582',
                          '89795','94223','14135','76698','68663',
                          '94926','48866','81153','69768','39759',
                          '63717','85134','14997','67344','65596',
                          '61644','86931','47071','21063','48652',
                          '96280','81806','30113','71304','87599',
                          '88120','14591','89509','11621','20002',
                          '28965','98852','18302','74625','62618',
                          '27438','15833','23432','25498','53973',
                          '52570','55466','89072','74255','45367',
                          '44846','39094','91138','80541','55396',
                          '87230','37391','20136','57248','98563',
                          '76058','91884','85548','35346','26741',
                          '57256','91132','87826','36293','98638',
                          '42784','44693','83877','39284','30611',
                          '53652','15476','13283','62741','45288',
                          '13562','55447','14512','32974','86584',
                          '92498','48714','86721','78446','82263',
                          '14072','41570','89679','80342','60359',
                          '59831','71633','60137','81300','71168',
                          '75445','39414','10277','33161','52027',
                          '89943','11900','68928','50936','48323',
                          '84403','45251','49343','90262','63760',
                          '65471','87040','74242','10447','78048',
                          '25409','33273','66556','86211','44266',
                          '54463','50058','75135','23437','45246',
                          '71366','85111','92630','46579','18464',
                          '28816','59996','72465','30350','89647',
                          '43129','12708','33865','55822','91716',
                          '51851','74635','28200','80081','11850',
                          '32594','51721','55543','60407','13632',
                          '25293','38376','56627','71979','17089',
                          '98900','31456','22332','79770','94577',
                          '77647','57435','69533','78292','39486',
                          '97270','90941','58353','83838','73313',
                          '58637','23751','84507','85991','12357',
                          '26502','96735','99888','75844','95538',
                          '30907','60050','67679','54993','59392',
                          '65960','48653','69617','29830','20643',
                          '58694','91487','95333','43238','11434',
                          '55615','23273','39999','67580','59565',
                          '98776','84739','37617','65087','29031',
                          '23562','78816','37489','97003','16272',
                          '86442','10052','34641','11386','60498',
                          '45986','18656','59239','32707','27795',
                          '42583','89583','12034','87560','79234',
                          '52105','13880','24406','15168','47876',
                          '71585','30823','58123','30387','18830',
                          '27081','24266','98859','50259','95368',
                          '42844','34130','75826','67842','91605',
                          '89552','51095','26250','40419','96532',
                          '41313','63283','58425','73009','31272',
                          '91896','34606','89473','25852','99030',
                          '33410','85933','81743','55426','17964',
                          '62558','93079','64473','93005','48947',
                          '20182','28050','27594','34849','53894',
                          '92080','19721','88512','25335','51802',
                          '84256','90831','80818','10402','67950',
                          '94276','12241','61484','29109','26775',
                          '47373','28515','32195','74422','21678',
                          '11002','75254','35434','46069','77888',
                          '74138','41090','31686','24970','33551',
                          '47047','55005','30542','39747')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

