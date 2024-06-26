
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
                          '85185','80275','79735','43046','88962','54348',
                          '93956','87225','52882','15310','15249',
                          '95292','86469','89056','49893','25499',
                          '34525','85436','81729','44506','19014',
                          '28520','40969','54406','91170','95382',
                          '17329','72263','97697','20536','66328',
                          '25557','28733','12297','52007','97405',
                          '17709','45775','74508','99820','93068',
                          '59150','92314','22317','88004','41387',
                          '14286','70170','79686','58172','14314',
                          '79925','38328','89482','74055','45024',
                          '43765','49245','92662','58446','84844',
                          '53829','88941','46125','38632','12977',
                          '74903','13090','68459','16254','12938',
                          '50920','39780','53387','69041','44091',
                          '16717','58270','57684','12689','44625',
                          '43866','63146','79759','95071','71258',
                          '34163','98414','75938','52001','85866',
                          '32549','79035','11052','85874','73570',
                          '39930','31870','15277','68179','42964',
                          '37524','62176','74613','10913','56314',
                          '74661','93903','78279','84212','10170',
                          '47857','44016','43192','65525','21453',
                          '70480','13236','92076','69885','57227',
                          '36023','90453','17769','71905','65409',
                          '27386','12531','42123','68955','33594',
                          '33032','56416','48030','50585','38111',
                          '90186','74175','12483','25984','18968',
                          '27008','86033','69263','10036','23509',
                          '23585','18719','78433','65102','78615',
                          '61449','88002','10564','37730','95125',
                          '23549','74950','82471','69915','26857',
                          '59119','68824','16889','97411','71529',
                          '53613','41062','60898','63670','85777',
                          '48211','42812','81919','94003','73096',
                          '71009','44129','80133','48940','13780',
                          '60900','19161','25037','50851','28142',
                          '44971','70991','27835','33667','20883',
                          '26781','16561','50683','36816','85719',
                          '87568','72415','14372','91555','10597',
                          '57847','43252','11283','56652','63059',
                          '97925','78507','96547','67805','30031',
                          '35176','10457','39622','82820','47750',
                          '67513','54141','77769','10967','81190',
                          '54015','31945','74169','11998','20458',
                          '76211','88553','41761','64040','25621',
                          '76216','45593','34250','78680','84185',
                          '16227','70750','92564','27649','38274',
                          '89137','59385','74408','49680','84563',
                          '83926','51697','26991','28576','68126',
                          '15762','16159','75106','15341','58871',
                          '11158','93405','90351','98279','75235',
                          '67788','46082','70487','29172','41083',
                          '71664','16873','26668','87374','39658',
                          '60109','11143','12253','44222','70150',
                          '53265','91191','45871','22015','37937',
                          '86606','66447','42834','67260','86222',
                          '21605','38442','50079','70194','81611',
                          '83695','31517','42543','69053','53997',
                          '20488','35071','36111','28291','64543',
                          '65129','44395','93933','20160','71505',
                          '37575','62159','68212','91405','24090',
                          '51343','94444','31946','41404','57525',
                          '94151','68121','10805','83438','33226',
                          '70087','40772','12738','99145','43778',
                          '71866','84107','79622','66174','98244',
                          '54514','48553','63814','93463','63097',
                          '27496','96619','97412','60495','81075',
                          '60552','89467','92253','33917','60528',
                          '44294','52983','28713','31092','82169',
                          '44326','56001','68973','39880','16433',
                          '99978','23349','67917','26701','88960',
                          '86887','66200','66053','16683','63909',
                          '29820','89202','75295','65056','48409',
                          '69256','31631','37174','77628','72452',
                          '35212','60910','49076','52752','55031',
                          '65437','78910','60955','18981','62234',
                          '89373','88074','15961','71655','65662',
                          '10288','14529','96203','52299','21085',
                          '78278','47046','41535','80533')
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


