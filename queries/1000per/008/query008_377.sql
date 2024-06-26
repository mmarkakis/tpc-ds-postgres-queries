
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
                          '85610','15078','12442','46744','90445','88040',
                          '52422','84750','96576','73017','24549',
                          '85651','87542','73909','34144','41671',
                          '77692','86335','79334','37062','94391',
                          '26371','21371','89105','79211','84311',
                          '61309','34224','41055','60463','86909',
                          '43790','13316','18763','40120','90292',
                          '60614','38351','81648','74412','41796',
                          '72135','63024','29243','59236','63918',
                          '44508','87076','30708','67436','17507',
                          '15373','90920','15718','97814','53716',
                          '59542','28213','95896','47154','29486',
                          '52594','88590','45373','60654','16529',
                          '24366','27850','75788','43320','76916',
                          '78784','64642','85707','74571','95223',
                          '31279','16083','10090','40439','74634',
                          '33683','34138','76405','19686','30652',
                          '67087','93029','10590','45088','58868',
                          '68770','15316','82216','25652','59269',
                          '56458','42479','10214','45335','99821',
                          '88971','81186','49384','10113','61739',
                          '30857','14724','81656','96901','97122',
                          '82459','49059','97928','93170','69551',
                          '45735','70101','50698','14931','85598',
                          '82099','64595','59005','96420','15985',
                          '34925','42280','40389','51282','72601',
                          '80876','92097','51649','81863','79073',
                          '29121','35860','95546','59276','67587',
                          '42634','95138','61380','72558','84165',
                          '83434','73362','45903','55264','55741',
                          '93135','32400','18169','92813','65770',
                          '73630','44873','75711','72868','56965',
                          '93297','77928','93282','89767','18062',
                          '34679','86047','45187','25762','37055',
                          '81665','25593','11545','52431','18510',
                          '27792','34400','60072','29572','61833',
                          '38089','20033','53657','69413','11759',
                          '31952','37629','88601','75080','65665',
                          '77459','94809','97719','22255','91464',
                          '50754','63027','23870','57566','13833',
                          '77630','39389','26551','56884','88628',
                          '86791','41462','87349','45800','98827',
                          '81576','49977','56475','24574','94625',
                          '72721','58819','63121','49810','98229',
                          '46467','68264','58570','53515','14398',
                          '81136','25117','12280','39419','42506',
                          '16460','30906','20701','45417','66900',
                          '72316','63442','15465','34429','44082',
                          '44150','33980','27388','59796','38476',
                          '32552','71656','60883','27366','34837',
                          '88889','99168','68885','84195','22173',
                          '93780','95361','71592','71467','60663',
                          '12970','94253','53496','83289','72889',
                          '89850','84600','29320','86367','22168',
                          '50112','68032','38131','35215','62972',
                          '48644','33072','56176','89368','58187',
                          '42791','66940','96704','53044','69053',
                          '60935','95512','93080','91023','50875',
                          '27151','78586','92880','22756','53001',
                          '55728','48631','41988','21673','56473',
                          '90670','19160','37048','11162','22009',
                          '96447','99456','32990','92125','16780',
                          '88913','33885','42923','44982','58424',
                          '82703','63261','99997','66526','66267',
                          '23204','79117','12467','11243','24926',
                          '61074','76926','81936','57235','41007',
                          '94147','33902','34162','23145','77081',
                          '16885','73716','71653','96790','19123',
                          '73582','67439','62715','62609','55879',
                          '55881','49184','47605','50819','26213',
                          '96158','23880','89369','89723','72625',
                          '89281','98559','98867','92219','55245',
                          '84907','58143','69870','16855','24136',
                          '66755','90559','36854','34896','63506',
                          '89463','55355','13473','27419','58269',
                          '94163','89513','41148','85495','26099',
                          '28512','47826','10452','81115','93426',
                          '20404','51200','62483','31894','59111',
                          '92829','40265','43772','78886','21765',
                          '68795','95114','30962','26794')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


