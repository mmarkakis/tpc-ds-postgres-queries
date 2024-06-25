
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
                          '88085','81114','93608','58407','13585','97067',
                          '22377','61726','48990','95943','64546',
                          '24860','65117','95671','71751','21773',
                          '23367','89892','44147','73914','60814',
                          '91173','32229','30886','19959','73440',
                          '69593','93724','96379','70864','45330',
                          '33246','47314','33816','74166','28169',
                          '73387','24363','88660','74223','43937',
                          '10751','57096','22515','91112','14343',
                          '99665','26186','65554','58252','80854',
                          '44457','96072','75009','35173','35206',
                          '78715','41077','58946','60561','51447',
                          '69749','87751','42052','75385','27807',
                          '94033','65122','76929','25048','81705',
                          '42957','10571','56689','88209','57933',
                          '27879','23745','46231','49756','93370',
                          '43214','54880','48900','82067','62985',
                          '95895','41989','32530','29012','96567',
                          '79530','99262','40039','59258','25490',
                          '47042','82856','57714','82175','32542',
                          '22934','32830','49190','43519','43030',
                          '56392','89386','64875','48138','86006',
                          '98981','84268','42034','66344','84194',
                          '34055','12158','63778','53628','23538',
                          '34808','64451','81993','38982','38010',
                          '16670','82441','75535','37033','29130',
                          '59088','15719','30024','21031','38461',
                          '28821','77895','62762','20054','43559',
                          '65242','82768','17376','18705','49294',
                          '38675','82240','57532','29032','13396',
                          '87713','73400','45940','96340','15291',
                          '62322','59843','34113','40220','54332',
                          '47031','25831','21620','58849','58715',
                          '13311','95094','53184','38275','49944',
                          '82195','86207','66163','87875','44211',
                          '83705','72015','98879','87002','14154',
                          '12905','50954','57961','89855','73405',
                          '99055','64648','22943','27942','18827',
                          '77714','48254','19791','57573','89592',
                          '99890','28170','21333','28963','34281',
                          '48198','43172','73214','76971','27473',
                          '16976','83147','77296','56427','34538',
                          '73764','34069','86609','33636','87381',
                          '69635','87288','11638','24267','59994',
                          '35365','20642','19464','57685','32564',
                          '44847','95481','30292','77774','79981',
                          '61045','45858','84629','92006','58600',
                          '95771','54510','83740','59200','78101',
                          '28887','80702','89323','64474','55924',
                          '63716','17547','21750','63898','76193',
                          '63758','12307','21435','88331','53721',
                          '20555','74620','19328','39733','10157',
                          '68070','31862','40154','67652','34255',
                          '51431','58660','43100','66081','50455',
                          '16722','76571','45592','55964','51709',
                          '39384','64683','89675','25568','92454',
                          '22532','78117','57684','12974','32832',
                          '43393','57722','57973','14168','48779',
                          '75208','45034','45760','27220','71885',
                          '42603','83786','78349','44520','34305',
                          '57049','64685','22035','43883','29948',
                          '31100','89477','94711','98756','45789',
                          '71085','44236','80027','63608','56255',
                          '43969','41843','46632','38449','39508',
                          '19987','64571','47442','91119','89997',
                          '57446','73550','42038','44437','64460',
                          '13743','86122','78092','10563','13802',
                          '98333','64905','67891','64647','21471',
                          '53118','12767','37445','97270','17383',
                          '79764','86685','68595','40857','63280',
                          '76052','33652','45112','29779','47473',
                          '35011','19101','54744','49925','41316',
                          '40788','39574','78235','18421','62975',
                          '61119','13624','23086','13260','42120',
                          '41302','80309','37180','73032','41015',
                          '49745','31771','60152','61115','69040',
                          '19546','13512','20889','48184','27952',
                          '51305','66431','22902','39853','49465',
                          '40339','23848','11378','26066','72045',
                          '87466','67255','10233','84983')
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

