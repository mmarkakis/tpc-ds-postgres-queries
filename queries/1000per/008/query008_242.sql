
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
                          '20661','73455','92458','17585','24054','23771',
                          '23136','80507','39739','77599','36289',
                          '64458','62775','82646','67190','38236',
                          '10262','21019','41556','46439','67144',
                          '39067','85676','16016','96648','45515',
                          '38550','51388','24375','29663','45308',
                          '16576','66266','65870','96359','22186',
                          '27626','35357','17591','21376','16211',
                          '59653','27792','20179','45386','57034',
                          '12243','80957','82672','25080','56657',
                          '55054','66506','34781','83826','46879',
                          '97383','51932','71275','95232','54044',
                          '58397','43169','69665','31900','98398',
                          '21596','40149','28068','75596','62801',
                          '66042','47254','74349','22122','12741',
                          '26598','73054','92181','77343','24831',
                          '71972','46723','81237','80276','60087',
                          '40238','38944','47090','92897','16344',
                          '52928','93763','49561','97562','12061',
                          '71475','78035','42548','41481','70518',
                          '60739','30889','43596','88898','30859',
                          '76574','35382','81964','59963','38732',
                          '26339','50549','99312','36263','99063',
                          '93280','58795','53117','37809','66807',
                          '19682','48584','83912','96383','78214',
                          '75048','54098','92601','64772','77752',
                          '74676','15506','29952','55810','35833',
                          '46043','71692','29231','75931','32489',
                          '23461','96524','30720','13760','81238',
                          '19341','54046','48264','10300','47161',
                          '26335','66513','80136','23735','52894',
                          '85182','54194','62974','53532','63062',
                          '66104','14678','35274','87599','35030',
                          '13280','43927','38888','63201','47929',
                          '46649','94505','81168','66441','76523',
                          '53478','82842','99103','39178','61313',
                          '16724','70244','51581','19487','48671',
                          '17661','69061','48016','81341','93762',
                          '52673','52668','72464','69001','51887',
                          '77260','90183','44922','23584','11879',
                          '14196','93465','58429','48547','44624',
                          '26015','63853','76920','53962','88063',
                          '75531','14290','63654','83316','47159',
                          '21516','32264','84301','53592','42739',
                          '63212','71267','15716','54107','32499',
                          '72473','35882','91867','55328','83670',
                          '77162','30528','78223','99781','13493',
                          '25232','45686','37622','81988','12595',
                          '92426','79182','70124','69559','31529',
                          '44881','92491','27509','82426','20092',
                          '58604','79410','12377','44900','96149',
                          '78736','69547','95137','68880','98796',
                          '60211','11298','52390','13351','24952',
                          '44168','13627','93042','87728','22967',
                          '83613','36060','23670','84805','37455',
                          '20389','84604','43748','75928','79809',
                          '13586','32087','97445','73187','28443',
                          '59349','67687','97114','82811','71034',
                          '94421','62361','90821','94303','14932',
                          '23093','98492','25497','66215','46317',
                          '94977','33037','80893','33849','28747',
                          '25496','48359','62401','25634','99429',
                          '76563','20018','31104','41300','24694',
                          '84258','70765','98722','36804','47385',
                          '31308','18807','68654','18972','25335',
                          '33301','71654','81263','68804','36522',
                          '36101','48354','65320','30302','52265',
                          '30749','53590','54071','98649','42856',
                          '82016','21463','15955','98424','24623',
                          '71719','79327','73355','72642','22891',
                          '11340','62965','86199','28477','99938',
                          '62269','92497','33615','55196','33526',
                          '91002','84829','40527','11061','30073',
                          '88979','40042','42345','92223','52423',
                          '46717','85669','53922','37554','79701',
                          '56084','14268','10389','56120','44608',
                          '22354','74781','78933','50220','18918',
                          '59952','78132','26599','23029','73313',
                          '24395','25795','91687','77995','31498',
                          '45582','89202','17354','72029')
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

