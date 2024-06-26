
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
                          '99115','17749','89249','84040','53576','26529',
                          '56793','34211','48133','75792','74121',
                          '58343','19762','33001','33275','35967',
                          '45717','50790','31930','34583','50785',
                          '30802','37352','88414','86714','84668',
                          '93888','95113','85104','98578','72680',
                          '54006','53106','28731','98296','74149',
                          '23947','22644','65360','12033','80839',
                          '90527','47244','95058','65909','83552',
                          '98336','12915','27862','24512','53137',
                          '69344','76933','34466','62224','56618',
                          '21224','12911','33623','77204','48640',
                          '53474','19962','93824','40068','60565',
                          '97355','72596','24647','72450','42039',
                          '27349','63987','78644','62274','49521',
                          '93678','82274','13159','42361','69218',
                          '65593','18015','22228','64435','36473',
                          '72611','64325','21007','44746','50228',
                          '62416','16809','22224','88721','31841',
                          '89248','33709','49390','30397','26818',
                          '62144','35527','16800','25250','99396',
                          '89441','78044','35075','24410','11212',
                          '41360','41675','52443','24434','71592',
                          '46660','50978','66505','25424','59099',
                          '72471','71718','57160','96770','46907',
                          '40282','43197','73443','75368','72837',
                          '55320','83005','30835','52674','79252',
                          '86302','62742','16192','12687','35770',
                          '79925','67936','26632','25593','64199',
                          '59271','24645','58901','43396','44474',
                          '82474','88803','95886','75395','53970',
                          '42786','44729','17027','23310','35747',
                          '58528','13223','81511','71858','98577',
                          '32271','22819','72251','34446','62911',
                          '27771','18539','94029','26534','95915',
                          '98975','96352','31002','80569','22302',
                          '86550','53296','23085','42378','37744',
                          '76807','15595','51845','51098','69399',
                          '86246','15692','35331','23283','26636',
                          '55929','61343','56378','93585','63743',
                          '49760','12163','89114','71009','42513',
                          '93499','65956','71678','78715','39272',
                          '74753','67772','52856','28130','95518',
                          '72866','13079','13317','85128','43434',
                          '72481','23152','96539','84330','31562',
                          '33195','39754','89548','76257','65748',
                          '47263','23045','94205','80310','98895',
                          '98283','22056','74288','50747','48444',
                          '37138','29367','88980','82980','54882',
                          '32045','71297','65694','13979','67332',
                          '54731','82459','92203','18693','50236',
                          '92186','15430','49860','97598','43179',
                          '11164','66090','32787','49068','11544',
                          '49493','63476','33447','54260','11835',
                          '29408','97037','24657','52347','28782',
                          '26567','26492','43417','45551','45200',
                          '47046','44813','23036','83170','46616',
                          '21384','42946','78569','87613','84309',
                          '22534','14133','84038','75877','80797',
                          '68893','55296','65747','62708','35794',
                          '65823','96328','22196','76072','21110',
                          '21538','79337','92994','30575','59893',
                          '95529','50809','72109','21029','50546',
                          '99085','99478','64993','20403','66311',
                          '84411','98187','59896','24283','30727',
                          '30766','38388','16208','77130','77376',
                          '58051','28581','86567','94555','33634',
                          '72773','16881','42075','71053','11105',
                          '94403','19346','70297','39591','30110',
                          '43721','52456','80449','58845','62584',
                          '79878','83449','63001','48040','10077',
                          '64525','40124','54936','75628','65203',
                          '44502','48135','65368','84931','47137',
                          '88058','96868','49819','34304','60813',
                          '22784','64640','49589','92876','60490',
                          '19563','76551','10607','43083','73528',
                          '42175','60828','46231','55532','39344',
                          '67807','64888','32834','80696','60304',
                          '51434','66932','43581','14371','84345',
                          '35564','41104','38552','69064')
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


