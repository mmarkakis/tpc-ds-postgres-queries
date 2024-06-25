
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
                          '98923','52085','11975','60170','58747','46931',
                          '49890','26712','44761','54526','11941',
                          '93989','26879','45927','67318','28857',
                          '77527','37192','52009','88411','91117',
                          '96567','31700','41661','26643','29830',
                          '47114','99546','66987','39152','54991',
                          '61427','39872','41111','78063','39681',
                          '65119','32591','56894','24216','23508',
                          '55062','90453','56476','79406','54868',
                          '39361','87194','34445','38005','45923',
                          '17947','92224','73476','36927','64002',
                          '86297','48585','20884','26099','12666',
                          '90436','27180','85151','59431','12159',
                          '70381','76188','64923','57214','58813',
                          '19181','56289','42695','11223','53942',
                          '42138','63792','85958','26525','25077',
                          '25907','22008','25501','75487','59990',
                          '18952','34860','82831','47976','36646',
                          '21769','51801','98103','12044','63005',
                          '86710','96020','98490','85878','40203',
                          '47970','13510','89531','40441','76794',
                          '53739','46840','47658','34567','57882',
                          '43140','48136','31826','53076','32045',
                          '19639','70562','65958','65350','79017',
                          '91897','64781','42494','35803','19786',
                          '84837','89000','11154','98110','90499',
                          '78447','20092','15552','35787','40573',
                          '92534','75185','88488','62179','33508',
                          '12766','32996','78139','28730','15327',
                          '84931','67376','10036','71108','41962',
                          '18628','64052','79861','24173','78062',
                          '22273','18789','50339','59861','70891',
                          '50468','80833','32910','18888','81101',
                          '26673','20418','79774','57520','99795',
                          '55219','63891','99793','69838','70600',
                          '96545','39389','42742','50584','10890',
                          '25747','14436','49085','96645','67463',
                          '52838','20392','31703','69284','15559',
                          '41551','30808','38014','66076','35248',
                          '73667','77024','55864','80251','77081',
                          '46042','23453','99346','19205','22584',
                          '18818','70283','14401','97681','42821',
                          '98910','96959','71612','38114','17345',
                          '23683','46756','24465','79202','19043',
                          '71638','45103','52800','24833','40302',
                          '46730','73535','89912','87442','16275',
                          '26806','33439','33873','32620','94989',
                          '30563','45275','98612','71330','84579',
                          '21534','67735','41408','59264','52623',
                          '70764','37924','90711','32464','90041',
                          '18254','64999','46748','14970','13337',
                          '71588','10419','87649','12868','99567',
                          '31419','94935','52607','59511','84615',
                          '39787','17878','32100','70052','98452',
                          '35143','67284','79318','49953','77053',
                          '66421','55523','42023','53395','53100',
                          '49341','89106','17713','87368','41224',
                          '39720','39336','81775','68599','59024',
                          '93482','80057','98155','35018','48144',
                          '16692','37691','78400','36286','31600',
                          '99905','64390','19179','83921','75937',
                          '11554','99924','56065','60341','98185',
                          '51079','55925','13794','99906','72700',
                          '97883','97548','32143','82884','25239',
                          '52631','99115','73327','35406','99228',
                          '70365','35526','64075','22484','28760',
                          '42680','69769','88092','73153','16768',
                          '92509','25479','18426','29081','19932',
                          '98158','11185','67448','96249','48514',
                          '98760','99205','20813','72929','96554',
                          '23680','14586','59339','97414','89718',
                          '47110','98454','98016','40112','38700',
                          '54591','86008','84628','84351','46599',
                          '56882','37975','53892','21710','93287',
                          '22477','40634','43805','72346','96843',
                          '99000','91452','43134','68979','72925',
                          '83270','83602','15179','64532','18026',
                          '49979','63385','15250','20391','45179',
                          '99458','58468','52514','70849','91731',
                          '20113','95034','90198','36261')
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
  and d_qoy = 2 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


