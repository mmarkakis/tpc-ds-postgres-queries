
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
                          '20118','55487','13788','45861','86257','20622',
                          '57727','62886','96495','48967','69947',
                          '62464','66473','68309','20819','33555',
                          '91915','68189','35891','81718','80496',
                          '24549','66597','89840','89537','71519',
                          '25860','30836','50774','77734','10943',
                          '22180','46182','28406','82327','24904',
                          '37440','60432','73853','18489','26294',
                          '44249','66726','23437','12592','16919',
                          '93058','41615','39401','21034','43301',
                          '57165','31565','94032','94589','54974',
                          '53706','50311','24382','45649','73190',
                          '35044','87661','11004','59942','16264',
                          '33215','38637','56257','40697','79696',
                          '60729','24179','86403','92198','73490',
                          '13265','74919','34682','71425','15847',
                          '15783','28131','97931','20845','32677',
                          '76656','96245','68345','38721','46967',
                          '77259','86562','49850','72601','84981',
                          '66396','77138','90599','91043','68407',
                          '78533','68434','37572','75277','81411',
                          '65280','12941','81120','29900','74890',
                          '20738','79547','28394','17801','86505',
                          '76091','54918','88333','87391','47634',
                          '46216','13623','86790','39743','70048',
                          '46920','18490','37601','73577','92934',
                          '87425','81978','30264','86187','18663',
                          '23839','38948','35562','87088','64528',
                          '41692','93091','18946','18329','91439',
                          '85880','49355','64732','33278','80060',
                          '29672','15018','14767','47746','94271',
                          '37645','52046','98167','98494','40285',
                          '13926','72094','68053','66066','45094',
                          '33409','11478','23148','12128','87390',
                          '65700','16321','88959','37564','22261',
                          '78799','69668','43167','34278','37277',
                          '79705','78091','89429','26385','34733',
                          '86996','22622','61330','87969','63871',
                          '19375','18149','84365','49372','51230',
                          '95425','44215','51370','71648','54324',
                          '53084','21662','17379','17222','97784',
                          '36388','33104','35276','87794','13927',
                          '53750','54163','28757','49470','89852',
                          '80251','67154','49744','75894','64270',
                          '80093','72338','40269','77563','20101',
                          '23901','66230','83467','54380','56518',
                          '23623','63601','81270','39720','64722',
                          '78047','84717','53134','41359','96437',
                          '45156','67694','32991','20580','87916',
                          '54406','91862','43734','21357','67468',
                          '44571','54721','56428','69917','94631',
                          '27250','33964','49975','86065','76119',
                          '91870','31353','81508','15088','51149',
                          '98972','96904','76836','77477','13164',
                          '47711','85550','93139','43728','49449',
                          '76175','32933','92293','62361','26331',
                          '49387','97698','31986','21001','13220',
                          '37802','49276','92156','97980','35614',
                          '34174','15341','82506','28109','64905',
                          '10791','69235','84692','92354','58342',
                          '22863','73918','12476','18513','72691',
                          '76296','59365','78870','47431','40547',
                          '65536','72733','85418','97923','91965',
                          '48696','61620','93288','44231','78948',
                          '73820','72621','34467','49035','70588',
                          '11587','17343','72032','75829','25983',
                          '14683','15714','64301','99171','55008',
                          '46207','80092','55010','93630','64683',
                          '44652','22854','90810','44044','28107',
                          '71323','65648','61025','83127','33407',
                          '38870','37423','27053','97217','87941',
                          '35195','93086','45591','32109','89963',
                          '24762','37615','21089','31645','27578',
                          '86033','45555','49404','46293','82809',
                          '88535','73489','20822','49574','38697',
                          '31342','76700','18002','68952','64385',
                          '51542','30147','13176','16383','18208',
                          '46303','81883','33056','16438','11777',
                          '46338','60134','58435','60732','45432',
                          '23742','24908','66343','79606')
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


