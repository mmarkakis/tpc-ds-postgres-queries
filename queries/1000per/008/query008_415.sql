
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
                          '15386','65203','78252','11312','93620','81902',
                          '71654','24202','90059','14672','79936',
                          '25592','56225','83379','79768','63991',
                          '84552','73313','10860','98899','26495',
                          '84478','60089','63672','74874','75544',
                          '51500','37495','29668','22195','30955',
                          '21896','86605','43865','16092','85123',
                          '92286','68436','19177','71026','69276',
                          '68458','57987','78072','53823','68004',
                          '32176','76327','54795','23565','29754',
                          '71066','77805','92321','26831','56295',
                          '23371','15698','17114','35860','49714',
                          '22138','92108','72226','71126','34770',
                          '98667','45357','17412','28154','91543',
                          '90479','90669','37277','62661','47131',
                          '47936','81624','10223','93835','76958',
                          '46662','54671','54851','43767','29978',
                          '14646','22533','27852','24354','11360',
                          '94150','17202','53152','39987','29049',
                          '91051','21128','95678','94485','22101',
                          '55579','64509','14356','48078','44869',
                          '56016','27487','98847','99163','36160',
                          '90445','76917','85516','98555','11732',
                          '36429','33458','18632','37465','89922',
                          '13317','55286','28546','15141','94384',
                          '16929','89684','92640','79021','13944',
                          '87278','84349','16490','73767','45705',
                          '87454','19336','60996','43802','87888',
                          '65030','43123','34833','38415','36674',
                          '95507','58192','74518','19725','27975',
                          '44154','35250','66232','30584','50907',
                          '27063','57045','21489','24110','89078',
                          '24140','71608','20224','64040','49197',
                          '39239','81562','56197','33266','63146',
                          '59240','44079','23495','76923','56146',
                          '24122','57601','75317','11489','57151',
                          '14352','40280','81757','51205','75904',
                          '29998','69183','25019','91433','63017',
                          '82014','50995','85991','52329','79591',
                          '64062','35598','17148','39021','48617',
                          '39424','21011','17488','13331','25553',
                          '22532','32396','47713','93903','88514',
                          '75535','46401','96370','20527','41567',
                          '76881','13536','84391','39741','31915',
                          '19885','50359','31393','54682','81369',
                          '64879','43882','80490','93226','87680',
                          '76266','88894','97169','40223','12928',
                          '34121','46200','72153','37838','99813',
                          '91021','21427','44328','92522','18712',
                          '90309','81144','21738','10989','97308',
                          '18753','38698','46545','97724','31841',
                          '86073','75050','58537','66930','91451',
                          '31021','44317','40536','67538','70957',
                          '47585','42213','48815','10257','85580',
                          '90469','25399','18581','16133','62339',
                          '26104','28440','46110','51254','53373',
                          '40525','91052','14225','89468','34186',
                          '83767','67561','64872','88808','30874',
                          '25822','68401','64323','80134','39051',
                          '25309','13922','18651','68892','41167',
                          '62469','58527','49159','47951','26896',
                          '70124','21449','56827','98535','89283',
                          '48776','25259','58394','24567','11239',
                          '59078','57405','32511','88990','61009',
                          '27408','67808','58832','37973','33672',
                          '96359','47510','73027','38092','22598',
                          '42609','27734','36814','23832','17055',
                          '39474','23358','49327','58126','97828',
                          '64577','57242','67990','75873','45004',
                          '28682','17254','82856','52645','37920',
                          '52512','86604','87940','14321','97812',
                          '65950','65150','93708','44062','38215',
                          '27490','17793','90145','42192','17938',
                          '70969','99370','56038','92340','21321',
                          '17761','30663','41016','19572','11640',
                          '68010','55567','54196','68644','85070',
                          '46571','61508','43116','38853','41946',
                          '38603','54225','36992','34528','15685',
                          '87287','10402','80741','69042','76840',
                          '12294','50457','27682','72966')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


