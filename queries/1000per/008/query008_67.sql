
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
                          '83737','36029','40235','95856','72200','26082',
                          '25932','99443','85259','92313','22556',
                          '48187','89213','66538','17085','43961',
                          '41690','35139','24026','71573','95108',
                          '87071','68534','10032','76312','51084',
                          '19109','94028','98012','29146','94628',
                          '73335','64619','78720','96098','12388',
                          '85923','98986','22711','73555','77203',
                          '46287','16113','90199','16493','26028',
                          '31849','36165','40841','63427','60173',
                          '18569','22108','18873','92168','52614',
                          '46244','54552','43170','30132','98822',
                          '28607','94007','20604','35990','35201',
                          '70844','62390','16962','69114','77829',
                          '51656','56585','53153','19346','64925',
                          '37538','51072','37485','96370','34086',
                          '82573','98536','34215','36445','22212',
                          '91842','58567','45897','21470','76343',
                          '83491','23322','14981','30326','60335',
                          '83031','35672','70551','76363','17875',
                          '41756','69858','85014','34752','83388',
                          '65548','34922','87877','43669','23072',
                          '71886','77868','92884','47719','84929',
                          '72528','48181','52987','75584','44094',
                          '14849','49910','32063','47150','87708',
                          '71183','84051','54640','45031','23988',
                          '78006','49356','57390','93816','47758',
                          '55602','92057','79711','28803','11696',
                          '83202','76598','47585','27189','71352',
                          '33549','47945','36757','58480','66467',
                          '70718','31715','83379','77625','90569',
                          '97111','75113','34879','51651','49058',
                          '82624','74570','20119','71845','41272',
                          '12652','18536','37072','94005','33019',
                          '29543','72635','34997','42319','79276',
                          '13402','99053','93599','71540','21598',
                          '24302','98783','98409','47139','54466',
                          '53926','56639','99848','33281','11608',
                          '76771','24100','25090','16096','59429',
                          '76742','33680','37290','64258','33357',
                          '33722','41947','96225','20060','34278',
                          '72343','66429','91975','49070','45396',
                          '14693','53345','13858','43348','68091',
                          '98931','66037','39687','71765','82486',
                          '11768','35022','36494','13579','42560',
                          '10319','84874','42052','42185','17463',
                          '97810','69034','96681','12357','87420',
                          '53745','80828','80469','18904','17732',
                          '32910','42469','25060','93496','27792',
                          '85971','54548','41922','61192','62037',
                          '33011','43198','25510','91981','51818',
                          '38299','33461','99267','62429','87804',
                          '53117','14498','88476','43571','71099',
                          '26204','95927','36083','75177','27667',
                          '23424','48492','92307','17760','62772',
                          '39754','66629','77087','86928','27023',
                          '60807','34797','89886','57179','12515',
                          '76021','65819','23135','17247','50480',
                          '43131','41126','61806','63836','95843',
                          '66209','48599','46609','99817','50370',
                          '49755','63600','33928','63094','78911',
                          '36923','56245','77651','14082','72285',
                          '80934','75331','43960','46230','34707',
                          '23579','58498','28819','83140','80744',
                          '89182','80149','26709','46124','84413',
                          '44898','91140','10077','76104','55364',
                          '55048','30055','62818','66920','34894',
                          '24087','71148','95254','57544','92515',
                          '69367','55986','61536','69327','28389',
                          '11119','46535','23380','83747','28682',
                          '50816','71805','89977','87226','88714',
                          '36434','63498','26752','75702','86903',
                          '37211','85393','92517','33856','46057',
                          '27444','45501','88466','14559','10999',
                          '18062','81208','62496','36517','78293',
                          '78209','39903','21447','26333','32353',
                          '81981','29019','45255','66932','82946',
                          '56498','59464','19746','84138','88210',
                          '16498','85244','49870','70824','66687',
                          '53662','10087','13517','93680')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


