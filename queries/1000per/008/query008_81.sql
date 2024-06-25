
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
                          '70063','98248','24500','18684','81396','45239',
                          '93685','76869','70110','72744','60806',
                          '97567','17313','11855','24010','19432',
                          '72533','33268','64340','97294','62824',
                          '41939','41607','62076','38159','52678',
                          '21406','20186','65444','86550','52893',
                          '97856','27060','45406','48901','89338',
                          '39291','75587','54679','44715','22910',
                          '20954','15640','83600','43467','48206',
                          '52208','30737','14015','13828','88041',
                          '89042','80016','80862','89000','41960',
                          '93967','80061','38975','30618','71389',
                          '77615','91300','78966','83345','70358',
                          '18200','47591','63739','33203','89289',
                          '10169','64164','51396','72931','55833',
                          '58259','91627','19778','59831','63523',
                          '38299','52260','95220','25931','36264',
                          '59946','72115','19610','34998','87977',
                          '18765','71687','31051','77151','12700',
                          '44598','54893','29084','80859','12353',
                          '82373','71528','86521','53140','54038',
                          '24069','83815','57964','78022','79406',
                          '50728','54092','30587','93056','55009',
                          '38749','31651','73335','77488','82912',
                          '34942','45304','36951','97982','76570',
                          '82965','51408','86132','93051','71789',
                          '87771','87235','88287','71745','79597',
                          '98514','39745','66234','64893','62566',
                          '83787','50043','78884','31721','20255',
                          '18696','90360','22623','56583','63840',
                          '75239','61382','58173','25659','83187',
                          '61585','66608','11610','97709','10796',
                          '51662','10452','24958','48286','70582',
                          '55268','67174','17864','97302','69502',
                          '10661','78314','44667','65769','97917',
                          '51037','76864','96063','72011','50513',
                          '66249','71091','81216','70507','19554',
                          '44569','43666','30342','68928','10107',
                          '63667','52436','75233','65146','84164',
                          '42172','70288','37667','40474','64035',
                          '80970','16636','39184','77441','81923',
                          '69566','24094','89927','99195','46718',
                          '18514','48846','77113','15626','88577',
                          '82163','54824','34129','34148','17241',
                          '98302','45697','47341','53697','56158',
                          '29022','22693','39338','81560','71764',
                          '40788','69114','99336','72809','91047',
                          '86694','23809','34277','55389','21848',
                          '25722','37586','39507','23446','83501',
                          '83643','32412','95707','48470','47497',
                          '86337','63446','47351','30169','61483',
                          '62158','48148','41622','83416','17078',
                          '43576','35701','54062','19131','52365',
                          '54031','82214','22951','65561','33721',
                          '38389','87907','66361','99019','70935',
                          '37478','30477','29468','80503','27018',
                          '43578','98541','53976','90869','85713',
                          '77847','40751','44728','13502','41562',
                          '17057','81932','85603','33618','68985',
                          '59316','97919','87210','89519','78781',
                          '56508','89322','69251','73825','34121',
                          '24033','53837','19571','91253','51624',
                          '63509','37387','43812','43927','90218',
                          '26606','10233','29492','41854','51761',
                          '83334','32110','12589','72607','88283',
                          '13248','15735','84519','56772','71759',
                          '24590','81328','94200','34069','54298',
                          '22113','92019','63720','37602','57630',
                          '11814','98477','61560','57758','68912',
                          '50854','97674','31512','26766','72312',
                          '91132','97705','69164','24823','76348',
                          '81939','86327','69998','60044','49941',
                          '31442','84474','61065','67472','18596',
                          '24778','96774','83816','31142','48152',
                          '49201','23373','56531','88009','43694',
                          '80615','50009','92898','52284','38812',
                          '79740','84584','14213','26825','16548',
                          '22928','97582','59955','28463','68172',
                          '24384','40970','57093','58567','98952',
                          '40410','94942','87258','56929')
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


