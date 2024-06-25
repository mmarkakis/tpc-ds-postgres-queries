
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
                          '53443','78865','64875','39852','91886','17701',
                          '95459','92623','33419','79585','20418',
                          '21140','69481','59373','23743','22890',
                          '60441','16883','30616','10590','51321',
                          '34383','14991','16202','32553','51248',
                          '87739','46362','34539','55798','73318',
                          '17815','59892','14603','26592','84288',
                          '40449','19987','56079','12364','87746',
                          '11807','74792','67443','10930','63062',
                          '27864','10340','29478','45720','63868',
                          '56760','69713','48083','24238','27215',
                          '13817','91473','58301','28567','21383',
                          '94349','38343','18598','14430','31745',
                          '44407','35130','82768','33856','73533',
                          '97261','16673','35518','35536','97231',
                          '69289','34118','96170','14070','75205',
                          '79911','95437','38146','52204','58350',
                          '75546','38561','49008','69867','94340',
                          '74706','45956','57302','52632','55736',
                          '33870','44825','67160','60480','26796',
                          '36668','11236','82018','17429','69618',
                          '69676','30948','93627','71802','37655',
                          '39672','44595','97680','41179','37933',
                          '84778','78328','53366','51915','39225',
                          '29593','51658','49260','11003','61453',
                          '61820','10434','10206','50897','17016',
                          '84235','79667','33047','25381','70480',
                          '39638','26930','21900','75096','82038',
                          '93516','69281','53704','99294','84407',
                          '52498','24343','10765','98569','84748',
                          '56576','56688','40322','41501','28217',
                          '82216','27729','30360','56683','90260',
                          '30730','41538','40252','82683','74620',
                          '78755','47715','52567','72014','51475',
                          '94662','84966','60102','50095','63395',
                          '66425','95479','47015','23967','84454',
                          '24589','86116','38440','73902','64763',
                          '60437','48609','90424','93629','21547',
                          '76768','37875','17926','98726','12928',
                          '85078','85628','61482','80196','34609',
                          '66418','68937','96300','62052','42112',
                          '28322','27255','48758','18534','97639',
                          '56846','19728','22067','14975','55817',
                          '29432','58168','19103','50932','10718',
                          '22594','76797','23431','57229','68700',
                          '10855','88205','35818','25855','68337',
                          '19978','99762','42720','54200','13990',
                          '47487','98823','80480','42797','11872',
                          '89828','48249','90788','57911','83760',
                          '51175','62493','52662','96551','71576',
                          '67595','81303','29601','54599','93361',
                          '55291','72590','22585','70205','78304',
                          '18596','21739','45507','79966','91770',
                          '29514','33652','87611','44030','42382',
                          '37059','60126','33604','98703','12939',
                          '80439','49944','79286','50127','27717',
                          '98589','15917','80693','68961','20523',
                          '55961','83785','22666','49927','50737',
                          '37703','42517','61057','56974','35217',
                          '72295','51199','61300','86911','92833',
                          '72528','99736','20893','94258','60003',
                          '57120','15738','47755','42043','41954',
                          '59204','99959','47711','97670','71953',
                          '76093','69175','82958','54534','47958',
                          '54574','26942','79548','60534','69814',
                          '68362','91856','10167','20873','63756',
                          '94857','84012','41399','99564','19829',
                          '92528','53313','18511','95607','84893',
                          '57099','45767','35512','11171','50799',
                          '53328','86541','84202','57831','90266',
                          '88893','32403','19870','23350','35202',
                          '38747','92119','61732','90668','99474',
                          '28472','36847','18658','78968','35252',
                          '41478','84842','58454','89179','28507',
                          '98733','96834','70695','58495','46203',
                          '94333','46663','97837','32154','39324',
                          '13284','24590','58974','12952','75268',
                          '33632','51843','90486','67545','50168',
                          '34625','52562','93091','92267','85613',
                          '46308','91962','52491','69775')
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
  and d_qoy = 2 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

