
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
                          '84926','78061','79801','78688','91685','97451',
                          '50998','27759','46061','23821','70223',
                          '56865','77928','17452','69416','74571',
                          '80557','30761','75363','36952','46615',
                          '31798','46582','55491','58515','13419',
                          '28918','47650','66037','58298','95265',
                          '25431','74949','13614','69875','73256',
                          '90430','86639','45416','78708','69717',
                          '23121','33023','32348','48998','52554',
                          '74675','75825','32474','28306','27755',
                          '22587','63031','82681','96039','90092',
                          '30123','44211','18536','93338','76736',
                          '55014','89875','65399','66699','55882',
                          '97360','99228','24672','21778','82898',
                          '65548','26069','21751','97657','87296',
                          '24220','51237','95119','53340','35049',
                          '87218','80103','29670','40543','76896',
                          '63875','81174','79366','85715','46706',
                          '51173','41672','72321','36652','81725',
                          '27298','57629','53150','10036','72215',
                          '60149','80152','87588','25269','96395',
                          '40372','24097','65587','45215','49970',
                          '49246','10371','23506','60209','70117',
                          '87332','54931','67883','20999','97669',
                          '49941','37285','69910','40318','10412',
                          '96196','55795','81318','30187','65503',
                          '52584','79116','42368','63820','23747',
                          '49077','86054','29144','38064','20215',
                          '52147','79803','38162','58937','38097',
                          '33055','87778','52085','61073','33150',
                          '97915','11282','36654','32378','54724',
                          '84751','38417','20654','97698','47486',
                          '73157','31587','48683','70032','36774',
                          '65335','18466','65960','12772','47437',
                          '32656','46424','97073','51863','45726',
                          '90980','59424','20834','74392','40407',
                          '14280','40347','69143','63928','51848',
                          '18516','80144','92054','67902','59201',
                          '37522','31161','79177','88266','34021',
                          '87993','68144','19055','87974','34130',
                          '46956','88915','45789','25097','98182',
                          '44621','91552','47983','82778','79643',
                          '51056','99528','69765','62857','80314',
                          '23815','11408','48476','72323','15495',
                          '53015','46593','32479','89926','83637',
                          '27981','34407','83456','40884','37084',
                          '89691','23285','97128','34202','56395',
                          '51462','90504','80277','28946','36799',
                          '31113','60718','37405','27744','64586',
                          '97683','96947','24321','67339','39803',
                          '84117','59081','32872','57231','89800',
                          '79868','48223','29141','71264','79956',
                          '50449','31764','43920','37871','41864',
                          '38284','63104','42857','25262','56511',
                          '81148','82703','43268','12114','97507',
                          '24809','28724','44559','51499','42455',
                          '93008','57701','96331','70224','91085',
                          '67074','76320','67216','48435','46461',
                          '13734','73911','64661','69714','93518',
                          '76299','70741','52241','21783','76938',
                          '55141','10750','77477','57548','65512',
                          '67082','36847','92089','63600','35838',
                          '77284','96775','58083','56623','54012',
                          '59404','22981','90022','97826','90136',
                          '77895','43375','57174','48970','97697',
                          '93588','79585','71616','65202','72645',
                          '46252','67385','31096','46891','51052',
                          '69507','75294','84846','32664','84304',
                          '94874','14845','53307','13219','72348',
                          '82502','15842','73328','83568','86985',
                          '47360','69632','94772','60535','45478',
                          '18967','78188','80199','24063','80278',
                          '31938','84044','51580','98496','94323',
                          '26854','14654','56407','76941','13005',
                          '69504','77687','15527','99844','33220',
                          '65771','48960','19513','13701','20154',
                          '15217','46995','79931','11191','74708',
                          '53613','38856','87428','52223','41123',
                          '45948','69821','14542','63750','30379',
                          '59564','48511','67996','33630')
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


