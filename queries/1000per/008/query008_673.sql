
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
                          '88564','12359','87733','78191','40434','88479',
                          '90528','24951','50592','81921','26961',
                          '93889','75420','45359','49618','59325',
                          '52832','28395','55128','11913','87683',
                          '61013','41807','24010','12849','45954',
                          '92469','67665','42952','96834','11087',
                          '28919','74154','72487','84284','14192',
                          '42957','67517','43293','45974','81859',
                          '68522','94342','38607','41484','79900',
                          '81977','71464','36804','35106','97593',
                          '58743','13969','96236','70724','75368',
                          '38450','70232','18454','77541','73896',
                          '14459','91746','97075','97881','35713',
                          '92470','43344','34568','65952','71328',
                          '35428','36882','30819','94829','62575',
                          '63548','91697','55156','35465','43086',
                          '84364','47274','91405','85417','23328',
                          '15410','40510','52730','34843','20164',
                          '53663','66656','34943','53493','26530',
                          '23240','87510','33296','85145','44156',
                          '24677','77618','46411','40294','32290',
                          '12791','56773','22001','98507','14938',
                          '38035','41340','49360','82330','31983',
                          '40913','61646','63601','80037','65364',
                          '81516','90057','53927','55173','26657',
                          '51460','97122','47514','19109','45301',
                          '84236','41130','99960','30066','67066',
                          '31000','43316','19130','94565','92250',
                          '81606','23981','78087','37782','78878',
                          '36623','61585','24808','10819','50598',
                          '98673','69186','11839','52744','34198',
                          '69322','63477','76612','95683','63113',
                          '85333','38690','75696','12404','93928',
                          '75984','52159','21269','29212','32721',
                          '24495','48027','76210','24782','88537',
                          '44047','30888','52478','46789','57353',
                          '21448','32432','39207','97716','40910',
                          '37056','23846','75021','92960','18913',
                          '31894','47318','20613','28295','13922',
                          '28326','12392','80709','28669','79173',
                          '12232','58649','31744','42987','23383',
                          '90479','84822','86671','24857','53857',
                          '91313','95678','77668','92140','28252',
                          '32941','86027','57637','27960','88552',
                          '54521','39502','47430','97942','51856',
                          '87658','74078','95816','87209','92486',
                          '23945','59496','68187','52683','43565',
                          '78295','64377','45802','68593','80909',
                          '13385','17756','70139','87676','35662',
                          '52169','48143','56184','74274','76465',
                          '56135','55374','80009','97430','35169',
                          '91572','20227','73491','49254','66545',
                          '15917','79619','51393','59034','96884',
                          '65403','54017','93697','15136','88869',
                          '54184','25278','57709','48966','92948',
                          '24682','33522','94110','54280','88409',
                          '10269','69639','55249','99357','45997',
                          '21209','43934','55779','68412','43044',
                          '46450','17710','43636','35931','73673',
                          '10413','58060','57946','34581','32881',
                          '32625','95631','47882','26786','49383',
                          '61183','64175','76900','32624','35860',
                          '55709','76382','70939','65495','31228',
                          '70905','20168','77882','33067','58526',
                          '37561','96028','55602','12913','39655',
                          '40391','96132','14872','21442','33212',
                          '89073','61495','17606','83688','98384',
                          '96006','24116','56945','51629','93548',
                          '34572','56138','65805','54300','17162',
                          '30792','89891','97615','19358','31099',
                          '84648','15521','87027','51484','65321',
                          '65608','64607','72814','53818','55591',
                          '49328','39820','31171','67044','68094',
                          '95345','47006','92495','60784','46993',
                          '55443','78381','21676','79572','31703',
                          '88994','97732','16377','40336','96869',
                          '69429','38378','75788','73645','42526',
                          '20198','30324','20080','92575','43835',
                          '14162','54751','70187','47340','67717',
                          '12284','57762','22010','13700')
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

