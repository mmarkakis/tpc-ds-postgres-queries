
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
                          '46769','43729','20970','37096','33616','75374',
                          '55889','89707','28252','66358','10013',
                          '31444','76785','22658','51822','20709',
                          '15307','86054','99038','22049','85197',
                          '81493','96462','16191','19623','74129',
                          '22683','55894','69957','58486','65956',
                          '37624','53739','47223','34827','21497',
                          '27944','55602','50524','58343','24325',
                          '12736','99151','24829','13394','96616',
                          '84501','71765','71426','30752','16547',
                          '94290','82937','98671','59191','71217',
                          '32860','69064','42250','95828','85707',
                          '13343','83060','33001','92475','18936',
                          '16132','90090','77929','19819','84315',
                          '62173','25581','48231','88112','70655',
                          '58369','33174','40413','31722','34819',
                          '96189','74401','25310','80710','69328',
                          '55043','72887','84896','20545','86954',
                          '77505','42045','36029','29575','41996',
                          '87821','26425','57212','31700','22254',
                          '76410','13495','49480','25102','77660',
                          '94684','63826','68811','61694','53280',
                          '56944','83255','51223','67618','98885',
                          '23162','43315','95500','97689','67586',
                          '92529','74026','62455','79297','82545',
                          '25448','69050','55876','15542','51070',
                          '73667','12920','45464','14151','57700',
                          '76418','55092','80597','75609','58508',
                          '80229','13916','50554','32037','18354',
                          '22824','83067','63514','77136','51688',
                          '49026','79150','70657','66859','36882',
                          '64284','75637','67078','22148','16429',
                          '27477','69461','22116','39668','69977',
                          '48608','82025','47289','75896','57230',
                          '91956','18949','33858','63669','82929',
                          '32070','91227','86190','42711','16238',
                          '74079','95928','46121','18956','62022',
                          '74422','91715','97318','24145','41858',
                          '46970','60575','11787','64573','31611',
                          '12365','20752','28148','63937','22569',
                          '56435','59876','74844','17996','96919',
                          '13772','55078','96386','10358','61227',
                          '94480','74039','94547','87053','46032',
                          '26995','63142','35091','42656','11770',
                          '12803','21869','54425','80052','21473',
                          '18017','57548','12256','79413','88822',
                          '16622','15119','52491','35361','48963',
                          '61943','81441','16861','73553','34766',
                          '35774','83928','57357','79108','48188',
                          '33514','54223','63266','12005','66282',
                          '22610','60519','36870','69356','49512',
                          '54052','78295','60093','72131','60106',
                          '63298','95699','25525','94422','29272',
                          '74487','76111','46324','38698','18812',
                          '48012','53629','18339','67970','50327',
                          '89043','21468','60986','49942','35095',
                          '77104','27994','23971','53462','76210',
                          '60628','25785','29994','64823','93737',
                          '99095','68034','78826','30647','78902',
                          '41834','85030','90811','15726','41369',
                          '61098','60226','83750','86800','82592',
                          '73255','85808','19898','33733','86007',
                          '26270','77386','47558','14636','89248',
                          '99403','54437','78966','90442','69856',
                          '91635','84356','71011','14022','94018',
                          '21055','51943','45301','86122','68793',
                          '61301','33867','78039','65442','87496',
                          '63345','81760','31046','41030','55958',
                          '75282','85570','87431','50974','70198',
                          '83413','32138','65498','93236','43042',
                          '37235','58820','46641','98795','29796',
                          '90149','12234','65297','81268','80128',
                          '83923','59746','81462','71055','63317',
                          '15685','40406','42870','11116','29076',
                          '23075','61236','10168','50220','27625',
                          '19654','98788','61457','23253','81610',
                          '29503','54448','78865','35088','52814',
                          '42936','76204','41540','69584','55331',
                          '87084','18220','95479','37746','43464',
                          '95106','25833','46628','18918')
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
  and d_qoy = 1 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


