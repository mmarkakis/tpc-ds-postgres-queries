
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
                          '30127','62352','73264','28698','18541','70272',
                          '78435','11024','43343','40029','70996',
                          '15476','32030','54170','57365','77858',
                          '62430','25699','40179','91578','42682',
                          '48427','25312','29401','93613','18779',
                          '45713','55242','85206','67621','52145',
                          '50652','97280','58371','61613','78665',
                          '93049','57440','89461','63170','31262',
                          '76122','32668','83881','18698','37884',
                          '99252','46078','94031','88828','43884',
                          '24290','16613','70204','90136','92699',
                          '73852','99613','49607','46195','40445',
                          '29212','29274','17671','98880','43602',
                          '55848','33856','72091','41246','25704',
                          '53267','83363','89318','55204','11150',
                          '45330','46625','23886','25709','13261',
                          '91677','48500','46370','91091','77667',
                          '35764','33309','54210','84289','65206',
                          '75656','40373','75592','13896','19089',
                          '21417','82750','77087','16994','86188',
                          '34296','93144','56041','82338','55746',
                          '64335','24164','77235','57576','92458',
                          '83796','46285','99551','72483','13341',
                          '91241','36981','94594','58825','13578',
                          '13574','25243','37789','33114','38363',
                          '36874','25639','10650','65658','56188',
                          '96284','71972','98856','93146','35410',
                          '67434','80170','55919','83651','91907',
                          '24179','77076','42613','74626','74707',
                          '65081','19808','26461','93187','74771',
                          '33018','59223','80645','64791','13822',
                          '16011','19057','83146','71189','41514',
                          '91194','18332','19497','81480','92134',
                          '88550','54530','47301','25781','81793',
                          '40655','10563','79614','36507','38388',
                          '81381','20214','24838','96210','23951',
                          '13027','12956','65864','50835','49793',
                          '24233','95735','41338','74419','50295',
                          '61740','82650','90862','70236','25848',
                          '86021','15501','77218','16482','11895',
                          '30993','64673','94757','79064','76169',
                          '81434','58818','87626','71599','11666',
                          '40841','95118','47166','94882','88257',
                          '26720','49255','67022','93145','85301',
                          '17349','70877','58266','11196','36261',
                          '52894','55367','17820','94838','62028',
                          '19368','42949','53852','51186','21920',
                          '24680','81090','66633','21602','85356',
                          '60004','47230','63663','29652','33896',
                          '16998','66901','90783','12034','74034',
                          '34957','69594','61648','52563','43347',
                          '35870','59638','67287','40325','78237',
                          '68828','68764','66443','71674','30711',
                          '97845','85880','99995','85872','46740',
                          '41690','75983','78601','18142','74194',
                          '86825','70467','18246','57208','81226',
                          '30062','13482','97940','69688','39359',
                          '22195','86798','20995','78014','29233',
                          '84060','33909','62711','99269','17463',
                          '26245','22862','34936','51287','35926',
                          '16686','73950','11771','81566','19993',
                          '93379','72067','36158','50034','98959',
                          '14985','99619','75460','50532','43233',
                          '83589','14518','99377','84537','24663',
                          '14826','37599','51929','48373','48532',
                          '14405','25754','97687','81123','55917',
                          '72609','46829','48087','81544','26415',
                          '66966','73202','62514','45804','22108',
                          '25660','75494','51055','11960','56653',
                          '28045','25353','69902','52252','24975',
                          '80092','36826','53775','14071','88651',
                          '25519','57095','14997','15946','75465',
                          '31464','24665','70087','59434','83903',
                          '69833','34928','90105','39895','76938',
                          '13337','99747','28990','74123','51931',
                          '63854','94710','82815','47328','33665',
                          '24215','23452','56693','53326','40844',
                          '45725','32319','19985','80367','10600',
                          '12233','34934','95873','65411','46308',
                          '10998','73776','35653','23588')
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


