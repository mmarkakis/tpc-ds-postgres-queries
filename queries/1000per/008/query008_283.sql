
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
                          '38685','25149','73991','40172','85544','91658',
                          '16764','45949','30180','95027','23602',
                          '79833','69267','68298','33468','48501',
                          '95758','39067','10723','24893','31440',
                          '19176','70555','28797','96510','91113',
                          '33158','37596','58178','48906','95217',
                          '12067','84897','71302','20139','18157',
                          '23569','69096','91525','72455','55024',
                          '49363','24342','87607','42509','95509',
                          '39171','90366','29765','78437','38972',
                          '65356','29650','32889','16959','35535',
                          '94997','21491','98822','42190','25778',
                          '17023','53492','34067','11644','85601',
                          '26053','65656','30378','97373','62338',
                          '60058','22206','19632','37325','44936',
                          '67878','24407','75324','43046','43583',
                          '23707','70006','59402','37952','42045',
                          '27426','69425','31333','46586','96808',
                          '92463','83558','12486','34437','97565',
                          '71129','60877','15100','79249','21342',
                          '14015','47528','21044','78809','90609',
                          '20385','19578','47672','44558','34871',
                          '41658','64868','28641','81080','70928',
                          '28588','95092','53354','54492','45989',
                          '12061','35042','70243','14278','17911',
                          '43375','36446','92480','29821','87477',
                          '91508','98451','46107','26463','95964',
                          '74849','96447','65272','81690','10308',
                          '26174','43300','14174','59549','94015',
                          '32187','57071','27382','50355','33004',
                          '65156','77451','26961','65932','30878',
                          '48871','41527','82120','77267','51021',
                          '58990','88347','65714','85136','58366',
                          '88962','33189','98127','63893','45642',
                          '92455','73046','22242','96012','76421',
                          '20763','79445','43481','73296','58954',
                          '19684','56328','62321','72753','78542',
                          '16042','83909','86658','60963','46275',
                          '99601','18418','74407','89465','59375',
                          '50367','36962','78674','79063','89959',
                          '69496','12127','42586','30114','62499',
                          '94610','94336','44470','59790','94099',
                          '61650','74845','46514','91221','62062',
                          '96113','79338','38033','81945','12950',
                          '50399','88387','34721','37168','32029',
                          '96926','51288','70266','93161','86580',
                          '95617','21725','98156','83257','71815',
                          '88633','61319','65616','38962','66144',
                          '27987','24023','17966','15926','16704',
                          '33818','76045','10927','30348','54494',
                          '53801','32348','83522','69562','12077',
                          '35292','35338','64486','44376','43497',
                          '84478','98855','94398','83745','66381',
                          '10520','20271','80820','49878','33601',
                          '91527','51298','47234','45685','55265',
                          '85165','39465','44917','85382','73924',
                          '53021','65330','32171','20705','89353',
                          '92752','99137','54252','21407','92888',
                          '27742','29049','63343','64928','17817',
                          '63747','80389','23861','46575','89071',
                          '45339','33633','54157','93410','65838',
                          '91414','27119','78135','61351','93948',
                          '88464','26573','96356','12830','56171',
                          '41887','89650','49839','35677','55492',
                          '31764','64557','74735','40601','21641',
                          '60166','92324','22816','35604','62211',
                          '33256','67358','31681','22838','21352',
                          '74336','13788','48490','45593','97533',
                          '76917','21350','23753','26429','73077',
                          '80810','40594','44993','80976','78203',
                          '24587','62558','67242','64598','83598',
                          '22857','70445','72079','50091','27147',
                          '96463','38453','66204','13979','95266',
                          '68477','74896','87705','64192','55130',
                          '37572','96094','19381','16563','46638',
                          '32314','41156','35796','22698','39983',
                          '67948','73904','39643','47834','42393',
                          '19978','15126','92275','16923','85725',
                          '98627','80305','30176','13467','95371',
                          '32986','20396','80296','76620')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


