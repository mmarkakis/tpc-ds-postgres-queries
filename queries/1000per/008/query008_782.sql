
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
                          '54356','87819','54233','89372','13888','39517',
                          '65199','30049','52747','53672','46621',
                          '24184','42710','98624','96753','71250',
                          '56633','23473','50852','15226','91324',
                          '96069','22314','64500','82308','31245',
                          '13322','50962','82530','80396','58926',
                          '87485','65122','51089','18017','22796',
                          '87822','68877','40207','34032','25665',
                          '46280','59142','70729','51205','76941',
                          '62404','10325','16730','20673','23945',
                          '93314','92787','71978','81390','46743',
                          '54194','53448','72274','31304','68980',
                          '56313','16763','73189','93599','89567',
                          '17371','30454','94994','18670','74641',
                          '97968','45679','25483','32785','44233',
                          '66777','12186','18906','10489','50041',
                          '48223','63329','88139','69139','21967',
                          '20495','73958','25244','68100','99354',
                          '12017','81683','72766','12161','36999',
                          '26583','67040','82602','38914','50479',
                          '97416','87516','67573','13154','23315',
                          '43220','41500','62368','86625','95724',
                          '43185','14775','15713','79136','19580',
                          '94068','22221','30370','85920','98579',
                          '75977','51025','38626','85133','51123',
                          '82208','50135','33809','94251','39115',
                          '60875','15559','91217','29211','48922',
                          '29018','84514','35135','32600','46118',
                          '39877','50875','62792','83578','31331',
                          '48483','23239','52957','24812','93272',
                          '98925','59131','72112','96538','38450',
                          '21547','10089','55592','79869','66012',
                          '21754','12052','34295','60704','21729',
                          '46117','82103','33371','82176','72141',
                          '59584','62163','71659','84075','28581',
                          '64378','58745','96784','41230','42883',
                          '45455','62228','78871','72526','30516',
                          '29863','98073','17944','18525','80640',
                          '16703','35886','86672','18563','88889',
                          '11566','45618','78638','39777','30605',
                          '56590','91199','45779','34561','69405',
                          '82214','88271','40619','80229','22506',
                          '92120','19744','39925','54066','11885',
                          '77724','28484','72228','86250','17398',
                          '77526','64667','85969','43603','79253',
                          '20148','44923','60011','37439','88884',
                          '88523','87879','52435','39024','79623',
                          '22884','51379','39656','21040','98634',
                          '87068','29387','81042','88668','53999',
                          '34184','56491','24247','39796','56306',
                          '45514','26344','85535','40962','33456',
                          '34456','19405','96827','35083','71672',
                          '72027','27002','72444','11096','10707',
                          '98458','35205','25934','25772','77064',
                          '77745','55294','79484','99845','29819',
                          '33167','66139','43643','49165','24987',
                          '34687','67477','57749','20035','39117',
                          '16928','74945','17528','78731','66733',
                          '44260','36011','85679','48299','64779',
                          '40687','58545','17380','42421','79610',
                          '80049','30277','50558','88771','27855',
                          '14801','99971','14057','83899','28164',
                          '46972','70797','17740','12556','32587',
                          '46008','37985','28315','89472','46954',
                          '25860','83976','11498','79499','77119',
                          '70677','14869','23338','40477','39157',
                          '93882','30989','29317','34593','81220',
                          '29842','74149','48659','74140','26619',
                          '23933','32791','35757','77382','44704',
                          '40908','66135','85092','80981','85348',
                          '67021','38398','72222','21995','31445',
                          '37979','70588','40949','27025','34065',
                          '57204','21265','86929','60677','92460',
                          '12807','52475','90791','22206','75542',
                          '52463','58540','12618','36943','10034',
                          '94683','11758','13645','13664','75084',
                          '34201','47265','97858','55925','10937',
                          '62930','14340','52909','74381','96862',
                          '68091','53377','80654','91382','86723',
                          '73088','27993','71274','84720')
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


