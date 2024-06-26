
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
                          '13808','51149','81488','30624','13094','31612',
                          '78309','56562','52638','55538','10243',
                          '26250','80547','62460','91083','11150',
                          '13735','79610','43589','26662','94216',
                          '68285','21105','89864','59778','96789',
                          '79338','88031','25176','10147','95809',
                          '27877','29623','31575','93501','21675',
                          '51479','77047','44141','96548','65316',
                          '81962','14100','61122','28491','46936',
                          '38019','78175','21381','41653','21528',
                          '89277','35151','13584','93660','58278',
                          '20513','36234','72084','17468','29527',
                          '50567','24068','68078','11611','67150',
                          '54284','52560','92213','25806','16641',
                          '33677','10839','57193','99541','19322',
                          '11777','15340','69713','48034','81300',
                          '38047','45658','30664','95631','96502',
                          '36512','59376','51154','68335','75795',
                          '29388','89242','35248','79412','41581',
                          '76375','57879','30630','67497','63129',
                          '25704','34135','96294','11312','54652',
                          '15232','27107','93062','25323','79673',
                          '82957','51290','64114','55767','60001',
                          '22969','74145','23893','26808','94040',
                          '20812','55437','95767','17585','40749',
                          '90399','89533','90349','61107','23674',
                          '88217','40328','30231','28268','35022',
                          '85830','98495','18691','19362','14644',
                          '34055','71752','52529','21833','69787',
                          '40942','65433','83893','13690','27949',
                          '95181','94318','49741','81316','14791',
                          '31834','14694','66525','48298','38664',
                          '70291','67017','65392','33999','82083',
                          '86166','88243','38382','78301','28206',
                          '97484','78393','19229','69147','26965',
                          '29042','69624','74517','19044','94049',
                          '44909','95292','51736','10589','96754',
                          '64514','37229','53921','82772','16976',
                          '74662','49448','31867','35181','49377',
                          '28636','12598','58454','46377','60771',
                          '89196','75212','59865','12123','70110',
                          '53968','28064','74862','38849','86311',
                          '13571','26877','12194','92176','79320',
                          '80440','97105','22930','25211','72217',
                          '87353','37348','72182','97364','95125',
                          '19981','15610','63024','16978','76763',
                          '58560','28690','31168','83610','49519',
                          '83506','43398','69319','28486','90346',
                          '32723','76110','31097','10872','46269',
                          '34291','77181','53278','94615','17348',
                          '88086','29821','99072','47415','15293',
                          '59456','84248','87918','84803','52174',
                          '47285','79002','51323','60835','21063',
                          '37511','44975','11703','40668','56427',
                          '79843','62433','68949','18519','67105',
                          '89897','45238','15247','28117','35373',
                          '72368','28904','57872','27046','32342',
                          '93735','63220','32528','93050','17443',
                          '68608','78892','95607','16599','76080',
                          '25057','91416','20255','81081','45634',
                          '23781','12477','19700','91082','89878',
                          '23122','16461','40572','31359','12948',
                          '19605','17731','17344','68425','64563',
                          '92902','77880','30443','75167','42225',
                          '66518','95581','34538','95303','23300',
                          '73899','60964','37052','63690','81874',
                          '54618','84872','20274','33579','91104',
                          '82666','72376','91134','64023','76598',
                          '40611','78886','11461','29058','74643',
                          '82556','61980','29676','82763','44400',
                          '68217','78677','30032','98386','62489',
                          '11294','69710','62445','43695','90929',
                          '41275','71692','77684','60745','19376',
                          '16982','80704','89857','97368','56858',
                          '41693','21390','33183','51224','22950',
                          '62632','40186','60319','95997','11627',
                          '12854','46844','17313','32335','63208',
                          '15118','85574','79618','18158','51147',
                          '17429','28750','88465','55386','98772',
                          '22406','30977','57946','65544')
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


