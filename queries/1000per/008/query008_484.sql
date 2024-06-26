
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
                          '49984','86059','16808','66771','77050','27009',
                          '81291','22059','75707','79975','46115',
                          '55403','74628','64228','22561','33971',
                          '75189','29818','89466','87272','77014',
                          '62144','71733','83994','59915','41470',
                          '28960','56124','60553','12569','34838',
                          '29743','72049','45774','79199','40924',
                          '32003','11937','91716','76255','76972',
                          '89617','42105','18446','35949','49674',
                          '89700','49508','64887','44575','93701',
                          '49302','72105','10686','95480','44106',
                          '33360','26717','38196','18105','84967',
                          '16083','58334','21899','81680','77538',
                          '15231','36232','91810','43733','99669',
                          '97532','60405','32828','47275','43948',
                          '82157','50561','35331','86928','63689',
                          '81634','55673','76575','38820','88583',
                          '41629','79248','24274','42782','13327',
                          '87428','26137','77346','21297','87270',
                          '82060','45471','30916','45823','57370',
                          '65645','79404','96544','31267','95577',
                          '92215','19999','13443','36398','96082',
                          '94984','95814','33763','68987','47919',
                          '24628','84681','93592','21924','19510',
                          '44570','72545','61410','86362','64139',
                          '36817','44195','65801','85164','97106',
                          '28882','75121','50743','22767','64281',
                          '36983','80773','91808','67708','21033',
                          '90754','99973','53388','35019','59303',
                          '68924','50247','82350','42368','93076',
                          '58299','12892','74496','96589','79157',
                          '79099','80926','27344','91909','85216',
                          '59705','17533','21894','43265','20653',
                          '48688','74324','28130','24757','61194',
                          '56383','90443','53426','86716','29905',
                          '97373','79805','95056','28917','22225',
                          '69003','99653','15300','75742','42899',
                          '70243','39284','53210','52695','66763',
                          '79659','99969','83768','61048','37379',
                          '66937','47602','55781','53583','85323',
                          '87952','47267','13983','76909','72152',
                          '83648','48271','41167','69372','65243',
                          '11713','99986','12272','85780','86277',
                          '77249','34849','13885','64423','88991',
                          '17895','90885','32726','65401','57514',
                          '47193','99626','66714','22032','23141',
                          '31741','45525','91334','39808','81869',
                          '77777','72278','71395','37324','37078',
                          '50129','34557','79136','84743','19365',
                          '27569','64731','34358','51812','68466',
                          '52658','39943','18604','81550','54969',
                          '92495','68005','30046','59985','95459',
                          '34202','85857','21669','24887','84024',
                          '56485','45236','70800','72320','51391',
                          '25884','77535','41409','23235','99712',
                          '84177','78349','33505','79350','42886',
                          '61042','87401','58315','12660','64703',
                          '89727','60434','64119','47769','34364',
                          '81205','35874','50091','73752','66000',
                          '40290','34806','64303','48765','49540',
                          '38010','60609','49722','51631','87269',
                          '29960','68145','57088','42470','99299',
                          '36481','20854','42535','14632','35497',
                          '34688','21754','16679','83658','73895',
                          '12168','10280','63623','81651','53591',
                          '51457','63451','42335','20162','18243',
                          '82509','83364','63210','11731','38711',
                          '47676','47325','22467','87667','53132',
                          '68872','19765','99077','56455','20281',
                          '93220','61666','68671','79921','86935',
                          '36562','45326','46182','28261','76094',
                          '52287','21053','84778','34027','51896',
                          '27430','74615','12281','48415','78087',
                          '30591','29978','96747','81998','73889',
                          '69730','95646','87304','72916','21170',
                          '17575','10099','68913','89751','39653',
                          '91868','26022','73707','71102','83452',
                          '70369','51927','46177','41705','79151',
                          '60760','83413','69493','95592','23195',
                          '50508','50865','35757','32154')
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


