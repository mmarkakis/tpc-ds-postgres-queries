
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
                          '71691','88167','49137','45903','42962','29201',
                          '76251','44179','59150','78937','59548',
                          '17182','49956','60965','35653','39987',
                          '82409','89146','92490','49340','80802',
                          '89191','61882','49904','73207','47376',
                          '13256','43071','54227','71145','52103',
                          '59227','37012','64974','90637','10241',
                          '74045','81549','55356','22031','27911',
                          '33053','66651','92927','57338','86532',
                          '21259','60022','61587','27426','31345',
                          '62157','38693','55785','61566','94058',
                          '32822','86846','10760','49326','35808',
                          '67573','93973','85099','60439','21619',
                          '73498','73045','66907','90509','81355',
                          '96948','44940','50358','30747','52360',
                          '21523','36298','23566','67953','69333',
                          '89731','92615','92016','72669','90791',
                          '91938','63695','84676','50879','81127',
                          '48503','90220','56462','18525','75480',
                          '21875','27816','60216','71794','12820',
                          '87465','86774','27963','37303','85650',
                          '66317','66979','85308','24167','84969',
                          '78879','92304','68024','15830','98134',
                          '48372','82263','36464','33582','65482',
                          '85263','38208','59362','27185','82094',
                          '68935','44830','87395','82410','93520',
                          '34429','22460','46576','60044','11489',
                          '80710','29711','66801','50594','19352',
                          '14765','51084','42136','40749','19851',
                          '68800','27339','66240','57606','38170',
                          '14468','21797','16199','88235','15948',
                          '19799','14720','28957','14172','49135',
                          '59237','97231','77761','91407','52503',
                          '10368','34974','64838','92654','89448',
                          '64137','39044','12988','97337','50834',
                          '17504','90561','66968','23991','94722',
                          '38499','13472','88736','66288','60454',
                          '70665','69551','78655','16156','12621',
                          '21263','95777','77414','58528','56975',
                          '53788','82741','63125','32632','19230',
                          '63630','54088','48619','35534','16076',
                          '30778','43337','47016','17813','88062',
                          '54163','85438','94365','76290','14015',
                          '64203','92165','62651','81370','69460',
                          '85223','47866','60953','36758','46988',
                          '88528','57287','18639','94374','58840',
                          '37060','28643','15919','94559','71295',
                          '20775','65262','84884','82649','79091',
                          '65579','16277','21438','68312','99468',
                          '49812','51206','60265','36172','79705',
                          '86086','78328','20091','70845','58520',
                          '68930','74808','53393','86993','35079',
                          '72568','15714','74216','14090','24056',
                          '14490','16961','85319','56554','33421',
                          '26892','44226','56571','41003','58996',
                          '81635','64342','36007','63626','86675',
                          '15339','96147','32932','29115','75758',
                          '70666','40150','20663','40825','72729',
                          '34576','50814','20767','18972','28608',
                          '47249','33587','94489','76359','30468',
                          '66271','15636','70820','56834','88889',
                          '88321','98881','73446','92311','12418',
                          '76230','97115','74784','31344','85914',
                          '76535','94426','35385','79402','69603',
                          '48379','58072','35346','83567','43447',
                          '23262','27567','90320','65392','21212',
                          '78094','52131','43604','89013','48872',
                          '90603','65238','85211','16935','23920',
                          '60113','82532','10888','18653','46284',
                          '83259','82150','22541','62319','71393',
                          '18494','71945','47110','50033','83826',
                          '69535','10014','10178','65599','67425',
                          '75782','36819','85730','84449','63332',
                          '92994','52807','77838','44327','95743',
                          '68503','33934','58947','96599','50171',
                          '63669','70192','75832','41302','42182',
                          '64926','70085','81032','54377','72610',
                          '95775','51827','97400','59458','60950',
                          '26056','64059','78870','81185','34167',
                          '91941','52679','42307','75076')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


