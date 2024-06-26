
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
                          '45515','87299','56363','15001','50913','34935',
                          '15983','46958','61370','61164','30387',
                          '99103','81654','61171','15817','80050',
                          '38844','21832','57603','54756','72262',
                          '55400','73096','91540','76050','92835',
                          '65127','80486','12895','56366','86266',
                          '75004','73539','80216','34833','85203',
                          '70778','68539','71124','93710','97030',
                          '41565','69340','86000','22466','59478',
                          '26223','84212','75280','27466','55355',
                          '85043','53387','98275','54338','29820',
                          '40217','43246','75061','81360','10119',
                          '47858','99453','14220','45294','92798',
                          '75560','81777','71642','80647','94413',
                          '56120','75970','45933','16501','89367',
                          '14459','59964','61879','59223','99008',
                          '45569','32335','20068','50303','89060',
                          '46791','80824','94703','49621','55567',
                          '55926','25745','20014','26667','61897',
                          '39225','26891','41738','44473','67791',
                          '94868','23423','21646','46657','43323',
                          '30446','18215','92175','77798','63162',
                          '13502','44398','44081','98568','61387',
                          '67638','65653','87681','90490','32328',
                          '32545','90871','71471','30314','47157',
                          '22705','22881','83427','87428','25959',
                          '28130','17383','12674','83601','74324',
                          '49879','22682','43809','93127','21911',
                          '37706','88666','36172','10134','48011',
                          '72166','60173','11721','21447','90203',
                          '84355','18972','78535','71041','86721',
                          '29265','49747','38417','99553','11277',
                          '42568','96999','56774','55403','39532',
                          '11353','82818','63489','54643','48269',
                          '14990','65167','90822','89749','43888',
                          '43925','79361','84381','87307','25944',
                          '70779','92059','69204','22766','82181',
                          '13276','64167','20508','71939','22767',
                          '98463','29773','62354','31764','24745',
                          '21102','17403','50275','53064','38236',
                          '65667','25185','77331','61836','90319',
                          '78696','48403','56340','33399','99524',
                          '53859','90840','74895','43659','60088',
                          '80852','76695','66671','46472','47676',
                          '58931','26262','33578','87923','32546',
                          '59984','25628','44512','84504','34856',
                          '62286','80692','14266','68978','74590',
                          '97495','44752','69875','37756','64310',
                          '41924','64869','85437','14457','69103',
                          '52266','29718','83103','95361','67847',
                          '52914','41770','30276','54742','30617',
                          '94116','31552','46371','49738','79169',
                          '22938','62369','82472','48098','80094',
                          '28412','22231','80428','27697','66672',
                          '14879','77751','44941','91017','30788',
                          '19385','63433','80559','19657','54500',
                          '63887','18995','75451','72002','48870',
                          '36758','25890','14870','72604','87323',
                          '92492','89377','43775','93384','88773',
                          '87594','17277','79043','47283','24063',
                          '57026','73611','57913','86138','13056',
                          '73962','57722','61216','66096','33495',
                          '65950','57568','95382','98037','80183',
                          '72761','94165','36225','67801','43060',
                          '59604','64613','54940','75312','46980',
                          '23160','12431','33776','59750','77029',
                          '33686','51090','86445','45287','16260',
                          '96074','34692','36570','56317','28827',
                          '95213','70832','65160','19069','56782',
                          '79385','83798','57042','65733','16010',
                          '27499','91482','11414','15201','95705',
                          '40064','30620','80924','71275','88180',
                          '60041','28337','25220','95905','63067',
                          '64450','12868','42573','29094','90794',
                          '94297','67051','36523','93308','91787',
                          '26212','73635','20660','95258','29087',
                          '66997','81050','72276','88458','80629',
                          '69164','52009','90965','84242','84470',
                          '53966','97797','64305','51427','74387',
                          '63769','87296','93814','65517')
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


