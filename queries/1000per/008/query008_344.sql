
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
                          '38224','75717','23211','32109','45734','42177',
                          '95644','49160','19539','40720','56384',
                          '71972','58045','54788','54706','89313',
                          '95992','83061','77110','41047','78786',
                          '84136','80786','68015','68002','99180',
                          '38997','43640','23196','96336','66354',
                          '90909','34829','95412','17435','64073',
                          '68658','86005','82809','91727','82031',
                          '98394','31031','51790','63749','40885',
                          '76132','86786','73731','88871','76649',
                          '22556','50534','91085','48574','99444',
                          '97442','26475','47314','91399','28587',
                          '29158','92407','99930','49382','25229',
                          '21045','55676','18769','35924','31251',
                          '21249','15723','55199','91408','11848',
                          '95356','85736','77221','73511','93472',
                          '94487','43187','44388','66810','74459',
                          '13896','63111','92170','48515','24393',
                          '23719','29186','69229','66272','19547',
                          '40382','64862','21253','34915','69541',
                          '83430','68746','30143','56570','66864',
                          '30290','63930','73009','94681','32225',
                          '12948','60641','98266','97221','98201',
                          '77770','69887','17993','11112','14873',
                          '89760','95263','42615','93657','32196',
                          '14643','59456','14334','55142','89900',
                          '26314','55866','86752','62829','92740',
                          '36653','76252','67858','24309','82335',
                          '42088','48650','87008','67298','82998',
                          '10891','88084','37661','92720','51528',
                          '21025','20281','78250','13147','45979',
                          '10974','98905','75850','79750','75161',
                          '15090','78920','45922','66280','57969',
                          '65491','69555','45199','56255','97904',
                          '22579','17430','17727','93726','70966',
                          '92940','77840','36537','64142','42072',
                          '89627','70801','39822','23887','62735',
                          '52384','64202','50719','94013','15966',
                          '75058','26262','53072','57478','47402',
                          '76718','44041','48519','58512','74702',
                          '65247','84638','64872','88168','10676',
                          '53811','82131','60576','68754','60765',
                          '46797','82708','99587','55864','86429',
                          '53602','84991','20814','92366','85373',
                          '58389','69780','88810','76100','13305',
                          '31167','48927','84394','40839','44474',
                          '72854','85879','80958','19601','36531',
                          '50951','98701','45991','73232','11426',
                          '78367','29110','36140','13748','84015',
                          '94517','51813','93527','81034','79614',
                          '11365','81954','57235','18184','91470',
                          '30834','77544','44077','64807','87529',
                          '61188','25718','17290','87306','98525',
                          '33135','91834','61441','20795','90263',
                          '33386','18401','47005','50713','71823',
                          '27342','26896','74286','24950','44826',
                          '49833','89069','32880','23378','92753',
                          '18135','73181','77420','65386','31738',
                          '60792','32006','96820','96265','17654',
                          '79880','21610','76598','90389','84871',
                          '88534','49307','43858','88144','15173',
                          '57930','57917','41296','93844','84658',
                          '26275','89715','22693','51792','10523',
                          '65098','27636','94083','75791','89275',
                          '78291','96440','82602','37606','37161',
                          '18005','94058','12027','94238','99785',
                          '13136','16359','13655','39939','22636',
                          '24034','25025','26894','17422','45412',
                          '31979','33573','55738','88397','17822',
                          '40639','88706','56003','84382','84621',
                          '39123','60017','75809','93660','94042',
                          '49296','56573','47386','18661','47603',
                          '57312','83630','81404','60415','59010',
                          '80420','51390','15343','68440','16979',
                          '29856','64961','37549','13797','52190',
                          '67444','18029','33753','77607','52221',
                          '50863','56276','88390','44839','45232',
                          '33806','36269','66938','28127','31908',
                          '29299','91452','85607','34242','12142',
                          '50532','52877','75516','93456')
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

