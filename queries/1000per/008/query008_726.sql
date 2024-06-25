
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
                          '78305','87654','10592','45949','55229','55442',
                          '47697','76972','72171','10654','16645',
                          '99242','99107','38745','23687','32998',
                          '59876','23535','44303','38478','93088',
                          '23482','15434','91085','74972','16169',
                          '54670','77670','40690','21662','55100',
                          '98267','27659','89335','24138','94659',
                          '32699','49887','41417','26217','66000',
                          '13147','91985','95815','40161','40323',
                          '78671','53284','70377','89962','18658',
                          '15133','64365','62368','91873','44180',
                          '11545','65288','22371','33173','62912',
                          '74733','99562','55180','62745','68086',
                          '41727','42850','36282','36143','25798',
                          '83302','63574','18181','75555','72527',
                          '17547','55273','32928','81747','24979',
                          '42598','80699','90829','89246','50629',
                          '54309','26363','71990','64387','32270',
                          '25672','28892','23674','54493','61814',
                          '79582','92246','17893','36817','56177',
                          '12233','93868','12775','23193','79712',
                          '81860','22282','12171','87372','84393',
                          '63701','87132','93590','92677','45868',
                          '64736','74218','95746','32798','16176',
                          '90859','56462','76650','49117','34758',
                          '64264','13830','76745','92315','96405',
                          '57856','71642','21865','71829','21842',
                          '43584','30516','58182','23336','63115',
                          '13778','24375','76096','24096','88755',
                          '79110','32495','16125','89058','34622',
                          '81375','59870','82338','46557','90804',
                          '66998','61956','28240','62371','33914',
                          '95786','34566','10421','24729','19842',
                          '86646','84151','93203','69511','11605',
                          '15546','36294','67302','93322','19328',
                          '20869','92984','38120','52815','66301',
                          '29530','90621','67738','73854','98528',
                          '53413','72205','39592','32305','40458',
                          '59787','11775','54508','91663','97977',
                          '47658','17266','86717','36870','42722',
                          '65307','40803','90890','65988','41917',
                          '52180','60971','84627','99397','15099',
                          '83196','20884','91647','24978','76831',
                          '61337','65998','32280','70931','50345',
                          '35983','69817','42071','65316','16927',
                          '97646','24628','82617','31577','41331',
                          '56450','36917','47084','46589','14651',
                          '97888','12989','85121','93960','13664',
                          '22894','48231','23203','30102','57091',
                          '25096','60664','73341','25226','95340',
                          '85273','99558','40577','52272','15886',
                          '94283','14185','70668','29906','22728',
                          '98298','31539','69908','36182','80050',
                          '75836','76228','58703','79306','10062',
                          '22466','62398','33171','97938','73633',
                          '84172','85100','91830','47526','36223',
                          '21866','16334','96643','66379','20058',
                          '50465','48586','29056','76221','93064',
                          '56640','51923','17137','90214','21007',
                          '97176','24017','29602','96828','79594',
                          '97616','43919','65932','17370','68548',
                          '56181','59079','93928','28285','25211',
                          '58409','36356','14336','56498','50215',
                          '35132','85868','29824','48757','89889',
                          '79126','59293','69189','42153','44886',
                          '16423','44901','82117','99931','86235',
                          '16609','52187','26203','99943','61054',
                          '19817','78732','33045','82507','45293',
                          '90461','46052','79635','14157','43875',
                          '15042','19416','50256','76099','14074',
                          '46835','90122','67271','91084','54794',
                          '90410','84995','76584','92724','73027',
                          '97368','46609','28462','14298','23604',
                          '91776','74523','30794','44774','12902',
                          '43941','57281','78295','33623','80011',
                          '75790','79777','50388','73607','50989',
                          '79984','78234','21324','92237','85405',
                          '31751','36762','74647','92103','14061',
                          '22559','99638','21069','35462','64812',
                          '21855','56559','11855','97324')
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


