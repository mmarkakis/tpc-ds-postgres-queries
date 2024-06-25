
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
                          '87297','56268','27138','92513','25354','94602',
                          '95109','20977','65194','96296','47736',
                          '33462','61747','81623','26082','88790',
                          '93281','11831','10713','72679','49364',
                          '30897','10156','13720','51889','90223',
                          '43420','12172','30074','69088','76880',
                          '54230','96191','93837','53058','43586',
                          '50947','10398','94606','62998','92216',
                          '38217','16738','30374','23972','20646',
                          '97354','92741','26813','59391','17769',
                          '43028','96550','75379','78878','60839',
                          '68129','57806','93748','73667','33147',
                          '51152','45965','67216','27211','54387',
                          '25172','73452','15268','43574','59933',
                          '26911','85500','59783','15260','55736',
                          '44402','15692','49039','27568','45609',
                          '22025','16534','32562','44960','95099',
                          '98230','55906','25192','23639','48075',
                          '79798','82675','97851','91667','38665',
                          '46248','93776','27719','51881','51733',
                          '45201','37929','75192','30147','12731',
                          '50009','48175','85154','80608','34781',
                          '16970','96185','14240','78295','52121',
                          '82572','65051','11601','16155','39134',
                          '92601','69871','11426','75907','45180',
                          '13811','57589','39254','88364','53800',
                          '99246','81125','76118','22232','50457',
                          '77433','96203','46570','85990','34800',
                          '42587','36860','35284','14099','12198',
                          '33640','94320','41165','56546','90625',
                          '42231','96570','88919','61464','40403',
                          '35731','28446','29979','52725','71143',
                          '46174','90556','46007','12966','31765',
                          '99116','12010','30563','43627','65683',
                          '66399','98416','37276','82907','47972',
                          '55085','37678','46112','36128','16905',
                          '87323','92746','55598','51769','80441',
                          '19676','31547','16532','40942','54171',
                          '21602','11120','73173','49599','92258',
                          '34839','34866','82924','73526','55618',
                          '99876','97357','82173','93826','27853',
                          '10900','89981','24901','95227','50257',
                          '46352','91110','47895','11208','80239',
                          '71182','44172','46788','75534','82804',
                          '33027','79390','21436','24874','74297',
                          '73148','10366','89950','12828','84779',
                          '96012','28178','10660','60663','63978',
                          '49346','52573','66770','89510','28843',
                          '93954','82158','94774','76789','62348',
                          '54108','45778','35532','43352','34652',
                          '73485','64915','11629','18679','22306',
                          '32856','92783','90278','71294','71709',
                          '71610','77924','55294','81015','65171',
                          '89473','51386','87285','74695','92043',
                          '78243','84112','17660','55287','48802',
                          '37520','41411','69172','36277','65342',
                          '77730','54714','54246','85434','39358',
                          '36949','99472','57247','86854','14451',
                          '80829','90128','97874','82400','78527',
                          '73831','99112','52035','39194','70665',
                          '59480','29603','33525','57708','45685',
                          '71919','68939','43419','80897','33573',
                          '34863','72909','48561','71247','40784',
                          '50536','21781','87693','61579','39217',
                          '29264','20868','40834','15069','36199',
                          '67936','65083','79909','59019','61668',
                          '42896','49998','90594','36196','84009',
                          '29662','50110','37852','27615','37833',
                          '70328','13906','26497','34846','33440',
                          '23582','25426','53521','69820','89828',
                          '94829','99247','43976','70002','17012',
                          '58508','43491','75738','80164','91574',
                          '27946','90634','54831','20031','65658',
                          '26249','26276','88828','55286','77321',
                          '51627','79359','15441','89644','96019',
                          '58260','75204','43554','77815','67054',
                          '29224','76076','43037','57302','15383',
                          '57533','82038','60542','37018','64971',
                          '99543','36371','83176','17014','53600',
                          '64280','93198','76303','66828')
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

