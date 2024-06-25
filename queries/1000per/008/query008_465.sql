
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
                          '42815','81989','99144','64247','68875','84478',
                          '80581','10182','86294','65022','53295',
                          '42450','37604','87996','49329','72801',
                          '84782','53394','94500','38460','94296',
                          '40237','47796','66380','26470','56698',
                          '90935','55319','34071','23809','23466',
                          '45959','79148','52337','96984','42096',
                          '35322','55847','91584','16924','60866',
                          '88848','46833','62638','66804','55058',
                          '66788','35435','80455','80462','14220',
                          '11700','79777','52194','45096','81499',
                          '19063','66355','18856','17206','30839',
                          '41871','86139','42036','92584','81639',
                          '65552','90601','50259','50959','75578',
                          '72485','82063','21025','97727','61947',
                          '62015','46026','63354','98167','79279',
                          '85509','86077','55601','76517','40997',
                          '93708','72233','37280','46488','34079',
                          '47410','96833','28117','22409','23444',
                          '55342','90135','77614','10094','15253',
                          '92994','70591','16725','93024','52826',
                          '50246','23293','65264','85161','89072',
                          '34091','98360','41481','70355','87124',
                          '88328','14359','18403','31131','54216',
                          '78175','55669','35374','34711','81315',
                          '95014','97406','30135','38165','53092',
                          '87887','90353','16249','54649','98606',
                          '43931','27121','71836','72341','91773',
                          '44430','73694','56973','25882','73234',
                          '26756','43903','93345','93122','93874',
                          '64942','95074','39269','41721','98377',
                          '43575','19931','30942','40743','84642',
                          '22254','58410','76564','77957','43126',
                          '76104','82759','22508','95042','12123',
                          '71593','26823','26846','71300','16122',
                          '46293','31311','48836','65520','56953',
                          '53201','57448','57859','55831','87382',
                          '43232','38956','17837','51463','61117',
                          '95654','36926','91197','86623','99049',
                          '90088','28939','82535','75980','82681',
                          '18252','31896','40614','84394','67771',
                          '47480','72803','71999','73372','58487',
                          '81417','56367','44087','61990','22229',
                          '95805','78394','19297','77419','26758',
                          '59096','56005','85086','53683','78525',
                          '41074','63897','58463','55249','32076',
                          '83429','53323','20405','60861','36018',
                          '80523','55664','63343','70825','18235',
                          '42932','84031','48043','59533','62521',
                          '28188','61550','25343','83959','38059',
                          '92139','89487','24785','76714','70304',
                          '33119','44150','13251','29193','41761',
                          '12353','70123','58661','50070','33913',
                          '76619','66748','62722','29259','85781',
                          '76005','29195','98457','86030','35019',
                          '14843','12474','20557','93946','19016',
                          '56373','27499','86363','39888','83235',
                          '85144','83459','75904','82205','19926',
                          '64006','56452','75534','39248','35589',
                          '55897','43064','33667','89143','89551',
                          '57681','17848','14066','66244','12370',
                          '20742','28207','98926','70439','20631',
                          '44149','30746','79225','66552','90678',
                          '46932','99580','85432','46830','45193',
                          '88673','38154','31263','34192','60698',
                          '42959','95829','85438','92330','60026',
                          '28706','40675','86281','95474','42883',
                          '58919','83666','10151','57427','81666',
                          '61144','47975','24609','10293','65566',
                          '41842','68693','33552','13582','97323',
                          '55563','84524','73300','47428','79302',
                          '87906','78264','71076','16132','95378',
                          '74290','69271','87040','96759','38090',
                          '71174','54468','74700','32200','84196',
                          '79912','27503','92172','37748','38127',
                          '35114','13221','80385','57906','96079',
                          '25873','35073','68128','82268','60831',
                          '22555','16706','21689','66181','85671',
                          '95131','16703','78614','99076','86792',
                          '53645','96151','38205','83654')
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
  and d_qoy = 1 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


