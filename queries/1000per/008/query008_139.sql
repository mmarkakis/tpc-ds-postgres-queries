
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
                          '57779','74166','82477','76731','76548','97685',
                          '55187','88592','67564','61406','30419',
                          '33779','87070','15224','74512','62740',
                          '58763','94528','48121','84885','57353',
                          '78025','49135','67868','84330','77982',
                          '73744','56030','10867','90929','68038',
                          '95569','79932','23443','33138','56978',
                          '10368','79418','93924','38836','41318',
                          '49800','26661','37100','78834','17769',
                          '43757','63801','56628','77478','35790',
                          '25385','85763','30728','98524','92758',
                          '91755','24158','75936','83093','94146',
                          '40110','77810','36495','20002','51530',
                          '69961','13968','12261','18451','99026',
                          '89095','97283','74945','38785','19363',
                          '80731','31756','26944','67961','96861',
                          '77350','15266','80068','55751','95404',
                          '30502','76898','37539','39032','53577',
                          '90787','27899','14216','26175','15156',
                          '92143','95856','83252','71729','86193',
                          '25034','70169','87073','30528','36031',
                          '87643','52105','87054','77976','56347',
                          '29984','61433','83296','12952','29663',
                          '80371','92013','87575','72965','69264',
                          '53299','36740','67244','23847','87781',
                          '77003','44439','44913','27158','49675',
                          '88614','59661','20497','33659','37517',
                          '21176','16079','77872','63132','11524',
                          '70962','20090','57477','59932','77030',
                          '85510','62908','17515','72900','66082',
                          '36909','80739','97119','40395','82075',
                          '87216','51188','64169','56681','69739',
                          '21492','91969','16453','25744','55431',
                          '21931','43325','36734','72291','73932',
                          '49005','80947','82802','98066','45653',
                          '60997','97633','27996','48797','78612',
                          '20864','42051','78237','76243','47660',
                          '99474','42473','96085','73478','79009',
                          '31351','24746','54540','17262','84358',
                          '95635','89054','13246','47427','19542',
                          '68150','42444','57983','64460','27606',
                          '77086','43130','97467','40140','70528',
                          '96168','34833','40038','33076','30063',
                          '80111','89722','77136','81578','32289',
                          '76492','26353','17721','75845','47451',
                          '14883','97790','29082','56749','25220',
                          '69958','44983','78036','67366','48040',
                          '87547','78360','10873','77169','46415',
                          '32322','45146','92403','55781','51046',
                          '64955','44568','18357','55422','30813',
                          '36467','11671','95736','24678','88395',
                          '11876','89615','17830','24280','85954',
                          '17933','34561','44216','20440','13396',
                          '92578','11755','52107','39569','96371',
                          '22325','29739','33442','38231','71441',
                          '55253','65671','67860','46346','73260',
                          '40838','68563','19358','48098','28510',
                          '51409','44172','16218','10664','35194',
                          '76796','35759','21817','13945','18084',
                          '90205','34013','73930','80054','92184',
                          '99458','20292','52826','72958','71080',
                          '18961','52976','18131','58602','99826',
                          '79704','92653','46431','94542','66198',
                          '29195','86090','15195','82396','82048',
                          '48905','92848','73784','75510','77362',
                          '63838','56687','65105','42635','30259',
                          '86575','53045','38809','80409','55331',
                          '97760','90948','65761','58160','47659',
                          '33447','44186','35100','68532','92754',
                          '51626','50322','33479','32350','37845',
                          '23119','12423','21476','43323','81004',
                          '38997','12471','86481','20318','33241',
                          '88443','66329','28488','35942','76900',
                          '39908','80860','61869','36408','66191',
                          '35190','74531','29254','80011','37291',
                          '60110','25729','54887','78455','18975',
                          '30784','27453','80475','42013','22465',
                          '36791','78426','54856','38065','87810',
                          '22104','26842','43897','51047','87381',
                          '90578','58277','65033','63397')
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
  and d_qoy = 2 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

