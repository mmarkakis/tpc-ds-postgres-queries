
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
                          '35818','35169','34050','29480','31917','90939',
                          '18391','39400','73107','76403','60783',
                          '45542','99573','22671','58329','33892',
                          '57319','98382','38033','23134','90928',
                          '27636','72444','54391','96270','90094',
                          '92901','39478','65459','86835','76734',
                          '69032','23851','95922','13220','25147',
                          '73714','97773','87733','81194','48505',
                          '49190','62368','26642','27144','40381',
                          '32795','54765','86305','35711','43588',
                          '57856','86306','19053','45000','53097',
                          '28651','48565','21391','27712','26480',
                          '49587','89060','31306','81951','59250',
                          '21403','17832','75586','93743','70655',
                          '38340','33235','54228','10029','65651',
                          '40096','88533','75377','56881','76849',
                          '18973','42079','84057','87917','39719',
                          '68810','52983','69551','48031','22629',
                          '56906','33346','12433','72519','32425',
                          '50883','26728','75884','57553','58314',
                          '78920','36375','38385','40103','75169',
                          '67750','30818','27356','53436','21703',
                          '82979','96832','84392','49696','84219',
                          '11959','34653','55112','34929','97260',
                          '13844','67538','47536','95317','17438',
                          '26465','75306','60869','59441','94192',
                          '20808','25057','43888','97512','47094',
                          '67565','76958','93534','25108','84921',
                          '56936','30575','21817','57912','35909',
                          '77038','91813','67226','60904','57268',
                          '38743','26920','46893','54197','70937',
                          '50298','20218','90273','87183','64295',
                          '42693','72302','32364','36819','62882',
                          '43994','87097','24961','79347','27995',
                          '48529','52614','43949','66281','29064',
                          '78773','54755','22973','73299','80358',
                          '55578','55995','26685','24640','26745',
                          '10609','85768','24820','19300','56010',
                          '81342','68009','57399','13557','52481',
                          '31826','62215','86866','87976','58533',
                          '90457','19215','30266','50404','58420',
                          '17191','31294','44346','85625','31973',
                          '86116','21461','18198','91271','97814',
                          '44812','99996','99569','96100','70098',
                          '44500','40284','96205','59689','54576',
                          '86454','25227','28740','44567','19393',
                          '77711','66607','78204','54670','54461',
                          '45157','59327','64668','44397','75933',
                          '81271','16552','11133','55374','16925',
                          '75672','18631','39354','82766','64360',
                          '59131','82323','80856','84542','88350',
                          '83673','87107','34622','54412','80163',
                          '69550','24221','34634','16734','19402',
                          '64025','95887','89616','72082','75924',
                          '33990','69246','76136','35874','29986',
                          '20105','65901','41444','30281','51058',
                          '29792','73539','94895','46822','35260',
                          '79071','53083','17108','34319','51377',
                          '83233','38177','97878','16569','90901',
                          '30271','55278','61140','24766','39756',
                          '25733','94034','24844','89442','28153',
                          '67007','23723','52942','89624','89278',
                          '32540','76386','28051','94130','49901',
                          '95677','67541','19103','91126','30085',
                          '28481','14093','31474','32597','48916',
                          '99958','21340','43789','31765','92677',
                          '70519','78817','20596','93628','26835',
                          '77109','28517','29613','17915','93418',
                          '76223','78475','91667','32592','51978',
                          '82432','23664','68663','63123','20047',
                          '87880','56553','88086','77253','86115',
                          '20141','57819','67821','75032','76723',
                          '82852','96667','52252','68565','97799',
                          '76464','25260','90415','27531','25341',
                          '10148','84286','61417','21710','74317',
                          '37448','57889','95231','44153','85645',
                          '32394','41799','50933','48414','25727',
                          '24811','50300','96943','92736','34398',
                          '87846','89714','49405','48079','94720',
                          '33953','75616','43311','37591')
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


