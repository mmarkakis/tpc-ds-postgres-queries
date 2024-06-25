
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
                          '12821','41897','38855','57778','52876','64763',
                          '15306','51639','68564','55118','80942',
                          '41923','52755','40490','47981','32259',
                          '98907','59261','26171','75922','72745',
                          '96049','83721','29388','60642','35672',
                          '95114','53491','94471','44216','33856',
                          '93083','52981','37342','90543','85169',
                          '91775','13855','13974','61048','72280',
                          '35120','11620','29665','59011','86700',
                          '62872','59189','52136','36981','17813',
                          '48184','98821','88816','66230','77367',
                          '20888','27057','84352','61667','73453',
                          '17225','49405','44963','69285','27507',
                          '56809','91454','19412','76494','90149',
                          '64562','68472','11368','88737','19596',
                          '64626','26439','56631','31142','99073',
                          '16673','45843','63252','31359','45635',
                          '59299','14172','43338','81488','20855',
                          '61399','44151','66574','53346','56753',
                          '60870','46716','13778','91728','80595',
                          '41460','77318','21407','42187','53131',
                          '68069','94029','15723','17756','48141',
                          '78830','58720','15322','61385','53004',
                          '83591','90475','44320','31505','31572',
                          '31102','57858','49421','10055','30129',
                          '16894','17022','79929','30566','11835',
                          '70452','73526','85378','44072','48198',
                          '65143','93056','95816','67807','90537',
                          '10510','46248','87173','12764','13312',
                          '67492','72784','18526','59890','31853',
                          '88192','50521','58148','91773','65305',
                          '59590','44101','66964','45491','53597',
                          '80758','48436','70375','82047','50864',
                          '85564','34189','77910','13683','54926',
                          '98074','20824','35701','41338','98029',
                          '87315','24775','66378','74032','12523',
                          '14605','96603','80933','62766','95921',
                          '26571','13872','29408','80982','63326',
                          '30319','78104','24170','87724','47634',
                          '78559','23137','28702','96418','86714',
                          '48186','61652','92369','73377','97331',
                          '18874','57921','15027','92355','15778',
                          '24050','25589','28916','28628','46351',
                          '18969','34097','12022','51756','52712',
                          '83052','29721','60004','18271','10221',
                          '39958','46509','32890','37033','25714',
                          '38894','89080','53794','58995','83230',
                          '79084','87177','19159','44939','11006',
                          '92939','33004','86135','27922','69919',
                          '54601','40827','78602','92982','12628',
                          '24345','69297','18489','75046','80769',
                          '64056','17755','96665','24055','94107',
                          '64663','55887','92396','61623','67558',
                          '76851','47989','17761','18580','36274',
                          '37550','27038','30619','26711','51806',
                          '64057','38114','13390','39067','38550',
                          '33322','49512','30764','90893','24433',
                          '33066','11455','78430','32418','99310',
                          '35945','17604','55440','41472','82431',
                          '86976','49477','60195','86234','64981',
                          '41666','34147','15157','42781','62822',
                          '33161','78881','69433','21703','43810',
                          '46314','49592','63944','22928','29493',
                          '28287','36286','75704','33026','56177',
                          '52094','44129','49004','57157','70134',
                          '29422','64002','45517','21504','18063',
                          '69094','30967','31211','85767','24640',
                          '14266','29601','56523','68043','35379',
                          '41505','17272','22977','74200','15473',
                          '44647','91415','80470','95812','94231',
                          '17089','31241','47836','83723','46320',
                          '96798','33754','36841','47338','82241',
                          '11410','22866','41963','97041','72893',
                          '29913','13191','66664','83070','19365',
                          '41683','81049','51474','29928','34528',
                          '98759','36027','88141','92749','73771',
                          '33811','38320','89150','80826','46616',
                          '61818','72389','12918','63285','85890',
                          '32169','68050','20723','51420','34421',
                          '26309','17888','53479','96828')
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


