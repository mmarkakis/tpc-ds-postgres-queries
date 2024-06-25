
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
                          '13527','40378','93525','85504','24130','51274',
                          '80068','87637','66049','64662','13471',
                          '28730','34293','35852','45946','12730',
                          '10075','73986','80737','13120','63562',
                          '50800','75149','63313','63214','89726',
                          '23072','62024','78960','56482','27547',
                          '83324','46065','52617','28456','13895',
                          '17105','83043','62867','58174','77447',
                          '74861','17021','28489','36649','67089',
                          '19099','94349','88527','22718','88062',
                          '74727','21475','18237','10542','70455',
                          '37929','16679','15579','16683','43038',
                          '78240','72165','26552','34985','39305',
                          '42842','31518','32825','48707','16556',
                          '11831','84993','26435','98398','67800',
                          '97335','28721','78923','70735','27742',
                          '78364','97642','96873','53394','91480',
                          '14648','12584','78755','23078','91801',
                          '60120','59374','54422','59545','61483',
                          '37284','37570','26949','75943','26647',
                          '88013','36221','16825','83152','92386',
                          '17681','75386','99028','62675','70522',
                          '39581','41909','48267','96857','65194',
                          '20072','96505','86539','26234','48588',
                          '48085','47516','92282','34112','43099',
                          '63178','75808','26051','69984','45991',
                          '33312','48657','35458','44446','91665',
                          '87434','87616','11129','36474','21731',
                          '20546','93223','86482','93183','67754',
                          '22569','43005','88879','75422','62992',
                          '47045','31802','97152','87500','26903',
                          '63008','30232','18003','27143','45667',
                          '47063','78025','35950','40860','81070',
                          '74202','55387','52189','34383','29882',
                          '95943','68119','51380','54380','76713',
                          '86811','76811','28098','12015','51734',
                          '31335','33807','44465','57994','25604',
                          '32767','58578','29207','57503','38571',
                          '64234','94439','59344','79850','44702',
                          '54048','24036','67664','63733','67557',
                          '71951','58594','87775','14427','27907',
                          '72999','34853','27796','43655','63392',
                          '90218','16370','42517','71633','31456',
                          '56473','65145','51295','40412','68169',
                          '23292','22368','87230','47351','42428',
                          '88540','16186','49599','34279','62137',
                          '27990','40714','63884','71343','56743',
                          '85391','36409','35891','58777','74555',
                          '87483','46169','60748','39499','87132',
                          '96488','69319','82383','67281','44930',
                          '80376','69075','91713','20205','74080',
                          '12122','96238','35352','95747','31430',
                          '14618','78664','64925','69141','70955',
                          '16594','85173','43378','73604','69066',
                          '45141','96995','39108','72997','15975',
                          '31411','68197','99411','88484','78580',
                          '68058','15475','54134','22745','38709',
                          '30810','43658','17857','58508','39208',
                          '29005','24183','89847','88606','43675',
                          '16548','85956','11460','75641','38753',
                          '37940','15365','31978','92158','50384',
                          '36464','92686','12337','85524','88642',
                          '68417','17656','72367','54305','81242',
                          '17090','95531','17804','66530','16578',
                          '95767','86921','63934','56493','22026',
                          '39274','66793','64341','32738','61217',
                          '45507','93554','57077','37925','33383',
                          '52900','21701','59190','73971','88573',
                          '38429','19652','88486','36562','23155',
                          '87743','59152','65042','29937','85997',
                          '22298','61060','24090','98860','89562',
                          '85914','74803','57199','62609','16748',
                          '10147','27125','93320','54244','88454',
                          '48334','23536','20634','46398','59616',
                          '41946','93107','26656','66211','45149',
                          '53462','89402','79181','57468','24111',
                          '81045','91887','37545','27379','74255',
                          '72258','48937','82917','19702','68644',
                          '69368','56463','62576','31885','44514',
                          '37780','50684','64326','42249')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


