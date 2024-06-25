
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
                          '66350','57872','12576','24555','15366','70408',
                          '83855','68938','65750','51372','60417',
                          '35422','83374','83874','16346','11928',
                          '28854','70466','22941','44414','74642',
                          '89057','85239','94720','84281','40995',
                          '94726','50617','79245','46693','28549',
                          '27940','23495','78755','84954','57443',
                          '73921','22775','81099','35486','50351',
                          '25223','33702','94889','44995','12830',
                          '61548','92693','20902','82014','21542',
                          '51722','90429','20802','46192','22530',
                          '38218','93020','41191','54088','58921',
                          '41435','71000','23742','61582','16675',
                          '21291','53842','89164','13334','59801',
                          '33225','51797','24183','70926','79468',
                          '47536','50117','51132','29063','72146',
                          '25801','50150','18256','71053','10822',
                          '98014','15249','75796','68637','28860',
                          '41107','64002','44983','48243','47046',
                          '41655','62789','90819','85505','37412',
                          '91524','16664','51488','55334','55100',
                          '61525','20574','57406','20277','85168',
                          '36598','96315','90299','31141','69626',
                          '94643','96947','19024','89162','89105',
                          '41737','63274','75620','84641','21150',
                          '26235','97221','97083','24874','11362',
                          '93048','73520','31888','11666','88653',
                          '99931','48184','19052','13490','23962',
                          '53933','51279','14755','42906','89037',
                          '57854','71434','24935','93647','81269',
                          '58287','68079','69521','61897','86031',
                          '86140','78822','97015','95013','40129',
                          '66461','65671','27005','70821','27853',
                          '87067','73408','20272','53450','56341',
                          '80979','79294','71366','42685','67571',
                          '71695','10789','15257','27894','23603',
                          '77330','57865','56042','79832','51021',
                          '29828','80176','83963','66356','74482',
                          '25770','75294','33535','51194','35937',
                          '76863','12382','91746','33269','80370',
                          '75187','96764','27191','18658','28245',
                          '57834','49194','56594','32099','93062',
                          '13249','82951','96359','14266','55565',
                          '45817','64488','53830','42866','46314',
                          '78617','16196','62067','18159','25662',
                          '20772','86149','44269','50998','29043',
                          '41117','56080','10959','99165','56550',
                          '72494','63122','13328','63772','93065',
                          '78340','51733','30662','13897','51291',
                          '57288','65364','60801','14886','56883',
                          '78908','91786','90940','10104','64625',
                          '34704','13131','88954','17122','54069',
                          '46875','35788','44841','11772','13518',
                          '46080','27165','60997','95159','73605',
                          '22150','82714','38692','44894','60156',
                          '10451','22421','95977','73948','19663',
                          '19847','63617','35153','33721','84664',
                          '48198','69293','26549','38063','40976',
                          '76296','16389','12542','69982','86310',
                          '22087','13479','61917','72935','90539',
                          '57100','87726','34183','22079','36556',
                          '64644','78903','99813','21236','88549',
                          '98057','93219','32153','80557','85529',
                          '77469','96835','82491','26594','30288',
                          '52360','93231','19987','53619','55049',
                          '23729','82341','94648','66349','43979',
                          '59127','86684','84192','57349','24826',
                          '35769','79901','43119','70130','82916',
                          '55424','13353','47580','25477','10826',
                          '15320','97167','90013','88517','92609',
                          '59122','18648','94965','36235','25872',
                          '54752','73210','59872','10730','11679',
                          '63790','13772','21680','11134','16943',
                          '59384','62422','86899','72120','27796',
                          '48334','11878','26390','85620','39437',
                          '37038','43717','83432','86233','56753',
                          '75506','53949','26962','76930','62144',
                          '92766','52319','79331','52823','72720',
                          '43245','39517','58639','46858','15976',
                          '64977','99312','44042','32796')
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

