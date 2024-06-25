
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
                          '41606','40038','96202','81248','37785','36214',
                          '33212','80026','64190','13003','40433',
                          '44942','84836','99394','42869','27709',
                          '33973','77209','74926','51883','22237',
                          '26693','65756','65724','12685','21338',
                          '67870','14860','99267','70623','79275',
                          '63986','69218','37268','57997','17669',
                          '23720','19505','70821','23013','40457',
                          '59678','23261','17383','96374','49484',
                          '59777','19765','22782','15626','32309',
                          '77971','25020','63566','19092','44972',
                          '15908','86158','86745','17015','89820',
                          '40159','57226','97965','67136','33620',
                          '84452','65446','68800','20918','89873',
                          '24763','66974','55174','78052','23078',
                          '78649','43747','29871','98983','54524',
                          '98722','83827','26576','28338','65561',
                          '64432','69872','25515','76186','87024',
                          '26082','16036','12888','29683','63515',
                          '87813','86916','77894','89174','23477',
                          '57396','78294','44068','72876','80167',
                          '35620','79102','29375','56737','76385',
                          '41507','27639','49305','93206','27863',
                          '81004','12251','52020','92857','69892',
                          '41207','71785','85692','58058','87892',
                          '59970','82731','19369','14553','64492',
                          '13515','71655','93600','63833','91245',
                          '81207','57779','12635','58653','37961',
                          '50274','31506','64118','72830','13892',
                          '22470','47729','19920','76584','61682',
                          '40152','13588','52686','56522','71429',
                          '88541','70970','19245','45846','61595',
                          '66250','94687','83652','21006','19717',
                          '49986','74201','49515','28439','90567',
                          '32772','39268','43942','46391','36868',
                          '55051','91835','83743','41098','76990',
                          '38965','56228','94790','42155','38151',
                          '26666','31266','87631','68836','84405',
                          '47250','81706','37782','28974','89831',
                          '42105','11356','23334','65540','39155',
                          '43149','33934','49181','40172','47348',
                          '20686','39397','72502','24443','84964',
                          '33853','25965','52990','97147','53883',
                          '69039','56971','60630','25159','78751',
                          '70962','66446','12387','86720','93457',
                          '34253','84073','48795','39777','28831',
                          '52677','35997','52408','46393','49346',
                          '40979','31531','79515','84768','23576',
                          '73802','20774','61150','22393','98868',
                          '14444','98662','25414','88886','96026',
                          '50220','88396','93389','23845','33086',
                          '20209','76830','10777','12944','71771',
                          '75947','17186','39231','86112','90989',
                          '77668','50615','14856','14403','15004',
                          '40705','22417','34835','88816','33398',
                          '33504','75828','47898','91855','47763',
                          '17688','39024','86550','60014','65568',
                          '85993','53584','56873','51199','55360',
                          '40931','91050','90621','66954','48693',
                          '61069','18849','82598','44294','61484',
                          '23937','25814','46372','89870','30424',
                          '73798','45934','57239','92756','29169',
                          '63065','88588','16512','28382','62152',
                          '21359','62252','16455','54398','92676',
                          '98490','47617','15563','38333','27806',
                          '56104','21542','46685','57055','91087',
                          '80530','67815','36570','84871','57800',
                          '98847','69476','77219','38655','33024',
                          '96755','49926','36048','60132','69120',
                          '97748','62970','68309','56362','18859',
                          '28024','46342','87835','36579','16256',
                          '45172','52466','57594','79902','58066',
                          '20719','58962','84445','84593','31061',
                          '39620','54140','88213','31516','15650',
                          '85271','83591','67854','47811','88347',
                          '39843','18611','63259','62181','97985',
                          '99348','36648','35085','78436','98403',
                          '19382','80851','86052','14698','42236',
                          '24866','89932','87784','44592','65710',
                          '58476','55704','59538','79496')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

