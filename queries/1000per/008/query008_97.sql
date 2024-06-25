
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
                          '23039','10419','69883','36482','16085','95410',
                          '78190','97223','79137','23643','13668',
                          '33465','15032','99942','50999','96690',
                          '19191','31486','80190','98979','49447',
                          '52116','49208','69048','37957','26311',
                          '64429','44072','75381','75243','90800',
                          '68836','14897','28937','55027','96852',
                          '58646','52268','52976','93700','78341',
                          '48131','35157','62708','29154','23906',
                          '83816','51823','74685','40735','23422',
                          '54350','36003','55315','32568','37941',
                          '57748','42046','83511','39424','69602',
                          '25854','60492','62951','28510','19052',
                          '43583','16950','96891','75296','23842',
                          '58424','75798','34617','92605','18843',
                          '55075','65348','63513','50191','55093',
                          '90966','32239','46661','88748','81887',
                          '75985','79708','53225','60384','12541',
                          '64057','41906','89793','24780','33653',
                          '38016','91689','33067','51298','11605',
                          '77638','94062','64642','42217','22957',
                          '48710','68809','49077','22818','37237',
                          '64241','45987','56981','81600','15489',
                          '58249','42811','65235','82787','94707',
                          '90345','77126','92912','69544','37415',
                          '73801','46200','70579','97927','92892',
                          '47814','77282','38182','43621','84719',
                          '38649','35027','93622','68326','51207',
                          '69060','54957','68927','20246','38205',
                          '36560','20535','20546','18392','43303',
                          '94354','34318','17534','40614','17256',
                          '52432','88184','88165','27704','71885',
                          '12673','55362','33467','29413','60121',
                          '20716','80392','34094','31957','52828',
                          '90952','28705','78035','17670','81808',
                          '53190','82940','85078','52834','63990',
                          '97413','21690','74546','82048','49189',
                          '49905','14187','14746','75424','29637',
                          '60730','97964','51339','13730','62969',
                          '92414','28066','23283','39187','64568',
                          '53198','14005','66838','58776','80534',
                          '54829','63814','68645','84584','61727',
                          '58090','42344','89905','61260','25383',
                          '47701','52990','97860','58075','64571',
                          '63823','84570','16043','96016','17565',
                          '20910','14619','92207','79013','63496',
                          '97753','34722','78072','60995','61244',
                          '71717','86501','54496','80620','42751',
                          '28127','61128','71757','50983','89018',
                          '49218','33208','74490','25864','61659',
                          '65162','67313','32220','97640','46106',
                          '26507','33919','78894','67221','43683',
                          '52696','40092','67169','11288','97864',
                          '81780','52167','20307','45661','54428',
                          '49598','34583','94862','28323','90656',
                          '10923','54354','43695','47285','86758',
                          '69100','87846','55781','39957','11950',
                          '46618','33837','55993','37927','99193',
                          '45851','81341','61799','73938','87248',
                          '78534','67699','41331','13490','83024',
                          '39397','25348','23639','68120','54490',
                          '47140','28582','45642','99461','23591',
                          '89085','36177','92019','90899','92079',
                          '21005','60647','19808','31915','48866',
                          '82500','16332','96804','63599','33199',
                          '51528','28051','94335','48891','81605',
                          '53974','88840','98650','66675','29477',
                          '99842','79004','72568','37810','13715',
                          '94452','19795','60932','54156','26494',
                          '88698','97305','80799','29629','89109',
                          '40978','44526','53199','60566','18129',
                          '21682','11488','75650','83760','13681',
                          '18183','99990','34162','18646','10129',
                          '92209','78217','70503','49796','87078',
                          '10981','54546','71125','94523','85721',
                          '79757','72375','60230','27379','66533',
                          '32646','65479','95607','73535','25308',
                          '84406','43665','94820','11091','85545',
                          '41112','87886','68141','42163','99318',
                          '42674','78223','42402','67809')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

