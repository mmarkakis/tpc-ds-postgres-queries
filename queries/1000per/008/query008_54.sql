
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
                          '84820','22443','96016','63551','70659','20167',
                          '25015','78278','86862','71025','19089',
                          '64088','34680','31569','69298','86314',
                          '45053','68938','47039','18157','45874',
                          '19685','16379','46703','43561','84092',
                          '65937','78283','97523','52495','14225',
                          '94870','13630','21850','13714','24914',
                          '54507','51617','58370','45372','52700',
                          '38678','18712','26026','21607','16475',
                          '23909','22964','33307','60197','70207',
                          '56369','59232','87687','94802','17273',
                          '38215','23237','35480','93989','71708',
                          '13109','77584','45399','10405','40356',
                          '47460','11434','40493','40878','36524',
                          '62611','64604','24586','26045','97819',
                          '90171','83859','90619','80267','36101',
                          '10060','54955','27619','37355','78073',
                          '73184','58228','96780','65134','87832',
                          '54192','31419','35076','54741','58268',
                          '31110','53103','64993','43812','36966',
                          '52208','27535','84146','60737','72769',
                          '45971','44110','26646','22943','37008',
                          '26122','43380','97704','57693','34308',
                          '11693','82410','39906','28619','77762',
                          '57666','95886','54457','17506','72709',
                          '79263','22733','44431','11452','96842',
                          '52680','51735','44271','75037','28837',
                          '51860','26107','66288','94088','36996',
                          '74504','22650','48166','78368','13273',
                          '15977','18942','28011','39766','18066',
                          '30803','99947','85949','89330','52842',
                          '14117','36576','15609','12002','60587',
                          '32142','77598','42289','52312','78772',
                          '66550','54813','46052','96311','37973',
                          '26698','41113','49318','30136','14352',
                          '34903','16502','89365','73441','32561',
                          '55025','27855','31886','70827','82470',
                          '88672','24471','37342','99003','33443',
                          '28054','56766','99017','89595','46001',
                          '56246','33947','99550','75892','44135',
                          '54011','29353','56669','93870','93339',
                          '11343','32841','67687','48639','10334',
                          '11576','50741','10502','76516','33600',
                          '97845','46363','15043','93529','71486',
                          '32062','19281','12630','57170','48205',
                          '61140','25270','62872','36239','71362',
                          '65645','18564','65128','77486','58374',
                          '12294','49027','25587','60914','55091',
                          '57311','81869','69573','83616','58816',
                          '73162','30480','47540','87154','87745',
                          '42845','65701','32476','17055','87197',
                          '73971','55384','71233','83449','83036',
                          '11316','99084','43345','54412','45061',
                          '35185','65677','66573','76382','20879',
                          '39029','54734','87627','38413','28995',
                          '95014','97167','94324','53727','74024',
                          '74257','48026','69094','85649','56141',
                          '60095','49770','37317','33681','48753',
                          '43690','57685','54619','78494','98645',
                          '40060','24574','58016','78084','23577',
                          '21489','48333','42429','80536','51197',
                          '38535','78765','20911','66083','86562',
                          '14944','62468','53708','40959','79455',
                          '67852','19715','31456','12849','65472',
                          '26724','53446','36328','17542','56150',
                          '54740','43024','61970','38444','27854',
                          '72386','28125','58280','60231','44341',
                          '30468','46447','35555','97909','37990',
                          '61560','29414','66916','18391','39844',
                          '78753','91331','41396','90348','50102',
                          '49903','52206','66141','43377','43041',
                          '79081','96642','97627','26726','35726',
                          '34907','84522','46204','39601','73413',
                          '11336','90984','74208','79791','32993',
                          '56165','39065','15371','88529','70918',
                          '76088','65308','12367','68027','76099',
                          '62787','94745','11979','96833','80954',
                          '39872','60488','68680','47632','69290',
                          '58298','11429','79585','44244','77698',
                          '28312','65630','56379','40714')
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


