
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
                          '37766','96922','68834','72574','62219','56808',
                          '99167','84247','70824','13921','31753',
                          '55697','34057','98762','63824','48234',
                          '21025','84499','94670','41514','12665',
                          '87008','16496','47500','11290','42442',
                          '25103','59427','79474','75879','88835',
                          '96687','85703','97352','25562','39797',
                          '69952','68876','28803','98039','37013',
                          '53996','50659','28359','16540','32875',
                          '19452','48768','11986','74341','78247',
                          '75058','48542','15792','96619','38396',
                          '33569','41312','13878','36812','63579',
                          '62483','76124','96792','77669','75842',
                          '49166','19556','39743','66843','54333',
                          '20169','19756','75214','24421','26057',
                          '49069','58845','77039','96090','38712',
                          '24671','10761','16649','75270','72693',
                          '82293','50347','70399','73217','59179',
                          '70235','63991','69440','35580','66953',
                          '70397','47262','70569','46044','28603',
                          '38875','78806','36392','35573','71226',
                          '46942','56152','68330','17170','49336',
                          '23663','24720','32761','25158','81752',
                          '74216','68501','71052','37187','33748',
                          '40141','92441','99995','16650','99649',
                          '87341','73509','57908','45302','29760',
                          '81281','69514','38720','29264','87771',
                          '90742','71274','89235','76491','99291',
                          '27245','55344','17269','68435','81561',
                          '78864','80048','45200','71766','52779',
                          '53752','81875','11568','68444','56583',
                          '99515','38612','99816','80604','92644',
                          '34366','10643','57454','28218','62268',
                          '24345','76900','34428','45686','42002',
                          '63142','63201','43378','32235','74622',
                          '19206','44585','80829','79290','23931',
                          '99688','96235','68561','53137','43568',
                          '47441','99992','37958','46252','58255',
                          '76297','51194','81640','74836','80391',
                          '77132','74026','33462','21229','14299',
                          '12128','66299','90575','67130','38425',
                          '92339','14640','53362','41138','46954',
                          '80510','14327','60113','65486','69445',
                          '23283','69895','47950','73431','49479',
                          '46080','18810','68512','31903','33379',
                          '75862','22073','12988','46422','97252',
                          '55436','11876','98892','22504','45133',
                          '61116','99273','84082','35277','47381',
                          '23345','15706','67454','50917','25560',
                          '43150','71442','83251','31124','58025',
                          '71610','59952','36985','21705','12204',
                          '47820','62081','68034','86558','32616',
                          '84555','98423','96239','30167','85110',
                          '62828','52418','42952','43611','18903',
                          '55775','50502','54477','41678','99424',
                          '68361','93139','80825','44238','26760',
                          '81069','32030','56937','46567','71897',
                          '72315','23431','96592','61680','66627',
                          '42578','92896','41672','43670','89865',
                          '12873','34129','90979','72858','53597',
                          '19321','66422','68251','41737','25350',
                          '20422','27511','82882','15041','34092',
                          '61570','41588','90018','84520','16549',
                          '70366','52969','52177','42101','66637',
                          '44730','49263','43837','23471','24240',
                          '65873','67113','74868','91741','97647',
                          '10427','73757','26825','52488','47008',
                          '72585','95253','89324','92529','85295',
                          '16517','29654','44024','71112','90754',
                          '63699','59290','24825','78586','60288',
                          '22490','87234','73107','14120','66820',
                          '54608','72751','89402','27758','80503',
                          '77842','27771','66437','65040','87856',
                          '47875','25379','78564','62643','82451',
                          '51519','61156','70451','76563','14756',
                          '73491','76049','49789','89313','92082',
                          '93317','26199','95446','15987','63998',
                          '51414','97846','61092','73585','18748',
                          '85119','19123','72625','45041','16513',
                          '81796','50629','50107','22468')
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


