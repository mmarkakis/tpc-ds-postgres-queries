
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
                          '15903','66835','86330','99341','94370','80445',
                          '35246','39672','24836','95674','25901',
                          '19659','89060','67912','51785','32318',
                          '16523','98933','48652','23729','71402',
                          '22967','82832','16294','60225','76748',
                          '38906','25991','40077','46602','18675',
                          '62695','94544','58845','52483','87458',
                          '33423','17606','95241','10525','88105',
                          '53139','58418','31903','70576','79369',
                          '44404','63577','95600','60595','96929',
                          '75941','35512','10828','53206','72253',
                          '38345','75738','21945','13612','84716',
                          '87117','88383','59795','42017','71213',
                          '67344','32860','47230','61983','32688',
                          '34380','30236','82175','48700','51674',
                          '54942','24962','17559','78064','20449',
                          '65325','17806','85364','34862','62527',
                          '66302','76474','86835','34469','68518',
                          '24684','15717','86931','50394','94812',
                          '21975','85993','52199','84352','77923',
                          '15166','79567','12131','69726','97456',
                          '91711','63557','22265','21214','19852',
                          '96372','14687','65748','33957','67096',
                          '44033','71976','85766','84085','88984',
                          '96240','54725','92451','65104','92766',
                          '23682','81217','18448','89768','85074',
                          '33499','93105','60699','55512','92468',
                          '41290','58564','96913','29391','30765',
                          '17534','77562','70366','32177','83481',
                          '15139','80541','47500','89485','47028',
                          '67218','33037','21079','11379','37867',
                          '17014','25492','34706','36095','83047',
                          '45886','10375','89174','36943','55457',
                          '29185','18329','93216','73468','27119',
                          '48218','85781','87181','67933','74148',
                          '26172','89168','53995','38290','46402',
                          '64814','66997','48845','55735','18142',
                          '82900','13050','36663','27224','67947',
                          '86354','19678','99455','17356','36562',
                          '87621','85185','33238','16942','53638',
                          '69050','45792','43040','84332','44762',
                          '52893','91251','23052','78690','22790',
                          '38086','45634','22528','79711','48450',
                          '41508','50248','20213','43601','41444',
                          '22598','47871','77359','59786','67999',
                          '92677','21911','50802','74499','51455',
                          '50646','74434','31175','69995','40110',
                          '24680','89209','70472','90027','43440',
                          '23897','30767','64855','28471','10508',
                          '72462','12384','16894','67211','43763',
                          '73756','46302','67238','56773','32249',
                          '70723','74226','65797','80498','67877',
                          '75288','83723','27066','10381','22278',
                          '86905','30428','40400','61858','51688',
                          '44927','34693','12276','59846','55124',
                          '94525','86253','95422','43910','77586',
                          '85925','80646','54857','14031','27053',
                          '22920','13812','30711','41902','62358',
                          '83144','63561','39347','95901','54619',
                          '80183','63188','24886','33174','75961',
                          '20244','54772','18507','44828','81366',
                          '98842','97155','76859','58895','56000',
                          '51935','68513','89803','57888','44542',
                          '17486','38549','54632','36385','53404',
                          '38763','80239','81056','36713','41315',
                          '26012','65021','72450','37071','81904',
                          '90470','98673','54969','38095','56692',
                          '23866','12124','81955','58205','26545',
                          '47601','78334','57982','38503','94124',
                          '98080','74711','31025','24807','13822',
                          '21298','90325','29351','23903','34914',
                          '34117','21098','55910','74153','74876',
                          '66618','38459','12555','37391','75976',
                          '36606','31885','87248','32053','37882',
                          '49134','96760','15569','21414','14589',
                          '30126','48300','91164','17291','54689',
                          '12285','70223','40057','50797','67942',
                          '60546','71796','87235','77884','96894',
                          '70640','32400','89984','19515','36137',
                          '18651','70799','29983','79966')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

