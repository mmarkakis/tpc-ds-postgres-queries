
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
                          '97833','92492','98386','52669','11553','69731',
                          '37478','40550','74333','38870','88635',
                          '56086','36835','20296','92338','94928',
                          '81522','74796','25952','41476','53179',
                          '88022','14211','78907','57065','10977',
                          '77700','46521','51115','80109','56149',
                          '57745','30004','29786','82592','36685',
                          '58051','19838','35569','77164','55085',
                          '84334','88495','21641','80084','54621',
                          '45094','63939','23166','42935','92831',
                          '83020','51120','79217','33971','17031',
                          '96281','49685','72740','77827','65473',
                          '99346','39074','95704','14999','48962',
                          '49668','31450','90438','38580','95750',
                          '95368','18056','93412','25778','96422',
                          '46365','10195','85392','94237','62662',
                          '26532','14945','12325','80450','12914',
                          '35258','89354','96845','24883','67966',
                          '24242','10642','62413','71879','93279',
                          '68699','90552','19734','75086','18723',
                          '86478','81760','33382','29142','10397',
                          '39726','27933','74340','61006','12869',
                          '70555','98460','38902','41686','28277',
                          '65238','24687','12198','79917','98890',
                          '12624','62382','66619','45338','78349',
                          '78546','66497','82933','64538','96405',
                          '64543','86048','16683','64536','94693',
                          '12448','38636','38239','62220','48227',
                          '26335','63702','17180','10149','89320',
                          '94666','42758','13747','59291','80426',
                          '31848','23109','35386','28759','61673',
                          '54631','39271','81536','16220','86471',
                          '32070','75705','47830','94867','49814',
                          '96081','99847','48279','74478','55028',
                          '94542','51833','61411','23284','62601',
                          '44500','37641','55682','93775','80454',
                          '59215','24099','62422','88043','31222',
                          '84577','18272','87385','19394','67430',
                          '18073','62258','14671','24673','93665',
                          '70290','41638','76177','19768','63015',
                          '44583','32747','33478','36720','37316',
                          '30743','44995','60799','85945','93458',
                          '49231','73035','97008','89090','42738',
                          '66181','42900','95241','57418','77744',
                          '95261','72684','80674','55921','80077',
                          '84779','96790','20630','45102','29825',
                          '30824','14502','90663','51474','27930',
                          '81896','97367','18127','60426','26620',
                          '63382','47475','62712','31952','77863',
                          '13715','97763','14388','18160','89659',
                          '91293','40347','22879','70730','93069',
                          '67394','13036','79370','56053','27440',
                          '98373','38328','31766','61025','20947',
                          '84855','46920','27258','56153','33942',
                          '13687','49435','47991','28241','13154',
                          '21667','64806','83161','11513','82879',
                          '76364','87531','58128','78332','14620',
                          '10074','18780','91670','27777','95671',
                          '89399','31944','87936','73559','69083',
                          '12036','53418','36055','38512','10781',
                          '95584','14838','33344','85991','36177',
                          '71460','32366','88885','34445','81407',
                          '53637','39860','87011','77919','96187',
                          '30929','20660','89816','88431','35967',
                          '83867','31076','64094','96743','96355',
                          '90523','46458','87347','60242','68947',
                          '11084','51006','12435','15133','26456',
                          '58566','72484','81077','61740','14593',
                          '72985','74774','83921','76692','61083',
                          '46820','52077','57822','41884','39991',
                          '97840','93273','41253','15616','20418',
                          '73655','79276','92163','58641','90872',
                          '83040','61900','74876','94555','47282',
                          '44261','29344','82956','84219','50725',
                          '37414','71058','70325','86218','13404',
                          '35795','97748','24824','66758','39360',
                          '86983','49675','49803','28836','47556',
                          '73457','81020','99493','60845','18800',
                          '50249','88358','36247','18902','27923',
                          '73216','31815','95621','70924')
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


