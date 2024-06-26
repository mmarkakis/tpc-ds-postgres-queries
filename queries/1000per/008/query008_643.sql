
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
                          '70570','24751','77075','49169','20890','33457',
                          '48634','31248','38405','53819','93222',
                          '50820','18770','96786','99811','14246',
                          '96064','99814','62989','96218','47488',
                          '62884','56469','67964','26572','23241',
                          '67647','75304','54466','85243','13969',
                          '62761','39531','34794','10685','94701',
                          '63606','59512','61112','38416','61707',
                          '64518','12293','57309','13516','11714',
                          '64684','11351','16177','68626','97024',
                          '62028','96466','22915','27336','51333',
                          '86070','66793','85869','87319','96489',
                          '33421','92634','71128','71854','64321',
                          '20067','70739','92103','46842','70750',
                          '99817','87152','46827','35749','73252',
                          '77783','96536','26269','81092','44996',
                          '84157','64809','90604','72453','72929',
                          '71872','44266','34381','95034','99287',
                          '74206','96169','96282','30176','84740',
                          '60026','80720','57555','90673','83688',
                          '23149','36940','95553','59922','74143',
                          '39744','94775','54762','42106','45549',
                          '40786','82769','92076','52791','70850',
                          '46052','33960','84527','91342','61754',
                          '95549','33671','69200','68519','20363',
                          '56731','55013','79099','52718','43428',
                          '40726','86017','46323','10491','63674',
                          '77387','16468','40560','49337','50292',
                          '53122','14056','41316','76845','45199',
                          '83185','36025','53760','75451','12004',
                          '27325','21806','70802','84881','37258',
                          '46363','53847','11233','75138','86623',
                          '91196','97436','44748','95874','66953',
                          '24687','89034','78339','99731','61779',
                          '66970','47018','32498','61975','17079',
                          '27098','98214','26019','43884','56063',
                          '76209','79866','87102','39685','43410',
                          '74304','23454','16977','79806','37383',
                          '62753','80437','71607','50439','52865',
                          '74511','65958','90731','65575','26933',
                          '55162','60328','34587','59881','36590',
                          '55683','83373','53185','22278','62869',
                          '12218','94435','75572','44956','26477',
                          '15634','59509','75125','54049','58796',
                          '96398','36758','44287','45539','22633',
                          '95640','88579','76761','13539','11274',
                          '89516','60938','67071','49940','63955',
                          '92637','23975','84545','46103','12073',
                          '30263','55547','76254','24476','80229',
                          '26601','34881','37104','85981','34592',
                          '82822','72751','45826','88488','84845',
                          '17539','42064','61392','91838','84896',
                          '67623','10791','67891','40666','32369',
                          '22576','84034','14538','69267','72272',
                          '59396','84723','91674','99283','78678',
                          '83554','28065','51180','32874','77271',
                          '24759','65064','11297','36459','80112',
                          '98370','79508','27608','69747','18926',
                          '65113','59445','72254','64239','30864',
                          '19864','45370','36120','92007','53447',
                          '36858','37470','37541','31711','43214',
                          '88092','42913','70108','91274','72178',
                          '81114','80377','99927','57735','15560',
                          '92617','12131','87356','52234','60778',
                          '33734','72084','35890','22402','51872',
                          '22066','66245','69176','73623','75867',
                          '65820','65472','76220','80263','10026',
                          '45515','38051','41569','45899','72262',
                          '87435','43759','15939','99508','84243',
                          '20679','85787','79507','49361','10739',
                          '84670','46010','27234','69637','53281',
                          '12347','29822','43865','17133','41659',
                          '46009','16804','67958','34136','52207',
                          '13756','32162','61396','14422','72077',
                          '75167','97040','22577','49616','29843',
                          '10497','63098','72294','66530','64736',
                          '32457','19655','83302','32898','79491',
                          '41901','81246','31625','65706','76535',
                          '27699','65001','51847','99309','71866',
                          '61429','37338','73276','16969')
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


