
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
                          '57874','75066','36495','40274','18071','22667',
                          '18291','70546','17061','39311','34741',
                          '84970','93969','95070','39538','90413',
                          '46964','30226','17782','75511','70231',
                          '92656','37123','49492','25342','67792',
                          '40308','42839','35003','33445','82373',
                          '42400','98828','48963','80431','58046',
                          '15580','69634','88110','13457','36089',
                          '79583','96903','34554','99637','92472',
                          '71593','63761','78721','71172','46627',
                          '69275','97042','13112','39741','96800',
                          '79779','52351','26863','74397','37495',
                          '47113','65737','58497','66615','19115',
                          '33242','62965','60526','90003','38114',
                          '14761','78522','98286','52209','48630',
                          '40455','13869','93112','72308','85879',
                          '57777','79380','31841','42348','33598',
                          '47402','63695','50508','22694','72948',
                          '48010','22830','29512','63807','91195',
                          '34735','26777','63704','63716','41529',
                          '90882','95185','37626','73592','71589',
                          '25484','45966','77407','18215','63839',
                          '30010','90443','96002','50968','41733',
                          '35414','57818','28174','82932','50174',
                          '16544','88917','50266','50637','10832',
                          '67230','69500','69555','23987','99929',
                          '91361','52885','77044','74691','71952',
                          '27458','93977','61921','20394','92275',
                          '81937','83429','35606','89887','41060',
                          '27463','70046','54675','24639','49590',
                          '44783','62272','83724','30495','91194',
                          '88913','41018','55571','61425','42688',
                          '45090','94019','30772','54843','61428',
                          '76310','93359','79399','48680','66722',
                          '36921','15958','76149','15479','91898',
                          '39261','26052','83415','54144','97453',
                          '93727','28461','76238','53413','52869',
                          '93443','21627','18549','48290','40501',
                          '71358','73361','14019','68154','91388',
                          '96998','51412','44034','38771','64475',
                          '35973','99279','78436','20527','68230',
                          '74728','10714','83203','53286','34430',
                          '58157','64992','89008','40742','55235',
                          '51377','44146','58579','67267','37397',
                          '45658','84195','88577','76117','42560',
                          '26886','11222','80443','71543','13518',
                          '20950','86640','63821','44846','76597',
                          '52516','36544','96033','84083','85694',
                          '82607','51011','81574','44463','24941',
                          '45428','57976','52263','55416','58299',
                          '33106','82562','44663','13639','17722',
                          '56776','92086','55193','63038','88277',
                          '77366','88850','87728','40633','25413',
                          '69984','84851','97696','88439','36349',
                          '86369','19760','43836','58375','14387',
                          '41628','76756','40388','16050','91402',
                          '29469','82411','18182','74030','74979',
                          '50023','67790','24344','10650','26309',
                          '73172','54000','75638','88761','60615',
                          '28137','23734','24678','12521','51791',
                          '43664','65519','30781','20017','86046',
                          '95455','76011','41469','89445','15634',
                          '12626','71178','89786','72529','18014',
                          '81119','92298','45355','99796','11996',
                          '53404','44393','12304','76676','75648',
                          '92892','93411','97619','65368','30591',
                          '86016','27482','94907','67032','87455',
                          '85822','43644','45584','16190','69298',
                          '52558','76118','23135','51843','77403',
                          '63762','53921','87760','20137','76942',
                          '75851','50830','24594','37721','26544',
                          '18235','31679','49279','98132','70041',
                          '82070','43404','26282','44936','51354',
                          '58718','80904','50735','82251','49714',
                          '72745','58655','95794','98568','73980',
                          '38567','90835','48898','46057','28388',
                          '93137','88749','42123','80772','40644',
                          '72700','57928','96242','60712','23919',
                          '25904','61743','74925','13417','28363',
                          '46460','92159','35969','39994')
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


