
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
                          '89671','46951','40973','55713','56234','89464',
                          '54820','18649','23316','10719','63303',
                          '77399','19594','41663','52346','28496',
                          '52295','53843','79106','77123','51936',
                          '42167','46855','15337','91269','49672',
                          '47174','87110','14074','23710','43268',
                          '63126','14426','25167','78999','72050',
                          '20812','48142','34992','40287','18734',
                          '29557','51351','70717','57238','33825',
                          '33522','89863','28891','93183','74984',
                          '76512','92061','61386','55212','18991',
                          '70950','75512','65886','61348','36725',
                          '89220','95272','48412','37380','42049',
                          '49774','98086','88158','10127','19703',
                          '48538','19314','91474','47679','97584',
                          '18975','20793','96758','10321','83159',
                          '61943','79198','96517','58494','99231',
                          '98073','20850','85428','53451','77101',
                          '79924','86020','91610','58446','44560',
                          '56751','62344','55157','12660','69010',
                          '91770','17442','36371','18430','70738',
                          '11707','61055','63201','42926','70464',
                          '59247','16109','61859','24855','44094',
                          '71404','35407','96359','31691','59295',
                          '90569','72007','39245','97433','50200',
                          '31483','97830','23033','42880','89252',
                          '14744','99055','64516','83226','77274',
                          '26904','82751','33422','35707','36675',
                          '18191','16396','35809','91143','56408',
                          '20361','27562','18638','96134','83793',
                          '59747','40367','55068','33962','46468',
                          '76195','35823','58879','41362','52026',
                          '60621','44640','61160','88048','21112',
                          '25612','54698','76807','59446','88807',
                          '65128','32916','42745','71969','63615',
                          '61810','50062','67691','72435','12188',
                          '66146','36701','47762','58919','24964',
                          '39659','96098','90415','46941','95268',
                          '30987','55486','96150','72559','57945',
                          '51924','38206','33909','19224','19365',
                          '80054','24950','81372','55992','27931',
                          '95033','10865','84555','95535','12594',
                          '90379','74904','13442','89455','69358',
                          '10686','86022','22375','69143','95589',
                          '97573','51143','52569','77975','51378',
                          '26574','28133','72817','26187','84788',
                          '16146','41861','26439','34001','25253',
                          '59822','94335','64966','11214','69549',
                          '62491','14287','96268','73074','76190',
                          '61363','22963','99366','90109','24301',
                          '47132','57814','33480','33902','97159',
                          '83652','91027','62717','34660','88960',
                          '84881','59622','11111','27552','40251',
                          '58873','87705','82317','11815','27727',
                          '56620','47032','16700','83751','61040',
                          '93034','45579','29711','51279','18845',
                          '64623','16789','99682','70422','20107',
                          '64031','67303','21209','47108','83877',
                          '73706','31100','30988','47755','83746',
                          '12484','17923','31358','55440','85685',
                          '38998','96266','22425','54347','65396',
                          '66213','85298','39441','84265','47292',
                          '80437','19275','11482','28611','95377',
                          '84955','37044','99190','35263','37235',
                          '62838','49440','80108','17670','25316',
                          '89953','43466','66628','76654','12629',
                          '60763','69288','63174','44093','10943',
                          '95323','23074','40532','64759','51010',
                          '92542','91314','23539','24235','98766',
                          '93384','38753','42391','90111','90273',
                          '63619','84216','78284','28235','62895',
                          '91197','77506','97286','94593','22746',
                          '11773','96446','92390','34255','15173',
                          '10982','33257','23596','41672','93640',
                          '66576','27018','78988','95228','15833',
                          '93711','16908','89975','36700','20534',
                          '98637','38141','47156','65944','57993',
                          '42886','34913','97133','58700','99336',
                          '73451','71090','92257','73951','66212',
                          '61651','26445','92548','79428')
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


