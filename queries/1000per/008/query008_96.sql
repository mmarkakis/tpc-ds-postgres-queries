
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
                          '88053','64716','91272','65707','75106','15225',
                          '49875','99293','80284','41035','57467',
                          '71867','33369','13605','40964','56671',
                          '30702','21599','28082','87565','73608',
                          '56317','52623','94222','96392','14956',
                          '49235','37367','34063','77618','78671',
                          '88668','29713','30018','51333','92469',
                          '53371','72706','34538','80828','24921',
                          '80532','32210','30203','43594','38859',
                          '80018','56112','46416','65264','54423',
                          '98459','44504','72105','88844','46484',
                          '39743','37040','18589','65679','58979',
                          '58268','77970','33779','77744','42366',
                          '21390','20241','98645','39275','23128',
                          '68948','56303','10222','32794','38494',
                          '99701','64660','23824','14302','99745',
                          '61508','55259','75830','41052','69231',
                          '61556','71036','33472','19866','59620',
                          '87096','69873','14904','88550','59976',
                          '60096','67849','84568','84711','87205',
                          '77287','51151','11082','42399','66976',
                          '79884','23138','38310','68738','54602',
                          '65514','65167','48519','50008','93637',
                          '35580','55243','87930','12491','86150',
                          '56354','10074','98079','75528','87300',
                          '43092','74370','37060','85109','87063',
                          '42224','15285','61698','12292','84261',
                          '84087','11844','97449','98598','37998',
                          '64686','47857','52973','68406','88829',
                          '10797','50971','17837','50806','22877',
                          '56820','31910','52131','63710','81104',
                          '51377','67844','73606','11389','52194',
                          '26290','34045','51276','28926','95930',
                          '94007','52559','43090','74012','66683',
                          '69762','76968','23008','43437','16119',
                          '96910','52886','45850','99244','39818',
                          '68971','41279','91916','93285','22284',
                          '46220','50480','62538','94179','51265',
                          '56490','78805','15661','33247','60951',
                          '41480','28655','27238','19002','83104',
                          '86643','14603','10506','71753','19771',
                          '25984','20598','19453','68267','39392',
                          '24479','98383','93240','93582','40668',
                          '80962','93429','49377','71025','69970',
                          '73113','95837','58330','18494','76472',
                          '25669','17252','12325','32750','60586',
                          '48809','11127','54143','50908','21133',
                          '49878','77775','72808','53532','20206',
                          '80070','63485','82108','35687','85373',
                          '71473','34121','72068','93766','95429',
                          '28151','51044','28473','88766','64927',
                          '23844','14676','74707','72231','84031',
                          '59956','95835','44833','15653','52411',
                          '90831','29223','70783','83558','29769',
                          '36043','98917','96967','25015','78156',
                          '20691','16403','96060','67769','51524',
                          '63458','52591','32972','85174','94105',
                          '47224','65770','79352','82693','52110',
                          '10677','65417','48191','88647','25101',
                          '30113','89682','47729','96992','95988',
                          '40545','86680','47335','93538','67408',
                          '93337','53999','23198','54985','47148',
                          '35815','11938','87493','91573','15318',
                          '71828','24199','34010','48635','66013',
                          '63397','94216','44931','55975','83085',
                          '41357','43114','53504','98373','22698',
                          '55117','55038','64313','88468','84203',
                          '55231','63738','99896','85721','55606',
                          '80249','76820','10317','14409','66947',
                          '24992','49757','19324','16324','78303',
                          '74720','72749','93600','84357','60645',
                          '19094','58773','80367','96633','81492',
                          '58887','43835','60936','12181','36497',
                          '80241','25370','29159','50164','76825',
                          '78529','75668','47418','74535','36593',
                          '59577','31815','66345','74717','17151',
                          '88527','88334','81994','44906','65287',
                          '88244','97509','75678','67952','38134',
                          '61647','43333','26762','21352','94392',
                          '74863','67724','33541','13244')
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


