
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
                          '55061','45110','38254','61106','43846','25560',
                          '25876','30371','12153','78616','37598',
                          '46884','70281','74508','62219','15105',
                          '92389','12218','70872','92765','86849',
                          '87007','15346','51579','68875','75278',
                          '16816','13285','77946','30316','75047',
                          '37072','98591','31180','57953','66174',
                          '21981','96529','29514','67696','60486',
                          '65664','93396','68998','36383','19055',
                          '73864','34869','40824','21166','20668',
                          '91143','82451','34899','12767','27585',
                          '82619','62317','25212','93321','75603',
                          '72695','27024','61650','37291','48305',
                          '61428','61182','91357','59502','54160',
                          '50341','17917','55800','55590','91675',
                          '79809','68221','26972','15605','56646',
                          '70915','19580','76551','17780','70759',
                          '46820','17436','49320','10461','22297',
                          '35021','23328','26135','48939','28091',
                          '53371','87576','95315','43000','72681',
                          '79388','31206','88008','14461','61460',
                          '11732','48228','25640','56542','65800',
                          '25291','61959','60602','85706','13504',
                          '27115','27730','26686','84699','87570',
                          '29512','42202','29606','95824','35261',
                          '42945','60078','77211','55704','16632',
                          '12064','98909','81907','15602','23838',
                          '92795','74824','43278','48179','54773',
                          '42459','37992','40223','16588','89138',
                          '13884','98572','53384','57697','58451',
                          '27098','72939','71995','15521','24143',
                          '88240','27042','48470','87479','65719',
                          '50842','75108','31689','35981','46150',
                          '70779','23179','18862','84743','44401',
                          '60565','98398','36483','68421','75783',
                          '48912','81021','79474','29157','77058',
                          '66485','12596','25686','70373','46621',
                          '43319','27403','60115','15198','49910',
                          '98828','82866','29866','33729','21878',
                          '49193','21214','54829','27898','42692',
                          '93618','17424','26468','41735','79309',
                          '70658','40886','97800','55891','11358',
                          '53180','12924','45845','86656','23282',
                          '47328','14144','49477','31960','94522',
                          '87622','61205','77162','14699','26459',
                          '88106','39471','96495','77607','75785',
                          '78588','96666','59141','64397','73129',
                          '80974','60056','54869','64678','20853',
                          '81585','60060','15944','94727','54144',
                          '11967','16142','47842','76124','59127',
                          '67432','82046','58659','46107','64212',
                          '41991','14497','22115','11028','79375',
                          '51466','31580','41746','89204','36692',
                          '39098','15853','75765','93022','56380',
                          '39607','27961','10805','82993','95589',
                          '63409','94841','15286','91890','98484',
                          '90135','59467','15543','69831','72601',
                          '93706','86252','15263','33970','96204',
                          '42047','20879','86984','78890','40865',
                          '41887','49549','46831','80355','67756',
                          '74182','41247','68802','11173','31709',
                          '82831','69040','17411','13659','87296',
                          '98506','35530','51430','58529','36033',
                          '74111','19654','62457','72118','95775',
                          '64611','36604','48058','49826','78421',
                          '53439','22043','82764','51903','26120',
                          '96808','33196','72213','93315','97739',
                          '19809','87543','36174','23540','35309',
                          '97564','25596','29297','86723','74636',
                          '88511','87542','33527','10835','76614',
                          '14247','55503','43682','99441','30803',
                          '95174','37347','34428','39742','21667',
                          '57247','17748','85847','41786','84102',
                          '18080','22453','89252','95303','39797',
                          '29166','94276','50126','70849','67353',
                          '10442','50118','93088','52095','61086',
                          '75155','86440','26019','74437','27488',
                          '15823','32241','73422','54910','14928',
                          '38588','70535','41370','22981','34352',
                          '87756','40545','15445','40875')
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

