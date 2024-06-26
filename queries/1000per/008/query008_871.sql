
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
                          '13860','77160','82755','40293','94718','31987',
                          '53917','47245','80669','40041','94467',
                          '63619','58804','55037','28449','74727',
                          '38198','40273','65503','75662','29917',
                          '46091','68414','82132','36045','58354',
                          '90295','63229','93680','73069','32240',
                          '64979','24857','35713','35021','95337',
                          '66154','88478','93928','89365','11845',
                          '57116','25010','96657','72217','98186',
                          '67594','64211','19474','18107','79604',
                          '38480','24946','56515','43833','28510',
                          '59868','28391','13981','72791','22576',
                          '29058','26505','19195','92829','58398',
                          '64984','21388','25315','10187','38608',
                          '20087','82416','96223','78670','59519',
                          '68437','50988','29198','54904','98470',
                          '99522','44398','71463','77032','70570',
                          '39631','43520','16482','90660','55083',
                          '10846','23978','71019','17081','56055',
                          '33963','35094','71921','84249','94802',
                          '68953','64505','90983','33755','13776',
                          '93386','82296','82053','39081','46944',
                          '37591','84335','90534','30579','54404',
                          '13893','77261','19203','10311','46722',
                          '62485','48874','66332','93721','95172',
                          '75310','27630','95524','51656','43945',
                          '30818','76157','72302','55156','20437',
                          '66518','30310','71875','43934','68862',
                          '64628','76045','79672','68189','44906',
                          '69614','98757','62622','69420','38033',
                          '67644','74086','64539','76922','81296',
                          '66437','45750','76291','62904','10011',
                          '72079','53444','61516','88525','67459',
                          '58132','36933','53208','40914','86618',
                          '61792','62146','25094','75488','97980',
                          '43625','84852','88716','94135','27727',
                          '27730','83480','37803','16096','75759',
                          '10378','29821','51995','99738','99367',
                          '19844','39030','87895','95841','87966',
                          '65656','72775','57939','58766','54310',
                          '50051','71665','55240','72853','72863',
                          '75658','75275','12103','41744','70273',
                          '49842','48831','24404','83969','56070',
                          '90463','36825','57272','84004','86201',
                          '12131','39308','89266','17701','92358',
                          '46698','97215','63526','63921','14276',
                          '47788','96482','20664','56253','29109',
                          '23737','65033','80488','63626','21540',
                          '87406','91687','25305','48305','61797',
                          '36102','22232','38683','42927','82323',
                          '56696','11357','31986','66482','40869',
                          '86963','36841','86757','81596','98701',
                          '34394','67715','59701','69464','65556',
                          '64708','89439','87716','26163','83126',
                          '19056','46151','39122','37984','61746',
                          '55117','55064','63938','90999','49626',
                          '23579','27378','63965','31547','99086',
                          '66747','60968','50954','73863','88295',
                          '16112','62533','34022','15084','35375',
                          '40239','70365','84528','65753','88489',
                          '70455','13188','92396','77264','16930',
                          '82917','93218','19280','82414','34478',
                          '42196','51747','71685','66189','31359',
                          '66775','65922','65607','83469','23548',
                          '73213','92593','38369','98049','29433',
                          '49546','65653','20765','14131','99479',
                          '82802','66272','33279','62678','39826',
                          '30106','66157','82286','24053','96292',
                          '63311','34228','89307','74818','26448',
                          '11945','15743','84108','47478','55793',
                          '18788','17349','41815','49201','23595',
                          '19509','84898','42306','74173','10357',
                          '81818','34746','93353','56838','36709',
                          '18001','79045','22545','13462','26204',
                          '94188','52073','23712','39517','32398',
                          '97953','65122','89427','63318','17967',
                          '39380','88474','90302','48954','56865',
                          '69095','15751','60496','49208','82516',
                          '34885','21909','45493','64202','86853',
                          '62461','13855','23325','50320')
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


