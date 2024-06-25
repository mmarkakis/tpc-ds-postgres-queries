
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
                          '34174','30165','33915','31993','36509','70701',
                          '86441','53732','76589','15057','43506',
                          '22051','15910','70886','43479','27182',
                          '18904','43232','60246','96885','26439',
                          '63019','39798','25073','14149','44505',
                          '98294','99824','76168','83790','74413',
                          '31237','49787','41239','39146','50076',
                          '64364','25669','35021','91164','32070',
                          '31596','73307','97335','55213','35239',
                          '54232','39784','29215','17983','27555',
                          '59301','64647','62739','62750','65294',
                          '95412','37066','25081','75540','23416',
                          '53933','93973','38424','40002','74821',
                          '67178','52803','75543','33290','50620',
                          '41378','48307','83990','60020','47627',
                          '52171','58740','73167','48813','29844',
                          '41338','30883','43803','63779','18920',
                          '35199','60044','81802','82034','18250',
                          '73225','90924','58811','48963','72994',
                          '15398','76398','75366','24150','86555',
                          '55294','15800','96245','50197','95879',
                          '13364','19821','30278','16012','97439',
                          '47474','55738','55190','65483','15250',
                          '84509','66276','33462','71875','28198',
                          '19011','92375','12824','47913','28490',
                          '25309','33948','92095','23171','19477',
                          '58920','92953','82783','90050','57372',
                          '41074','81846','11114','57936','42248',
                          '58435','60334','94854','49406','49428',
                          '94872','45038','88095','75441','61128',
                          '20123','26794','15883','92818','40329',
                          '69522','20573','42537','82656','48026',
                          '60310','67531','57841','55679','70867',
                          '63125','21664','26522','36936','35762',
                          '86732','89467','86016','69854','97337',
                          '40249','27118','39623','70685','59147',
                          '82718','74181','34522','28221','21477',
                          '96037','69845','92775','76130','45643',
                          '23833','37410','69964','34879','99338',
                          '66046','60353','75812','25618','21019',
                          '14247','92523','80752','44925','17903',
                          '98078','55444','64984','96573','60801',
                          '37462','30311','69593','29870','59713',
                          '94009','10147','40544','67209','38295',
                          '77721','61011','46642','18411','32670',
                          '43393','75692','15003','44497','28112',
                          '90063','84430','22536','30298','47976',
                          '95892','79268','36403','16871','99980',
                          '60479','45692','75520','23763','56395',
                          '65048','75233','99348','29978','65630',
                          '98496','76035','49241','74999','22926',
                          '34481','79546','99180','10008','68243',
                          '54880','25846','21622','44558','58267',
                          '27512','29385','72922','74102','34505',
                          '39755','67718','11356','84593','78112',
                          '29669','99436','56145','41084','49850',
                          '77951','63393','31139','65615','43706',
                          '88860','92139','77159','16501','10907',
                          '17222','61633','67775','76024','56723',
                          '83324','76939','21166','55441','23515',
                          '52975','73255','28273','33758','13147',
                          '27170','33402','51935','47581','53176',
                          '74137','18378','15530','17274','20605',
                          '52634','87474','90604','85887','37146',
                          '16894','71807','31627','61512','95166',
                          '13340','57603','67629','87361','73681',
                          '54899','37627','66486','77976','90264',
                          '30031','90039','72390','35215','41798',
                          '25860','49639','48310','52954','59465',
                          '56547','66417','16005','93307','67346',
                          '58501','46418','19341','20258','32217',
                          '37187','80008','83438','66286','90378',
                          '62315','74536','59870','97638','98292',
                          '31098','15944','48029','30634','11173',
                          '83012','15737','40965','68959','88490',
                          '99542','55782','34042','84707','72751',
                          '14633','26857','16474','24604','67721',
                          '91845','73085','72659','90325','15069',
                          '88666','90460','34073','43617','76040',
                          '20824','92772','58761','23263')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

