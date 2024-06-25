
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
                          '28634','18459','97899','89228','92510','34166',
                          '11135','21909','46202','25597','64629',
                          '55285','34835','98196','75564','47998',
                          '74898','47991','48646','58595','87467',
                          '39175','35179','50157','67588','17429',
                          '95196','99499','36963','16867','61158',
                          '46206','58420','62908','34344','96623',
                          '14916','81956','88682','31490','10323',
                          '96719','14131','95163','87959','26084',
                          '55091','96196','40298','29900','47064',
                          '56979','48667','92955','84815','96555',
                          '75657','31597','46045','45061','94232',
                          '53533','65961','40929','21748','64242',
                          '29431','10999','41433','39531','71557',
                          '81774','93729','33468','39472','75035',
                          '20704','93075','48866','96889','50152',
                          '30523','19860','89374','10430','59398',
                          '82586','12920','21237','61173','56626',
                          '71238','90469','52838','19580','49281',
                          '42452','45567','45414','26074','25876',
                          '98411','47059','25690','91296','38131',
                          '22953','24421','76038','11309','21381',
                          '56602','85675','84478','33336','99489',
                          '95370','53779','21821','67775','34364',
                          '40340','86777','46240','89889','32285',
                          '57840','93739','74869','14665','72681',
                          '68990','29154','85053','96155','29245',
                          '48737','50586','74362','13715','66623',
                          '35886','26865','91581','17314','22720',
                          '91348','99629','79708','44398','24976',
                          '98676','34184','83906','33314','55874',
                          '31020','92634','81052','80250','47311',
                          '27526','13432','48116','61993','15498',
                          '49513','15076','48878','94477','71093',
                          '15687','90617','89527','60777','35823',
                          '38365','31687','14606','20072','19294',
                          '60932','27154','27417','31591','42610',
                          '27486','56628','67567','29766','39114',
                          '67370','77450','72458','18123','30183',
                          '31630','22986','20266','58613','23099',
                          '47964','19064','42357','13322','67380',
                          '86344','99657','29913','57014','99451',
                          '36328','96583','20744','27427','45165',
                          '18092','87646','12690','25074','20157',
                          '69613','16496','26882','42396','26530',
                          '10669','16239','54615','71823','87838',
                          '76212','59962','18985','23730','49187',
                          '29435','20261','18531','31878','24410',
                          '95583','90737','64649','92613','17129',
                          '37342','45959','17979','90611','27764',
                          '56749','29024','90446','52887','99875',
                          '86224','69844','44880','58160','19244',
                          '91549','39056','66099','81968','42706',
                          '62187','75109','86823','77403','88216',
                          '40870','87552','72746','50821','67460',
                          '69400','55334','75027','63315','11214',
                          '83046','46194','76609','77284','77417',
                          '81424','73593','88396','96656','59255',
                          '69374','91851','74978','19305','79691',
                          '45389','94668','45307','10404','80486',
                          '50387','84493','92419','88215','69679',
                          '83606','99106','23912','90539','71973',
                          '36575','80732','75255','35603','27040',
                          '90823','18705','32466','97691','93587',
                          '15845','15102','70222','90929','32963',
                          '48631','34937','10626','29366','11868',
                          '15383','81107','38382','37940','93437',
                          '92667','50289','96124','50781','56716',
                          '69665','38714','51191','81446','15112',
                          '33423','16116','82729','93713','23534',
                          '29751','35633','65724','39259','43134',
                          '11917','46901','76382','50476','18595',
                          '59638','60971','32209','92424','11859',
                          '61767','83715','80478','66976','28202',
                          '30026','93707','28638','63418','19660',
                          '96551','68513','36059','58376','50523',
                          '43576','56547','21870','57416','14342',
                          '60100','90690','97541','97427','62429',
                          '47698','11597','63453','76777','26864',
                          '60378','45587','21807','13626')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


