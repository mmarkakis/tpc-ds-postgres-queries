
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
                          '90334','99168','73727','50460','59888','66974',
                          '62432','82171','76290','26593','55230',
                          '42563','42778','96531','35324','20499',
                          '47871','34241','72699','71888','90947',
                          '30315','91870','99978','95989','14071',
                          '87369','64793','41442','20210','92041',
                          '37783','59939','17592','90649','38252',
                          '50337','28311','61610','51995','67465',
                          '64351','57851','61125','81643','27952',
                          '63063','89833','72087','94201','96517',
                          '29286','51707','53293','11704','44053',
                          '14097','48745','44767','61628','31711',
                          '49943','66035','89173','31499','61474',
                          '49375','44121','61343','64898','31681',
                          '61116','64792','24827','96005','97055',
                          '78723','41024','74385','77516','91344',
                          '73987','88008','47255','94076','74511',
                          '68936','58064','99055','74148','58471',
                          '10382','96156','14327','25747','66501',
                          '30789','45549','24801','25418','69942',
                          '19077','26827','12758','13223','35538',
                          '82504','84562','19128','91859','72747',
                          '15279','13527','51223','98785','36238',
                          '92597','60581','35587','78286','89291',
                          '17885','14290','20601','45171','14640',
                          '32637','33416','27916','19336','87265',
                          '18738','24608','51796','75023','25508',
                          '69346','97341','60683','29231','77003',
                          '63164','60901','25918','94951','85150',
                          '15183','71765','14646','78531','18793',
                          '87358','37737','48827','51386','59860',
                          '22513','46611','81311','26882','38285',
                          '29803','31891','89401','62849','10746',
                          '15109','43206','54030','92703','29377',
                          '46052','73825','80742','32010','40912',
                          '91312','25092','76495','69442','31952',
                          '40528','57127','12857','44977','47333',
                          '65014','94249','28474','89719','74580',
                          '76328','34013','97201','94604','48235',
                          '79068','55094','87004','79059','97398',
                          '91922','75483','74706','91175','49815',
                          '80439','71081','62819','87713','65719',
                          '67238','97824','65008','95242','21574',
                          '33377','79560','84961','34125','50774',
                          '66516','82556','20863','24011','33896',
                          '43055','51837','65451','60228','82119',
                          '34797','21803','90671','74059','75372',
                          '23755','34825','11692','61863','58434',
                          '31783','75798','68395','33740','58035',
                          '88902','20690','41184','10306','56760',
                          '68966','29740','26468','32543','24696',
                          '39607','25427','41608','70764','11696',
                          '16738','81698','38090','81354','10464',
                          '16155','18534','82445','28641','42566',
                          '73558','15722','66472','49739','11110',
                          '39481','65638','46132','62656','28321',
                          '87017','55270','46238','35753','15174',
                          '47123','24571','31369','85736','67697',
                          '71889','45469','54280','75034','20479',
                          '64836','93194','84652','41613','36709',
                          '57786','73099','47354','89119','56254',
                          '50105','20738','15555','22019','59221',
                          '56730','89403','53021','21882','68661',
                          '32176','80758','90431','50810','75679',
                          '18890','27792','55570','88099','63919',
                          '35451','66801','83708','13570','14986',
                          '18506','59574','17769','26242','22734',
                          '99462','35351','19111','50453','46378',
                          '41908','18969','73276','66057','88493',
                          '78278','77506','92456','50856','16729',
                          '32168','30353','68225','61604','21314',
                          '47151','53911','77168','50752','71302',
                          '75618','70576','88554','11478','75039',
                          '76417','35841','34626','33571','34055',
                          '59207','64821','45985','46420','70611',
                          '29870','92457','43710','69052','23264',
                          '71466','67647','80431','60638','24695',
                          '20312','10023','23161','11341','10607',
                          '58520','15635','96503','59501','27671',
                          '34860','19653','59211','90411')
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


