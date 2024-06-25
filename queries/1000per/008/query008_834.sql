
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
                          '39455','73885','47273','39790','72053','69165',
                          '68774','42208','63606','82151','95724',
                          '14541','51924','26282','22874','65073',
                          '84225','69140','98025','73170','12409',
                          '69167','50996','38712','73989','72231',
                          '42708','27635','97385','89594','43856',
                          '25568','18868','82240','94156','84483',
                          '19906','90026','32274','75459','40810',
                          '79858','25162','18769','68528','37747',
                          '87883','26810','63521','97312','19716',
                          '28498','62816','66395','25321','64709',
                          '98282','30324','44532','16671','32853',
                          '65518','35023','26800','30718','29459',
                          '65763','53669','14350','78195','76594',
                          '92888','92590','75534','60650','95740',
                          '48984','69078','25670','69533','16713',
                          '61615','14905','37844','42585','91669',
                          '19885','57840','72984','67987','28417',
                          '73818','39150','65015','83513','32724',
                          '97076','28414','61094','67602','12608',
                          '81861','53891','48613','20824','56088',
                          '79148','30054','56618','65974','41932',
                          '68194','56049','62319','28012','29438',
                          '72495','82651','68427','68918','30424',
                          '20516','34888','79838','45468','47853',
                          '96956','89141','86011','63587','32261',
                          '77176','25919','19607','70467','89876',
                          '78887','17912','86007','33611','82092',
                          '97181','85914','11599','43110','70263',
                          '75016','22215','50166','86558','76894',
                          '48259','39692','87165','66993','83173',
                          '75581','51909','62322','92325','80488',
                          '21023','89865','43598','22131','22688',
                          '61371','29802','23830','35591','27486',
                          '76481','79907','85861','31788','30467',
                          '27822','81991','93717','94333','67441',
                          '59989','77503','63937','88672','61015',
                          '14666','65257','84603','69805','47925',
                          '23225','10372','99998','39254','29954',
                          '20050','30237','90609','62033','77542',
                          '32694','76036','34418','99832','41757',
                          '37247','46999','87435','89191','34305',
                          '24772','51466','91774','67874','58539',
                          '66582','47381','64634','33227','77784',
                          '59353','34664','19082','98861','53604',
                          '90344','59840','31101','67726','35073',
                          '82171','35781','70979','23366','99352',
                          '65248','28656','91347','32494','36685',
                          '75929','38970','26711','46761','93760',
                          '26109','59958','71375','31120','77969',
                          '15458','27050','99434','41983','43387',
                          '60060','41935','65017','17164','73605',
                          '40540','73343','35110','26090','20611',
                          '48995','51186','68382','89080','89399',
                          '26396','50734','22587','66141','91855',
                          '26286','86860','88658','51731','29212',
                          '63522','36222','11169','96983','78688',
                          '16829','49880','94702','29022','54525',
                          '52970','34345','65744','94093','18933',
                          '87534','30373','93996','11663','23859',
                          '57438','40695','98566','94805','28268',
                          '83241','18654','79203','93636','46923',
                          '35130','20114','73858','60390','79862',
                          '76411','76553','81445','65127','67955',
                          '88816','38766','93066','30216','21984',
                          '76843','67235','47109','74823','35945',
                          '98866','61931','55475','39370','61614',
                          '69473','78883','73641','96724','19532',
                          '57025','69822','75873','67205','12956',
                          '51054','13765','20696','47184','46576',
                          '20899','30218','84118','89310','63957',
                          '14821','40336','73603','38183','29280',
                          '21587','36093','43182','92494','76003',
                          '46052','48782','61960','86136','61721',
                          '48359','78572','21590','88224','57073',
                          '97939','12769','74379','49475','41740',
                          '13888','29119','92505','46253','86811',
                          '73048','98659','27379','76070','76976',
                          '39681','19181','29355','61116','95682',
                          '58310','51258','22574','64640')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

