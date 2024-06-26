
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
                          '57443','69299','53143','55917','91794','81552',
                          '39112','29553','17426','45404','98883',
                          '23910','94609','62550','90637','26226',
                          '64725','92304','51372','51303','63082',
                          '59921','40461','85780','32641','31445',
                          '72823','21937','60499','64177','76189',
                          '38852','80983','98629','33906','93924',
                          '43357','17033','74813','64702','18023',
                          '10275','27472','25045','10049','55148',
                          '28823','15695','25738','38354','12570',
                          '92309','17762','67526','71622','90222',
                          '93253','93871','93668','74207','95957',
                          '67136','87966','95578','83732','22479',
                          '63219','31657','75614','40477','30787',
                          '63760','30343','36062','39819','20543',
                          '22711','16315','81786','35298','37268',
                          '11636','38888','82727','67729','57677',
                          '54231','18079','15989','58796','44014',
                          '74500','79722','84400','76510','67942',
                          '47832','62228','18840','41103','29097',
                          '59106','75439','37749','66951','47502',
                          '60543','66177','76830','93070','22573',
                          '60649','37243','52717','77122','73124',
                          '10692','66717','58414','51482','74716',
                          '84854','47683','14123','69183','56115',
                          '50656','66523','38140','76054','83216',
                          '15770','16416','17529','54299','33254',
                          '45549','84710','34809','90458','74901',
                          '93632','81271','90191','35627','47719',
                          '54246','61999','74790','88434','81194',
                          '20518','30410','95641','10097','83504',
                          '28236','63013','75678','81129','69477',
                          '79039','35812','75142','37022','92708',
                          '75167','11702','58117','70689','35941',
                          '84053','81613','98983','27659','15344',
                          '37570','13747','31393','82897','79103',
                          '57901','28521','18821','14658','26412',
                          '58773','61975','54827','38444','69246',
                          '75261','38203','70157','54142','55817',
                          '67915','39164','74386','78761','89212',
                          '89347','64805','77411','64424','76266',
                          '42672','84340','29501','69006','86881',
                          '33676','77930','13654','75112','19710',
                          '96505','74780','49541','49571','59542',
                          '67146','99690','98658','36189','95644',
                          '81813','38151','37984','49564','96963',
                          '83994','55066','79401','22494','58152',
                          '77964','58208','57191','13275','56298',
                          '91382','83793','74585','84902','53809',
                          '13778','33242','58783','52316','11345',
                          '32923','60943','44294','31944','84795',
                          '47757','60308','46587','78100','44055',
                          '61059','28653','81727','15784','92909',
                          '24530','28274','42101','46036','62990',
                          '93699','38569','74405','60914','46698',
                          '25808','89275','10279','93242','20519',
                          '46382','87891','36074','94592','65804',
                          '80553','49154','79115','36853','79563',
                          '86716','98544','37184','60931','45463',
                          '79417','16763','80254','33088','93758',
                          '98464','92676','81697','23527','69425',
                          '70801','36282','46855','31340','98038',
                          '43205','94281','45709','58120','86609',
                          '19787','34369','79082','85377','78486',
                          '41068','30230','40784','12368','96902',
                          '35420','34367','61263','17953','30092',
                          '55192','64681','63553','11534','93263',
                          '98053','83189','76451','94032','39614',
                          '35001','79513','11865','40505','95511',
                          '49061','51464','25523','48886','78362',
                          '35094','71306','42967','88729','77550',
                          '70535','89878','98793','70790','59076',
                          '41628','95118','76936','18898','62141',
                          '79263','63625','11139','81550','25906',
                          '60128','80632','43396','30086','47259',
                          '45757','11083','25487','51003','12561',
                          '39775','31061','49567','39018','81107',
                          '63384','17171','12918','57531','42017',
                          '92086','34253','84755','47904','12255',
                          '90234','99956','99252','80901')
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


