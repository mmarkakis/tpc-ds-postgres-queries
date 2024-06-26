
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
                          '96811','66126','51947','39112','94195','94327',
                          '83600','12260','88155','52035','29027',
                          '23341','83375','75511','21304','79524',
                          '14360','46654','52142','38415','28058',
                          '10961','20339','88048','99829','24335',
                          '58599','32763','39839','30063','40894',
                          '82639','76024','59814','36578','73280',
                          '82840','52346','85963','34955','54927',
                          '58280','26959','84818','45657','28247',
                          '75387','26662','94382','38679','40134',
                          '27360','41748','53312','76362','27278',
                          '63660','65897','44148','74814','88972',
                          '29947','16418','52744','11061','36119',
                          '20645','56240','55381','47101','88462',
                          '73139','43077','21674','19121','60509',
                          '45876','18821','67462','72533','38398',
                          '41335','23800','74430','75841','87283',
                          '42580','74511','89032','82800','65588',
                          '57843','64907','53651','39208','54675',
                          '13345','75836','49870','19104','95952',
                          '44120','63032','81113','55569','98004',
                          '69788','45553','42299','35601','82643',
                          '32022','16821','17524','90684','56907',
                          '47669','58928','89760','28254','71562',
                          '81986','50151','49861','42156','56623',
                          '36059','41901','72721','79073','12591',
                          '75986','19184','14086','12173','75299',
                          '16147','50744','50336','52208','71472',
                          '64826','70018','79334','81536','23437',
                          '96158','48081','37936','93548','78845',
                          '84641','43234','41302','61918','39325',
                          '58997','61737','36309','42908','95418',
                          '73541','66739','73774','53537','14834',
                          '78980','43553','43062','45770','25188',
                          '42608','88068','14596','75792','75529',
                          '70204','55432','37038','79356','83378',
                          '40977','28063','27165','25510','57582',
                          '72038','53762','56794','82286','23107',
                          '38885','11348','80052','97106','57749',
                          '95689','70719','22511','24286','98107',
                          '64592','46988','89852','26672','13847',
                          '89320','95367','90650','42662','25995',
                          '77976','21168','36065','88577','14519',
                          '50718','18098','46837','60399','85393',
                          '19938','91178','98802','70164','73721',
                          '68174','21521','81252','20186','28119',
                          '97659','69483','39103','78246','26272',
                          '25408','31190','25137','20171','35345',
                          '41956','31610','27462','46987','35277',
                          '23291','69475','13156','14386','78680',
                          '42061','29312','71567','40453','81262',
                          '24800','11014','73177','72654','60117',
                          '74002','88440','73215','88026','43756',
                          '98660','69715','10990','58758','98246',
                          '81567','18516','65293','58496','15050',
                          '13778','91014','68374','36640','66222',
                          '70822','10617','21909','59369','46258',
                          '93396','73025','11041','32985','56658',
                          '90271','70200','81952','60908','30630',
                          '12469','44237','64836','40862','57172',
                          '43153','16550','57324','27891','13034',
                          '81713','92542','29415','83422','19873',
                          '67199','75242','23932','91575','37056',
                          '73599','45103','73397','67581','26034',
                          '10483','30379','23709','60497','84435',
                          '74351','71057','20259','93825','49384',
                          '88135','85397','54711','17764','31155',
                          '45927','77007','85262','16558','32383',
                          '29974','72344','94423','89590','79284',
                          '37555','24424','98423','98694','24867',
                          '71006','85371','11468','10715','82746',
                          '39503','69883','88498','13375','53526',
                          '59818','73230','35500','95849','18661',
                          '95006','92174','30494','39243','32240',
                          '97088','92468','43428','50539','28592',
                          '50054','60795','99667','12569','55026',
                          '75591','68994','43703','27372','50513',
                          '12695','37082','61386','35545','17786',
                          '81833','43447','54990','45486','23162',
                          '81319','57148','70163','45864')
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


