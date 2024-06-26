
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
                          '66718','14995','32426','78272','53611','38782',
                          '72854','66657','53539','33778','33023',
                          '23166','96752','59466','55052','98315',
                          '89434','43291','10088','54100','61304',
                          '46840','85370','41227','56462','46822',
                          '49733','95770','38361','10524','49080',
                          '69938','57572','52504','66577','41628',
                          '27967','84524','50077','73657','59534',
                          '32110','53176','12131','36121','28856',
                          '74496','90542','80926','60223','74038',
                          '89201','72118','53322','74879','28626',
                          '75774','59416','59901','17497','47582',
                          '81904','66113','43066','68882','30992',
                          '34278','73994','14053','36118','96877',
                          '70950','29631','22008','39892','81316',
                          '41003','93864','47924','95005','26473',
                          '40232','69437','65966','88740','27461',
                          '77426','36984','57460','36861','84055',
                          '87244','33455','58924','55522','86822',
                          '19961','18234','13024','16794','22214',
                          '48402','90873','92535','58355','34692',
                          '18722','31152','71936','57602','21436',
                          '63553','68791','95463','21191','22351',
                          '85952','21670','41761','66278','95288',
                          '76940','45453','54153','32603','92050',
                          '60882','17779','99639','98905','71886',
                          '93186','37775','85924','49899','45265',
                          '68126','65564','52684','30530','74501',
                          '16606','66647','53837','22386','14096',
                          '17024','33168','69772','25118','35154',
                          '86342','71198','59515','16323','17698',
                          '75753','23670','69367','31903','93252',
                          '27606','98230','29302','63609','90618',
                          '56153','31679','18607','90864','62128',
                          '61924','76010','57977','37212','26000',
                          '76984','42107','15497','38222','33323',
                          '82916','11921','15357','64011','35581',
                          '13791','12087','67576','81020','73748',
                          '76813','33779','52490','97236','16898',
                          '91729','29869','24413','26699','65348',
                          '52039','98431','22964','56358','56537',
                          '32778','59393','67038','66438','24130',
                          '36182','59251','62132','22388','41581',
                          '93206','39480','25173','72338','40717',
                          '13212','65178','29469','53089','28168',
                          '39550','48973','56494','98675','46968',
                          '85015','18315','82789','84394','20763',
                          '64315','68749','58258','15448','65194',
                          '80715','22646','45705','83580','32182',
                          '68384','32701','60930','28813','38728',
                          '89138','13850','15666','25798','86519',
                          '37709','44524','40110','61167','44198',
                          '79735','95186','85824','28145','56307',
                          '91254','65149','27103','70958','87959',
                          '20812','58030','57986','78442','51985',
                          '20278','28068','46606','18791','86956',
                          '10132','74137','76584','60283','40093',
                          '23410','39944','53412','93562','81889',
                          '51558','47031','98147','94538','17978',
                          '11119','45499','64936','66599','66058',
                          '70234','62429','99789','15385','34070',
                          '62912','71499','42362','24726','19330',
                          '54998','65729','38841','58198','43761',
                          '38471','38970','21571','66910','65556',
                          '87815','91931','82990','67361','49113',
                          '43591','62155','24465','53224','66184',
                          '18494','51971','34512','43140','38090',
                          '69241','68528','23343','85954','46032',
                          '25933','65018','61543','58408','30795',
                          '25408','18832','76801','18019','60832',
                          '90788','52423','37990','47161','12587',
                          '86871','52072','97729','86782','15694',
                          '10221','48794','91566','12261','98526',
                          '88834','30626','87068','44956','20958',
                          '72073','90276','87593','60672','14396',
                          '97674','76748','71663','10063','89181',
                          '76468','43133','82221','69119','34913',
                          '31882','36766','38193','72674','57524',
                          '73715','34270','45426','47923','73320',
                          '88713','29527','62680','81852')
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


