
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
                          '29557','40652','87653','62208','91773','16199',
                          '22603','29151','35544','88655','99375',
                          '89947','15976','67776','33536','44440',
                          '92646','25935','74736','70699','69216',
                          '47493','98799','83303','83227','76935',
                          '39427','46004','34047','53624','27553',
                          '88009','89924','60549','88412','66101',
                          '41113','69377','91429','91267','67243',
                          '98071','63483','58175','22252','35307',
                          '86270','67904','56777','36615','94635',
                          '37837','53110','54706','48381','48632',
                          '69249','51758','52501','92491','17984',
                          '24574','16010','40403','65254','43259',
                          '69808','45849','86875','83174','39937',
                          '67504','68970','98291','64850','76694',
                          '13668','39265','56321','98572','84032',
                          '60981','57076','76014','82531','49901',
                          '67670','24364','20464','69271','23501',
                          '61995','56902','30195','30907','52094',
                          '67499','32894','71390','87088','55850',
                          '73569','60475','37610','39011','47511',
                          '50263','74687','42074','62547','75194',
                          '52805','97190','54162','23741','70533',
                          '71844','38523','46727','61500','85299',
                          '16477','51965','37792','32751','28084',
                          '68933','79215','44445','14435','50755',
                          '86851','59438','79170','26398','97822',
                          '77210','50152','85532','55871','82708',
                          '66732','22387','14459','26059','61790',
                          '36575','23649','86373','97149','40757',
                          '27743','97838','63852','22417','64347',
                          '87093','82371','40373','60444','16811',
                          '92201','16980','15636','62387','99504',
                          '48734','48303','21360','68130','33721',
                          '75964','55476','28028','18158','55192',
                          '23240','18721','95354','25067','74205',
                          '38666','24082','49783','60298','24831',
                          '82653','75721','16577','61026','82669',
                          '84742','15912','96439','36235','56782',
                          '39363','16429','11442','52289','44977',
                          '26604','16192','49564','24068','64159',
                          '51739','15718','77055','13294','22963',
                          '62807','87842','25331','47665','47126',
                          '31026','62227','15229','67957','83306',
                          '60491','50919','14168','83899','11627',
                          '39030','58382','27780','84693','99090',
                          '30619','71623','78728','38316','61104',
                          '15666','80644','59747','78537','52821',
                          '93191','77724','46160','47125','98363',
                          '35292','81471','75973','75387','25135',
                          '12086','39450','41381','86572','52083',
                          '63011','36731','91639','96644','48455',
                          '71621','80493','27055','90294','32831',
                          '72569','40589','84915','76037','20229',
                          '25052','90638','33827','65350','18124',
                          '35107','29844','40933','77521','98370',
                          '20247','27006','89940','56146','70768',
                          '15868','60586','12429','51334','38616',
                          '66830','57597','30266','47011','83634',
                          '54628','57667','39120','47180','34077',
                          '27957','56871','52811','80341','53622',
                          '48213','22175','60086','98897','73990',
                          '89785','25634','23916','97146','30264',
                          '29269','24633','29881','10387','97621',
                          '58886','90981','92833','26750','21501',
                          '24173','63868','16951','27580','78421',
                          '73245','89121','29332','58035','64995',
                          '96720','31262','64867','75198','90524',
                          '24074','50324','22572','75069','30254',
                          '10217','76514','72376','98050','69684',
                          '26910','56089','36136','47323','80762',
                          '55091','31279','72573','81969','70013',
                          '71528','80039','56538','47958','89617',
                          '39954','46621','92223','46452','71543',
                          '92839','40997','53644','75480','42273',
                          '20375','63412','55635','24153','98371',
                          '17148','50508','27610','16512','34089',
                          '80743','71071','15327','70991','94363',
                          '94896','59690','30957','72437','46170',
                          '15709','88795','17088','69168')
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


