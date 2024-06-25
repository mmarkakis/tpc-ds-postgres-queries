
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
                          '59937','56098','93732','50477','91795','65417',
                          '27048','44993','70556','99788','31953',
                          '20277','32338','73301','90448','67167',
                          '71604','92548','97879','62140','38926',
                          '36705','17918','34990','46472','98450',
                          '37530','97677','19829','62576','97938',
                          '23940','39517','27615','71393','55266',
                          '90828','97536','16062','39227','36644',
                          '30880','66429','74026','62071','85128',
                          '67928','75835','55233','71957','50036',
                          '97808','94377','74922','76790','65221',
                          '45265','29282','72181','77264','59848',
                          '15403','13240','79064','42262','64773',
                          '89452','82472','89459','53508','30508',
                          '27141','22796','45860','47048','75133',
                          '82384','25127','73065','86326','51834',
                          '70014','76612','50189','38143','19053',
                          '35934','42398','82862','74248','98848',
                          '15987','57450','91789','51059','32050',
                          '57892','53921','76742','53578','65318',
                          '55398','96377','89228','61743','49573',
                          '84958','96915','36435','31281','84857',
                          '40179','50525','28944','24034','60985',
                          '91032','37874','52965','28258','85246',
                          '63114','42281','76665','51910','70821',
                          '86504','22582','32898','60471','49683',
                          '19128','24230','66271','37411','91723',
                          '86313','90649','27458','55836','37974',
                          '29838','15133','72219','35970','72932',
                          '73139','97768','68218','12761','92841',
                          '64049','88344','41210','81977','51776',
                          '66620','98484','36084','14894','10512',
                          '55708','20839','73606','94969','70199',
                          '73500','25988','22133','49405','17518',
                          '96778','40607','11817','88292','59309',
                          '62812','68713','32955','93192','74279',
                          '11619','94578','18546','53944','53111',
                          '20921','89806','26979','10480','60757',
                          '31601','50062','68717','13988','83102',
                          '98246','68079','95494','24738','17371',
                          '96506','66037','94257','71815','64984',
                          '70568','57783','44230','70529','15965',
                          '25406','42746','54362','37531','91363',
                          '76195','83450','40067','36409','50300',
                          '87255','53878','53161','59874','26017',
                          '58439','20548','82059','91492','41352',
                          '67315','46387','86019','93613','81419',
                          '28223','49075','66883','71293','26236',
                          '28426','82877','20126','62458','51123',
                          '16423','97213','21949','66489','51403',
                          '13136','12833','51089','42991','46311',
                          '56462','19327','70101','51911','94141',
                          '92699','99696','73423','83206','72848',
                          '72268','81133','22850','30395','34861',
                          '92413','69067','31364','87954','93168',
                          '64833','25229','99575','79838','57676',
                          '89732','15590','69848','25889','94684',
                          '61283','10187','18702','82171','27890',
                          '28755','19762','86101','89251','19680',
                          '20207','51748','15435','33679','35615',
                          '82201','50112','28571','30921','39613',
                          '94656','63808','37799','87087','75077',
                          '53721','54634','19612','31385','14049',
                          '50543','19178','61469','12641','58243',
                          '59920','73000','30293','56236','18026',
                          '78676','27702','94310','92668','55100',
                          '20137','84029','56628','14962','89716',
                          '61088','40526','79854','85259','15816',
                          '38335','86841','71241','70532','90433',
                          '30136','92819','64832','32958','10446',
                          '53675','40854','58888','91741','96611',
                          '49366','75302','57220','62002','52319',
                          '75712','47322','10836','80476','56184',
                          '10883','58692','77647','61538','99808',
                          '90404','44629','31733','75043','27938',
                          '99706','54587','46500','80371','41365',
                          '16595','74386','12457','14482','93363',
                          '97612','48437','19189','13957','66513',
                          '50958','40010','25410','23528','38229',
                          '71719','76233','26239','13829')
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


