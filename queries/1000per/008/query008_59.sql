
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
                          '18921','72112','27608','78836','23325','68378',
                          '29568','85874','67449','74778','69980',
                          '10419','98825','82254','80031','60004',
                          '80253','48186','76290','82165','89966',
                          '92948','39090','68687','38535','83191',
                          '61393','88563','38573','38791','13254',
                          '52786','20168','69548','36696','56440',
                          '75129','10207','96046','18522','29429',
                          '79004','77248','65514','60245','78798',
                          '21622','51843','89420','32982','87569',
                          '24232','84330','60508','98617','59933',
                          '11626','64819','51382','87938','22498',
                          '95121','99841','75497','28213','15138',
                          '69147','16712','24572','54007','67777',
                          '13992','83417','62389','25376','87940',
                          '61824','58971','68072','54637','60261',
                          '22890','82674','83979','55998','45576',
                          '68304','54785','59154','91814','60027',
                          '90685','70757','43268','94712','95693',
                          '19959','33479','56465','43573','51303',
                          '93310','23964','85621','19436','55726',
                          '33613','51033','79530','27281','76798',
                          '31406','68982','11168','57007','80744',
                          '10839','35231','68919','33087','42991',
                          '81985','86312','60306','57930','84962',
                          '25513','78629','60749','27187','91000',
                          '60949','22885','21046','88893','88472',
                          '97098','95082','96942','34062','85896',
                          '70710','36423','23049','86935','61090',
                          '23238','32074','54286','15780','85275',
                          '94681','17716','32944','87933','85626',
                          '93051','80259','83577','93307','65192',
                          '53775','89613','52936','58688','45941',
                          '96386','79903','38876','88845','35604',
                          '87425','52518','15156','64282','62604',
                          '66754','55469','15565','48121','71888',
                          '48467','54438','28127','52615','52166',
                          '39099','69990','99251','36481','24913',
                          '50741','55677','33157','66255','18672',
                          '90404','94156','23688','50063','81080',
                          '91237','35988','97788','52486','11904',
                          '95926','44923','28434','58005','94808',
                          '99334','21080','70563','78362','15920',
                          '70857','94230','42042','29662','20092',
                          '63198','90962','55904','86155','75276',
                          '13651','74288','82104','97498','84546',
                          '50995','85452','36710','15267','12504',
                          '21586','36418','67545','45566','88098',
                          '25892','52604','38193','14762','91452',
                          '74635','74429','25504','22427','76703',
                          '24259','39630','54889','52648','61640',
                          '65780','73020','80686','69050','22937',
                          '10386','88010','11663','73182','74020',
                          '46470','33607','97920','89393','33349',
                          '72722','84726','87710','98787','75334',
                          '14212','81194','18087','79962','56770',
                          '28406','45614','16022','42227','98706',
                          '79081','60006','19106','13547','43404',
                          '94458','62732','96462','92570','20271',
                          '27911','85336','55363','34981','27099',
                          '96100','89706','78573','70884','47315',
                          '92110','52593','96355','16648','30440',
                          '79725','28169','69630','67692','96342',
                          '24490','46636','19671','26948','95096',
                          '68258','25724','73184','91688','31193',
                          '87756','67582','53234','65761','17142',
                          '26021','17699','10684','47047','42438',
                          '83852','98491','90016','37468','27019',
                          '65516','20029','13747','20626','25563',
                          '34733','41585','44127','67562','65384',
                          '81730','74838','28539','42959','47890',
                          '90676','34740','37398','53872','80899',
                          '23951','52294','77025','81655','17383',
                          '48881','23494','56679','59712','71134',
                          '49476','33696','84030','80694','46213',
                          '87915','17008','61210','12761','31920',
                          '35478','57025','63891','34233','51078',
                          '43948','64691','81791','90728','93690',
                          '93269','91082','50186','36974','91841',
                          '80797','32173','22066','25141')
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

