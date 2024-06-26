
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
                          '22038','60630','47402','67597','49136','77754',
                          '90618','63189','83954','47780','83990',
                          '92874','22238','44053','93525','61196',
                          '21818','91672','77574','62243','85438',
                          '96915','96621','53365','11072','99229',
                          '75995','37192','49666','57945','29413',
                          '86280','81420','66254','61264','57152',
                          '60306','33267','98051','76124','10641',
                          '68867','39099','79613','94348','52008',
                          '73397','65445','44379','14434','84649',
                          '28443','50910','72354','33288','65263',
                          '54422','86561','46785','93060','81903',
                          '99939','85960','51335','61893','23573',
                          '81600','89272','48958','72452','65137',
                          '70254','53737','76060','75965','54233',
                          '74236','19634','79851','72892','53045',
                          '26272','88599','64078','15374','20692',
                          '58109','51835','96474','70213','68172',
                          '62587','55983','37265','39995','20165',
                          '26419','75872','36655','84527','42875',
                          '77415','99669','18144','94198','39813',
                          '37292','99001','17641','41879','86087',
                          '72751','55087','64750','39301','32746',
                          '26738','37388','12583','29898','99727',
                          '97106','18275','90694','88633','47425',
                          '40665','99616','67380','24648','70181',
                          '19119','39749','73655','37183','76391',
                          '28205','10723','72536','12619','65494',
                          '80749','43646','77168','72136','39355',
                          '53397','87664','52313','31612','35399',
                          '80590','45312','78655','73572','11078',
                          '79628','42053','32966','87501','87106',
                          '23731','87131','68745','45958','80902',
                          '89703','55861','74550','47801','63261',
                          '61107','74515','43727','23066','98905',
                          '21380','36641','33750','55597','22289',
                          '84023','44956','53924','32010','42445',
                          '34755','96834','58931','71700','90404',
                          '53385','65010','61228','30529','88085',
                          '26987','73403','79369','30834','59290',
                          '58158','86445','67642','10637','98754',
                          '28497','84034','66132','47241','54450',
                          '42990','75174','99125','98118','20700',
                          '48224','80943','28115','76448','64189',
                          '91242','43877','72686','61249','14872',
                          '19399','86971','98993','58367','75209',
                          '95399','91038','97505','54595','62916',
                          '87452','40722','89295','54608','81389',
                          '39682','96228','95506','70235','80144',
                          '86265','77077','67130','44119','47021',
                          '90877','30665','10971','61458','96356',
                          '95767','34548','82211','33434','18280',
                          '15160','78410','41416','63643','70579',
                          '92259','73528','25333','27218','46970',
                          '23542','23525','85393','66831','81583',
                          '11779','82484','65164','97122','58921',
                          '44299','38815','62559','77755','35918',
                          '29592','91477','84219','21790','92007',
                          '63038','26117','73120','35894','40819',
                          '45782','40275','49315','59064','30497',
                          '28680','11564','67307','54538','51915',
                          '51271','50540','80903','68605','65373',
                          '32694','28588','88690','25854','27924',
                          '78199','97084','63690','27052','44921',
                          '98673','85543','38302','40906','23995',
                          '58519','64145','99073','79127','82831',
                          '58776','41143','83601','11148','34197',
                          '70363','81632','14654','47703','21587',
                          '44702','37826','60900','46014','97085',
                          '97162','72588','58337','96251','93882',
                          '42067','33708','45216','56808','48136',
                          '69865','91345','15689','27083','43592',
                          '78905','78086','55046','77213','38489',
                          '96292','91428','41903','86457','89062',
                          '64405','19740','38075','18587','65666',
                          '18111','67148','53913','99565','76357',
                          '86672','65761','79465','95550','13619',
                          '52190','32417','18750','89121','89628',
                          '68193','45300','86102','57478','30428',
                          '27107','70995','89344','25681')
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


