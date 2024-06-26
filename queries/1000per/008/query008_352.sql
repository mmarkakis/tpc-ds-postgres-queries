
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
                          '60772','42553','64828','23994','14495','63853',
                          '79239','37652','95708','72092','27238',
                          '83235','80633','42635','27454','56883',
                          '21585','56576','32187','27303','65285',
                          '43078','49703','89998','97203','67711',
                          '35441','33106','62085','36757','38963',
                          '18935','69186','72558','82167','60430',
                          '36379','83238','46301','66204','97424',
                          '94806','35199','31233','50486','92227',
                          '51557','86077','25288','18329','10830',
                          '19067','40568','54547','23412','48015',
                          '13348','33665','26476','84136','98714',
                          '17302','66860','73321','72372','71354',
                          '66601','80851','36738','48591','87352',
                          '10211','79300','32622','48735','22479',
                          '23316','15405','22966','32317','69765',
                          '36285','74204','52338','80271','92500',
                          '79965','50205','42214','21179','14242',
                          '61494','26255','60380','53777','76911',
                          '51404','54147','73855','60350','68700',
                          '46231','79460','89028','23258','78754',
                          '22383','28749','88053','50311','89299',
                          '24675','54340','59718','94542','28106',
                          '52415','16871','67857','31969','23233',
                          '34350','57180','49701','46307','83111',
                          '15847','33908','36400','45979','77660',
                          '89245','36317','25068','62167','93255',
                          '75734','57002','72067','98196','79113',
                          '50727','52904','90523','91880','18179',
                          '61398','79053','99115','90308','91675',
                          '97207','95362','67021','51930','37805',
                          '44858','89549','80545','59841','61821',
                          '48494','92748','75158','54984','80764',
                          '88183','63637','79505','69270','40798',
                          '50219','91435','58570','11987','23842',
                          '37665','54531','60639','41819','39191',
                          '73615','54310','82127','23306','79984',
                          '70256','49856','83912','84557','98042',
                          '72940','85260','95366','25624','86460',
                          '20201','49497','42601','84141','15121',
                          '59542','48092','17956','50109','54149',
                          '88339','91856','61008','51422','31071',
                          '46744','89712','94217','25442','93882',
                          '34184','65567','84297','21167','10870',
                          '38580','40739','70478','68864','14767',
                          '42496','37609','34115','69928','96681',
                          '70739','27399','26715','38139','57676',
                          '70109','34642','68217','55560','82531',
                          '91666','30525','80132','24884','69518',
                          '64504','23508','86049','89056','81167',
                          '36745','48177','41761','96443','58271',
                          '41979','43246','39930','61593','11779',
                          '29621','60758','79225','84625','31887',
                          '72426','32338','97280','13964','56777',
                          '73423','82391','76908','93327','31455',
                          '90014','23224','95508','73142','67166',
                          '27084','99038','57276','31104','11067',
                          '11706','24704','75441','95392','89005',
                          '86772','24985','82246','55809','70886',
                          '83981','25801','28822','51621','88413',
                          '13192','12956','52316','26802','51048',
                          '13603','87774','13148','40372','22128',
                          '91187','73122','19582','83125','41636',
                          '76365','87091','53675','86926','38976',
                          '97220','41142','61225','93368','99721',
                          '40010','10102','16051','87052','44826',
                          '47445','95854','80716','17049','83451',
                          '42542','76592','44448','64802','61693',
                          '18551','28512','94298','69074','68358',
                          '77492','17181','45692','42034','83500',
                          '70541','60228','22143','53069','34805',
                          '76901','75113','53791','56983','65502',
                          '75428','77535','61936','76460','47525',
                          '20330','90081','79909','78321','54905',
                          '66519','87231','85736','14649','18489',
                          '81147','95757','77941','82848','47358',
                          '76470','29730','73032','10190','88821',
                          '61929','84698','11173','68967','24633',
                          '73957','71571','58397','45072','93250',
                          '59324','27730','36877','52656')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


