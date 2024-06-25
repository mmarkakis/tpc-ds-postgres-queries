
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
                          '32422','77312','76121','47324','78404','59818',
                          '25669','20828','65175','79628','19408',
                          '16759','26313','94126','28373','66996',
                          '94030','64472','53648','69315','25365',
                          '99677','97075','33921','95574','86432',
                          '22590','62517','84995','11698','15867',
                          '93046','68875','16873','17930','25874',
                          '61361','38750','80270','37817','29897',
                          '13010','96306','66885','68549','98251',
                          '14880','25928','32334','18628','23684',
                          '32586','52713','18197','68359','17185',
                          '27932','17879','80089','32766','20450',
                          '63818','41676','83006','97291','90117',
                          '14831','98029','96260','78245','42314',
                          '68496','66858','63283','60627','32273',
                          '71426','21201','73038','73998','81920',
                          '44521','39021','20085','47808','42909',
                          '17633','17775','27318','30202','46145',
                          '24814','92552','54842','88148','54797',
                          '97826','95233','94894','49500','60369',
                          '63344','94397','34787','41398','86721',
                          '14564','16255','78958','20933','93437',
                          '20238','84572','55434','32877','21985',
                          '31411','52690','92199','28440','77383',
                          '50119','31147','10539','86161','40921',
                          '45873','20296','11020','65673','63347',
                          '84727','26127','26731','42359','67046',
                          '13143','37086','60080','29116','31624',
                          '95296','69857','37828','89587','74235',
                          '59006','91516','88666','93116','81452',
                          '64649','60408','42755','94877','85828',
                          '96199','76337','74331','84999','25792',
                          '62240','12792','88714','49686','64077',
                          '66029','62699','19446','46006','66425',
                          '33143','94016','17703','39926','40366',
                          '97914','55899','62416','94883','58062',
                          '68092','41303','50158','93866','33271',
                          '44001','67679','31900','41870','66633',
                          '27944','23083','30529','80472','48831',
                          '23945','85668','59027','43851','79077',
                          '11758','74664','99141','31712','47288',
                          '46767','71461','38027','76392','70728',
                          '84883','52314','84162','79699','53585',
                          '86573','32125','81179','46761','52554',
                          '70313','57601','49834','18131','64640',
                          '50637','47761','11183','19506','79180',
                          '98041','59356','66794','97061','74471',
                          '61336','55699','55814','60631','30295',
                          '39707','70162','83681','16590','62349',
                          '50110','36254','40341','13866','35191',
                          '64996','83657','61241','92526','80975',
                          '43304','40292','13262','80650','49246',
                          '32054','82382','25697','98450','41826',
                          '91058','13651','76032','24020','21451',
                          '65623','47908','11502','50431','38467',
                          '14889','39653','76089','28716','49428',
                          '73593','93773','26082','98162','85978',
                          '74985','92746','99092','42976','20594',
                          '72271','23915','25553','87946','59665',
                          '99250','24395','32149','45370','66970',
                          '53276','37166','53341','62375','27905',
                          '59228','74692','60693','35199','40939',
                          '88572','43333','26341','25080','69073',
                          '73024','42286','71017','26554','95846',
                          '24083','89328','82357','26727','46532',
                          '72227','90139','58546','95436','14126',
                          '43756','79585','54235','56015','20243',
                          '81802','77574','37292','61601','82501',
                          '16002','58232','11945','41664','50300',
                          '42975','42935','97274','63808','62889',
                          '75482','83904','90232','54708','16857',
                          '18140','72354','37325','77944','66075',
                          '98916','96353','47741','95888','66052',
                          '49598','69912','73304','44843','53353',
                          '78129','64287','41124','43098','58660',
                          '76052','93878','47881','51617','54624',
                          '73364','13557','87799','74847','65462',
                          '85657','98963','55101','33511','66958',
                          '64577','38421','20621','64861','94584',
                          '19704','55786','35947','43729')
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


