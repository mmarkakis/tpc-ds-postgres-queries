
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
                          '64292','97970','35824','21391','73117','50030',
                          '74624','22450','43982','23800','93015',
                          '72353','32660','77984','84075','83399',
                          '38982','94551','78318','15784','67620',
                          '22249','41916','43445','73253','84836',
                          '41799','59918','29722','42797','45018',
                          '91575','64180','56573','22148','63540',
                          '86882','30214','65885','62708','18583',
                          '99336','79411','96434','29676','27705',
                          '73514','20570','88589','66738','94953',
                          '66813','63417','85073','51990','32701',
                          '10546','23825','40332','46379','77930',
                          '97880','94613','45391','51270','57765',
                          '57007','84296','68325','92647','74779',
                          '38624','20530','31003','60701','98110',
                          '78443','31025','99188','17828','63742',
                          '25437','24600','27812','18456','62180',
                          '20450','14575','36684','20018','33912',
                          '23301','64044','23483','14451','86071',
                          '75426','22371','53893','94064','93289',
                          '46790','47310','21015','37795','71571',
                          '99050','21424','93585','90657','69030',
                          '98735','84252','93143','29733','44721',
                          '68914','59193','78520','72647','11709',
                          '99589','16687','41723','35114','65727',
                          '85494','71946','73222','46112','58206',
                          '65468','92454','60452','43833','48140',
                          '86172','63467','38034','38336','38409',
                          '44401','22016','19028','64997','24067',
                          '22222','77171','68484','44029','57627',
                          '80622','57962','15729','82351','31547',
                          '69287','14780','69939','43453','32389',
                          '89057','73463','22416','39915','61140',
                          '81526','50751','22576','19002','55471',
                          '69620','67040','43965','68087','11117',
                          '69003','27464','54455','94165','58313',
                          '21959','44970','26076','55382','36239',
                          '14453','92390','60421','44206','86040',
                          '11585','69409','59017','17490','88309',
                          '65685','66430','61678','11956','66286',
                          '67342','59258','38704','21894','28189',
                          '77051','27042','91235','86151','55095',
                          '70964','89233','20163','88701','16911',
                          '56753','52483','61099','80268','80161',
                          '17007','52304','15905','19538','27032',
                          '92840','86227','90419','33553','17303',
                          '71777','47886','51024','93609','68114',
                          '37491','84222','23447','49895','14985',
                          '39651','24424','73848','57712','35773',
                          '37621','47613','17427','94749','19904',
                          '48990','26203','66692','77873','45172',
                          '42024','97041','76701','10630','61135',
                          '11517','88770','15234','85881','21247',
                          '95635','11707','96115','68068','52851',
                          '42605','52197','30604','22206','58440',
                          '33443','48296','94029','18590','33473',
                          '80183','16453','89593','37065','44621',
                          '21393','45459','46663','69429','25303',
                          '27094','73128','29060','84443','83849',
                          '23075','52762','86496','77371','15423',
                          '74796','39301','88708','27745','57699',
                          '15080','59614','42817','37683','35927',
                          '57287','54015','79247','99886','17165',
                          '69258','45564','22194','57800','76565',
                          '87138','16337','65410','44406','80806',
                          '22454','69164','61517','74926','79969',
                          '36295','48099','66180','62916','48924',
                          '15752','98843','89917','40548','56252',
                          '46258','17426','26065','28731','48261',
                          '26137','19505','81823','10511','65444',
                          '34482','29497','54944','82332','73056',
                          '84120','36259','34888','70604','81883',
                          '18441','10629','90910','80918','67454',
                          '82848','70802','73304','62752','55180',
                          '75503','39376','28317','85282','48236',
                          '61532','76936','91467','35592','78865',
                          '78572','82447','72217','90807','10852',
                          '61691','32711','32324','10004','19243',
                          '41885','52761','84653','89170','46391',
                          '11653','86887','10527','42562')
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


