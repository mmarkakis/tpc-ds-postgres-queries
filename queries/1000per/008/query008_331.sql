
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
                          '63300','63780','32662','62929','57055','99983',
                          '82213','99119','11100','35112','17868',
                          '20676','78269','25699','44491','40259',
                          '12748','61789','41728','13188','51861',
                          '18058','62756','68581','60019','49110',
                          '22335','88601','43607','61157','44739',
                          '79256','66471','92652','98171','64746',
                          '63559','15562','50037','52317','78304',
                          '23824','98453','76766','18362','47141',
                          '95170','67697','92438','92343','20090',
                          '46154','76667','60376','59489','99987',
                          '83015','70678','28124','70069','67123',
                          '37073','61296','57977','28473','52443',
                          '25992','77287','85989','22806','62824',
                          '99156','47111','68837','16351','38051',
                          '63279','77182','60511','42442','27544',
                          '56804','29451','60079','68463','50655',
                          '30121','69727','23930','47492','62129',
                          '98754','90231','70781','38972','28228',
                          '19607','40451','98622','48585','35302',
                          '76662','73412','29060','87742','64974',
                          '40801','85489','78625','53549','26738',
                          '59308','89665','58650','76450','35654',
                          '68160','70602','13453','35758','94691',
                          '18432','71727','42630','20021','24594',
                          '31837','32002','57164','70713','97329',
                          '96599','43606','20953','45388','19460',
                          '88906','76979','43849','96927','45271',
                          '78919','26543','25328','41211','76553',
                          '93615','61027','49897','26305','31966',
                          '46042','78196','12421','65539','92517',
                          '60251','63896','94592','84752','51219',
                          '99407','58952','83713','64332','43676',
                          '84238','59384','35713','55428','87374',
                          '83498','18657','47289','23289','73321',
                          '77300','92754','86565','76280','95638',
                          '37254','73529','73024','88956','83333',
                          '12790','95027','47039','30672','50646',
                          '31011','17555','50436','85100','23316',
                          '94975','24598','24673','32250','37458',
                          '69171','35533','74334','80828','85431',
                          '64345','50549','96854','33259','40095',
                          '32103','33684','25621','35387','78045',
                          '33356','50353','72272','98468','17396',
                          '16649','30998','87901','51345','25493',
                          '80072','99435','99060','89052','67689',
                          '11520','78439','63636','61680','26973',
                          '65314','92326','54596','56406','71432',
                          '52267','98234','86709','62629','44589',
                          '34600','75347','13767','99590','64147',
                          '87735','92121','33496','11378','98717',
                          '82104','43249','74656','68677','76200',
                          '42548','29718','16907','48466','69004',
                          '22696','46618','47052','81556','43320',
                          '95899','21565','57426','80665','68848',
                          '75457','14149','20352','87256','61871',
                          '77699','46744','30425','58758','34157',
                          '49182','37837','33577','65520','29427',
                          '37132','86282','39191','69894','48880',
                          '83876','56474','31368','84729','54377',
                          '40221','24266','80926','46773','38313',
                          '72254','67898','16159','74795','19664',
                          '97026','68060','89357','22003','77790',
                          '96090','82489','44564','63938','81374',
                          '47655','24178','52733','84039','25662',
                          '31296','52853','31261','28886','79125',
                          '64433','90887','68701','66735','85319',
                          '22778','42382','12850','41158','57523',
                          '12092','65441','89024','78587','24259',
                          '69476','88735','85979','80379','43987',
                          '34238','93224','93286','43954','64359',
                          '54995','49968','97119','21160','50834',
                          '21094','49394','41099','16315','20807',
                          '79202','94362','86841','67650','10841',
                          '12012','96724','77541','66035','24494',
                          '89816','63615','43044','64456','14348',
                          '32470','88923','67371','29676','78237',
                          '35271','94392','27868','80331','66622',
                          '32650','51900','45423','64582','99399',
                          '23513','16801','87633','69274')
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
  and d_qoy = 2 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


