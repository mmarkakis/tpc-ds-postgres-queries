
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
                          '45604','88692','15383','13505','21161','20771',
                          '83687','78237','46554','27787','65027',
                          '70490','47474','45835','46812','11160',
                          '29329','84695','42130','54403','56813',
                          '30498','25771','66195','81202','20526',
                          '55525','14147','51135','99984','91100',
                          '64586','36598','12983','20155','76827',
                          '79510','23590','96061','50774','17689',
                          '97218','98999','50638','93809','64246',
                          '81903','41532','51339','34830','65438',
                          '78302','12564','85324','36199','31491',
                          '80721','66793','60190','97398','38917',
                          '49523','23406','86411','16420','59480',
                          '98613','20299','55350','90167','89089',
                          '91190','91773','59068','48897','37726',
                          '37463','20667','88966','69633','76784',
                          '55153','54140','39009','89486','90170',
                          '32278','38270','72076','51909','83791',
                          '24835','73358','78292','37084','42207',
                          '94730','37970','36076','62902','32204',
                          '54704','72057','84028','15131','65175',
                          '71803','85053','62631','19928','72802',
                          '91916','72555','23625','61152','64900',
                          '46622','95888','74971','88933','31632',
                          '57446','85455','47065','68890','63054',
                          '92100','99129','59558','59853','31677',
                          '71645','80589','43082','54637','60767',
                          '65957','73151','58873','56183','15490',
                          '59017','54803','80605','29643','51548',
                          '73968','92504','13903','38235','11503',
                          '86772','15275','88242','76288','26672',
                          '67161','51047','41264','60607','64886',
                          '88150','97884','76462','11114','76102',
                          '72612','43547','48443','37351','75948',
                          '19424','88294','15577','50004','36227',
                          '75151','46979','70469','95012','67380',
                          '78468','89770','51837','47654','74628',
                          '95988','14872','68652','78727','27221',
                          '60119','57766','11267','80380','54655',
                          '14286','35950','80256','21186','18720',
                          '37333','68215','90738','28887','46789',
                          '65539','73947','87658','96823','30045',
                          '38943','74260','15869','22013','25333',
                          '87893','49939','27739','87766','97843',
                          '53168','97061','64612','25896','82192',
                          '20238','72348','65000','64372','62101',
                          '75727','79202','10126','10846','46001',
                          '38814','26186','81549','61669','96580',
                          '44596','23513','34695','52651','26031',
                          '21224','87572','67497','30937','84960',
                          '27001','23994','50940','64016','11859',
                          '74569','97401','91181','15353','78700',
                          '28382','69873','66264','45496','49230',
                          '33030','14058','55077','98387','39787',
                          '76687','77250','67701','90093','42711',
                          '40958','99194','11907','44135','85019',
                          '81507','38019','72411','51671','55012',
                          '50816','19961','16061','35690','42155',
                          '80800','98453','34218','30986','72742',
                          '90958','45741','86680','95092','39428',
                          '58276','92596','22981','20296','97619',
                          '31853','80471','85766','12703','20023',
                          '50319','94449','75565','94515','14566',
                          '29096','46343','82639','18555','42169',
                          '37292','79883','99909','72106','54311',
                          '34272','68416','60974','45989','72184',
                          '63957','65234','63025','46790','45561',
                          '27604','22732','68322','83702','41515',
                          '60219','98296','59640','14108','64582',
                          '28716','78135','67257','71468','98009',
                          '20703','48191','38000','72717','35886',
                          '77135','51212','52025','45643','35101',
                          '26780','52744','86546','83771','77297',
                          '82974','28677','69280','72879','51677',
                          '13577','41309','10167','34560','92765',
                          '33507','82647','88609','55909','84392',
                          '44590','14270','89949','14449','61524',
                          '80400','88301','42733','71448','85915',
                          '67308','67747','96821','97385','19793',
                          '85763','97118','98847','62418')
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

