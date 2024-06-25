
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
                          '98704','48185','64970','66362','86440','18543',
                          '77447','25854','46180','35713','36057',
                          '87714','27956','44933','76532','36579',
                          '82446','37374','76904','95088','44917',
                          '91562','45774','23147','52132','18850',
                          '70611','43562','52515','42719','74710',
                          '96177','56579','54079','78024','96929',
                          '69189','75760','28272','61905','77720',
                          '54533','50891','89954','83815','29297',
                          '64329','32308','59881','36854','69220',
                          '97193','35441','20136','46496','61096',
                          '38811','78862','53301','42080','35840',
                          '80472','69138','66786','63192','45311',
                          '28575','61337','76519','76967','89308',
                          '56587','77651','31861','51492','22871',
                          '38697','74209','10860','71239','81108',
                          '73734','89116','45767','80601','55331',
                          '93221','68470','28645','87032','76983',
                          '27887','56602','70595','81798','17654',
                          '26642','64014','46011','29149','33514',
                          '15712','78578','41814','38514','20587',
                          '53931','68919','20904','68978','88137',
                          '90890','80426','72914','46070','46055',
                          '61497','58387','13403','98890','20230',
                          '76521','38476','67398','20761','60483',
                          '83812','19612','27953','85624','93260',
                          '81535','48880','66905','32741','49598',
                          '27213','39028','39873','25478','26375',
                          '26535','95816','23423','85807','26075',
                          '67595','70383','10893','42153','98882',
                          '70237','14090','20016','57017','56810',
                          '49474','83691','42522','61917','91515',
                          '36063','22047','39592','74765','19187',
                          '14492','23066','90230','96984','30558',
                          '96869','71582','86932','95580','91859',
                          '67862','12531','60124','59287','18708',
                          '58369','21178','75469','13457','97853',
                          '59316','25506','16315','77957','88258',
                          '46513','35098','82125','55428','92456',
                          '49099','86611','27962','56605','92878',
                          '84407','43691','47508','98744','62443',
                          '99663','68587','64006','67283','88251',
                          '70256','39448','89805','76159','40222',
                          '86029','80347','14451','31094','25990',
                          '83219','12662','10138','62706','67049',
                          '39441','65461','80832','26529','10545',
                          '95622','92466','62436','50278','83644',
                          '48890','37008','16683','23687','68854',
                          '25402','13041','94510','62574','31817',
                          '86799','58906','63892','49724','81223',
                          '54814','72472','53140','35254','97514',
                          '89177','51948','46328','78576','54749',
                          '99304','97429','34035','38765','24635',
                          '78663','41409','29851','75012','14579',
                          '90572','75993','86173','43699','59037',
                          '78603','56569','99585','82207','50939',
                          '92804','14975','77304','32624','83344',
                          '60257','76216','51980','39825','50816',
                          '25189','45929','68933','67276','86021',
                          '58172','30277','25679','25660','93827',
                          '93422','59284','71099','53114','18288',
                          '96987','72387','69909','34000','54736',
                          '14287','67689','53211','83460','88458',
                          '94100','24069','92093','38364','33976',
                          '39733','68566','42184','59731','95377',
                          '36661','23283','63664','43799','23105',
                          '55287','96571','79028','50867','71817',
                          '45988','56679','95080','37358','75830',
                          '43306','75770','31547','95618','30572',
                          '67513','96572','19763','75936','17288',
                          '40952','92655','11824','41611','97416',
                          '66808','20984','64216','10985','40019',
                          '44987','30218','39861','18693','27335',
                          '45798','37313','11455','81990','30367',
                          '62360','20389','87786','67453','53428',
                          '90585','43929','29031','82212','20321',
                          '70354','25275','38334','91830','83180',
                          '64705','67391','82880','53578','69322',
                          '28794','64234','55018','23090','98394',
                          '24873','86448','91935','38633')
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


