
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
                          '27163','91689','19127','73051','17336','80389',
                          '22174','28998','28291','70714','60706',
                          '92211','95617','88129','14177','88993',
                          '16228','95544','25746','88115','69292',
                          '45861','53533','69484','96638','28818',
                          '88914','83449','87835','43279','42996',
                          '23400','57120','98399','84909','98940',
                          '17970','68053','65116','44497','30591',
                          '83340','84223','44385','77597','74301',
                          '41709','50991','57106','14597','69506',
                          '93546','99366','84859','60824','81070',
                          '71139','29281','55887','11443','94354',
                          '60485','16130','56366','49075','12987',
                          '56863','74906','50858','43378','96096',
                          '13806','78229','28858','71740','91663',
                          '88723','60776','33477','54493','45729',
                          '76200','66733','88711','88604','31087',
                          '64674','15721','12598','79963','86662',
                          '26930','64389','74536','45180','60094',
                          '87630','41303','75449','62366','29816',
                          '25835','19909','80260','95524','59064',
                          '35039','95699','61567','75637','87586',
                          '93909','71090','47482','50475','52257',
                          '47322','56946','32942','90637','16123',
                          '58095','36795','42967','26678','28481',
                          '46671','33565','24613','79444','72967',
                          '73710','88982','20336','28674','20718',
                          '26983','93580','96738','73537','53180',
                          '72976','84138','71526','33564','19343',
                          '41629','79483','99808','42970','85456',
                          '60316','63912','80068','41424','46823',
                          '91118','49210','22874','46480','43574',
                          '56818','18278','46414','64027','44970',
                          '88464','22090','14893','63501','57570',
                          '99435','63755','14598','78772','62898',
                          '93943','49226','96527','40696','38465',
                          '79649','58536','49953','34999','69182',
                          '23167','28088','75397','24441','37672',
                          '33559','70877','84583','73317','68188',
                          '84476','80165','96110','57898','13604',
                          '19521','70480','96405','50567','74917',
                          '40137','88482','90940','54921','94962',
                          '68009','53695','40992','11826','63689',
                          '91195','89998','79003','98235','30370',
                          '79912','95833','58924','75455','96871',
                          '82708','49669','13512','41257','72155',
                          '19584','93704','99182','37638','25385',
                          '93813','27624','52543','95557','79255',
                          '21368','77356','35207','29210','37591',
                          '72547','73981','83380','75461','44936',
                          '51730','55822','17686','33041','86851',
                          '52958','82027','12328','23275','88382',
                          '47257','24951','24884','24591','14926',
                          '50306','43686','87834','98337','64153',
                          '31227','45356','32488','64413','91567',
                          '71948','94812','85807','73029','31253',
                          '74719','38265','64821','53863','76914',
                          '18481','63081','26899','63493','86355',
                          '68015','13749','73540','76859','28993',
                          '84793','26205','25828','35106','23887',
                          '14337','28322','73501','91735','36017',
                          '24511','42489','13136','72004','11465',
                          '16962','42992','17662','13726','18099',
                          '88557','36500','90396','34785','37192',
                          '55636','80844','85070','37144','21457',
                          '90651','34911','53985','74608','72063',
                          '15899','23824','25208','13183','12359',
                          '31126','11559','35459','47786','89229',
                          '14764','32356','81206','54937','82275',
                          '66381','82849','40837','78894','22582',
                          '78641','28789','51271','83855','20370',
                          '31641','54974','57705','68171','26113',
                          '76207','99949','10848','14168','32185',
                          '17496','87081','68487','94991','62092',
                          '58169','76488','14490','84248','68675',
                          '64133','39807','63678','77799','35287',
                          '66389','48820','21310','44847','35396',
                          '75004','89935','29243','97808','38849',
                          '46000','22858','94235','81176','21370',
                          '97689','83792','13524','40020')
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

