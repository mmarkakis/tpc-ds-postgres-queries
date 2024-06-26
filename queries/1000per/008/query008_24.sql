
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
                          '62729','91420','28347','27234','95209','40171',
                          '21195','78447','28318','74656','42850',
                          '74594','51671','12439','33316','70737',
                          '19976','55675','13707','81234','68234',
                          '64326','78734','97096','73927','51220',
                          '28371','75474','60702','23991','91235',
                          '84705','84046','44737','59487','51249',
                          '92577','96748','24605','60295','71000',
                          '40551','33483','84547','27287','32424',
                          '35009','31119','50713','17469','54008',
                          '98564','50424','31259','25081','30117',
                          '55783','77387','38941','11038','68192',
                          '12286','86579','22927','71770','39227',
                          '30435','71075','78165','23730','66055',
                          '42242','52907','90222','63953','98430',
                          '22282','79894','58110','61046','67193',
                          '82230','10169','33804','67275','40023',
                          '24113','55432','78796','68090','99773',
                          '70424','95198','62202','22320','94181',
                          '27087','19750','18532','80827','72074',
                          '15614','25943','55668','60331','66782',
                          '23068','36542','88790','12563','76136',
                          '24780','50755','53127','10848','33637',
                          '46269','83830','77264','82718','71660',
                          '21364','26585','76527','95872','92088',
                          '43537','49426','46421','25684','45823',
                          '17140','15555','74098','33589','86249',
                          '15847','67966','27490','28742','90531',
                          '35681','71547','95805','77950','60443',
                          '57938','71058','92969','38878','24956',
                          '19460','84749','33047','69218','31226',
                          '58270','21095','45458','46530','41676',
                          '33647','68598','37357','86291','50279',
                          '92846','25469','26485','80056','76643',
                          '67667','91582','13133','39460','51735',
                          '97005','39504','62664','33661','36475',
                          '67507','21427','89064','35808','54970',
                          '59997','99499','34504','72097','48893',
                          '97486','97145','55111','59556','15244',
                          '41229','74006','38825','88594','35491',
                          '25108','58185','79878','73058','42971',
                          '72735','74368','37243','49905','26106',
                          '82937','97419','28454','53107','50456',
                          '11322','10534','95628','22506','48909',
                          '61944','46010','51937','47173','24258',
                          '29303','60090','58827','47414','68318',
                          '69783','85566','39390','75493','49299',
                          '72310','15838','42287','73294','29637',
                          '81235','17996','85618','71848','53804',
                          '16621','78651','53667','84934','48271',
                          '88913','85305','30215','23222','33386',
                          '54786','77470','53817','13214','90765',
                          '68364','79615','40509','92585','54994',
                          '97689','97048','12999','29930','14374',
                          '28034','44686','73478','79522','53214',
                          '87496','32592','48006','77524','44654',
                          '95787','80576','51403','80482','26138',
                          '30502','37984','72317','20487','78233',
                          '26391','31673','79562','60256','65526',
                          '12086','20233','59277','97594','87438',
                          '27491','21962','17098','77493','52528',
                          '89755','39236','93729','80491','35063',
                          '89622','65800','27000','97964','48858',
                          '32857','12356','82562','23582','14001',
                          '81762','59993','14073','43845','68533',
                          '99042','41196','77295','35942','70815',
                          '80875','11067','48356','30731','10665',
                          '95545','31036','42085','56226','91113',
                          '20133','13470','29696','85384','15087',
                          '17168','70875','44865','42184','93550',
                          '99790','17323','10543','59311','74563',
                          '38923','41725','49058','62801','20288',
                          '63672','27037','42151','26395','16985',
                          '30878','45046','74544','67022','93797',
                          '51047','82023','49168','45985','18854',
                          '71008','25301','12595','11439','23319',
                          '32135','50475','49172','23705','97505',
                          '20929','89963','14868','95835','16551',
                          '28531','32702','92542','29790','25014',
                          '83126','88420','74573','53502')
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


