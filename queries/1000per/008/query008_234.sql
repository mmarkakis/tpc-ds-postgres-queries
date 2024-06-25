
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
                          '29790','36745','32695','30833','44311','13834',
                          '35689','53915','16324','37458','26106',
                          '63286','14674','15884','66643','19703',
                          '84079','10816','10013','50338','42944',
                          '88559','65901','56481','84919','70278',
                          '81857','27886','85117','43560','98585',
                          '49711','59102','83570','51847','99660',
                          '60519','16938','24026','96057','53387',
                          '82719','15392','21522','10449','41732',
                          '47898','37500','77175','20048','61633',
                          '98470','49761','61677','68465','77406',
                          '30981','53925','61114','89496','87315',
                          '88067','50925','16664','45097','48722',
                          '21147','60001','67185','11082','66215',
                          '27214','46173','12095','67704','68785',
                          '38730','16806','10909','16897','74773',
                          '80868','58083','98663','55464','86289',
                          '45993','86466','75956','39486','38247',
                          '75323','95281','74894','92916','33692',
                          '84330','16039','32215','43734','73991',
                          '66169','55553','92518','73300','93324',
                          '35715','58419','22326','66238','70553',
                          '36898','57466','60954','56048','11470',
                          '32976','96486','98944','66634','30915',
                          '87020','54733','25829','59556','30632',
                          '59548','66926','84461','22959','55605',
                          '41858','33447','78713','69463','59911',
                          '81758','27918','15425','49712','17433',
                          '61811','92289','45926','50202','72334',
                          '34321','57700','15311','26459','85594',
                          '18686','90517','35211','41558','25329',
                          '31875','65635','90352','20755','31236',
                          '66742','40273','97153','80010','59749',
                          '62777','56558','17408','20633','21024',
                          '67536','95977','84146','34260','31072',
                          '25693','66885','56173','65569','42470',
                          '83540','84625','68674','75077','51976',
                          '87184','37012','36090','28551','54673',
                          '89578','41835','80084','96076','66585',
                          '10348','45259','72200','32806','55977',
                          '71587','72056','20097','17696','53541',
                          '79562','32456','91861','67362','30082',
                          '61027','45307','46752','39336','65133',
                          '85976','82438','76608','78040','80593',
                          '70315','44936','97398','95296','66142',
                          '80223','58142','54919','17037','73786',
                          '76832','89298','67316','95892','51110',
                          '78487','72849','47274','97256','36201',
                          '26341','70493','51493','21775','14063',
                          '51956','83600','50791','86192','90390',
                          '68990','92980','91301','70146','13885',
                          '36251','83266','20712','82950','26694',
                          '92971','57188','49913','69817','38472',
                          '28682','79529','33771','70445','32782',
                          '89312','12857','89587','90541','51427',
                          '27007','99170','71724','63475','46426',
                          '52382','92507','25070','93068','45103',
                          '80885','20862','17734','30927','26490',
                          '97492','28739','70333','43817','63106',
                          '50857','63947','87023','99298','41101',
                          '63838','46746','48637','87044','10320',
                          '40827','51581','15809','61246','69804',
                          '12392','52667','64921','73351','38080',
                          '86019','88048','77452','43445','56695',
                          '27241','29042','43509','10637','69887',
                          '46927','77033','30291','98222','27628',
                          '48161','91539','66292','17197','87244',
                          '70794','55604','14430','31825','88704',
                          '86946','79061','60754','21274','90152',
                          '99263','38319','21296','20492','25425',
                          '34695','63749','56617','48808','56815',
                          '50550','99703','99260','71414','37113',
                          '47508','30726','54500','85269','89350',
                          '69391','99886','70688','96528','66870',
                          '70636','35657','99485','51542','21769',
                          '11579','23440','52276','69069','38296',
                          '64524','56831','56087','41104','62919',
                          '82788','25045','91870','13402','19491',
                          '35676','25373','68524','58375','16712',
                          '32272','43276','69003','98549')
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


