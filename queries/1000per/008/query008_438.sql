
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
                          '63057','36905','63227','98165','11518','86658',
                          '10102','45492','30147','42100','61326',
                          '64368','26801','22874','96951','51839',
                          '64415','43326','22177','49115','87030',
                          '69517','25068','21669','29467','30858',
                          '54767','53850','13637','13639','91126',
                          '54443','78525','36692','88287','34225',
                          '51682','21502','37055','97063','64039',
                          '73339','48189','65249','66316','27586',
                          '23848','88040','21537','26486','58938',
                          '17886','39726','88269','37185','79549',
                          '54880','93254','27039','61425','35256',
                          '13361','28230','73421','73872','41761',
                          '22398','11162','81210','23262','40298',
                          '87996','31934','21783','78960','27879',
                          '87373','66713','81989','92114','24223',
                          '45165','24750','80484','15580','58846',
                          '87748','32267','53095','31173','99533',
                          '50205','48099','12832','30610','47772',
                          '38132','17460','15585','85512','37526',
                          '20010','24782','17425','52137','58760',
                          '93439','40784','44331','30350','95501',
                          '16886','95411','84830','96140','85661',
                          '28369','50284','91043','59557','73894',
                          '75297','36271','51074','73396','19426',
                          '30305','31903','30910','40740','23434',
                          '99977','92000','40608','26741','29839',
                          '56631','95748','50348','68553','77270',
                          '74862','69890','51550','34414','49149',
                          '78628','69724','33246','88109','64995',
                          '10900','65360','14141','33362','73512',
                          '60198','80380','64549','45807','17086',
                          '14025','55104','61931','76109','38638',
                          '10311','19872','96217','94546','55993',
                          '22758','12151','42438','96727','59222',
                          '15253','68300','22103','83811','40999',
                          '11719','55108','35799','97160','21530',
                          '79460','69507','51020','80788','59630',
                          '36606','68247','48426','30086','30613',
                          '66037','58916','81031','29333','46624',
                          '90678','61026','17482','68766','45962',
                          '81701','84527','42412','59341','34298',
                          '55980','97062','33396','96418','59484',
                          '43794','37480','97913','57102','83343',
                          '49497','47457','29948','25139','18036',
                          '49719','98864','50449','22253','11508',
                          '29054','87481','40426','99468','41700',
                          '79437','97649','82038','96529','62255',
                          '19754','37100','52603','87027','38318',
                          '27756','11925','38824','29197','92732',
                          '30470','81092','67393','38670','89077',
                          '92881','77170','64672','68809','93042',
                          '10974','97337','62720','90890','57824',
                          '62761','13903','33656','42156','84711',
                          '75991','15776','60167','88753','83307',
                          '41441','13963','12917','22785','92540',
                          '37865','63306','32191','69145','30408',
                          '53484','26074','15241','12782','12049',
                          '73653','80096','66695','61331','84123',
                          '83470','70229','62471','56467','15592',
                          '98404','82366','43734','53223','11296',
                          '19457','55941','41799','73417','82257',
                          '71758','89603','45016','46410','49812',
                          '78652','93935','28857','21015','92545',
                          '10641','84445','10208','65963','37784',
                          '77315','65129','84032','34052','35563',
                          '17907','82284','92335','83425','39571',
                          '79790','26700','72596','89348','12838',
                          '42596','32141','10245','41952','59062',
                          '60375','75594','52156','51884','14810',
                          '32981','57167','19090','38279','57302',
                          '76470','98200','90396','40302','63382',
                          '53745','94256','14960','55814','41932',
                          '85095','31505','81886','94804','39175',
                          '39506','22361','76161','21776','52773',
                          '71114','32359','25387','27095','55258',
                          '30859','34998','16918','54921','93554',
                          '90778','29368','97231','50519','78619',
                          '36754','85388','38009','68856','98931',
                          '49385','50836','73210','26748')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


