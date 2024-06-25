
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
                          '48464','36545','86662','68963','16971','20944',
                          '27226','20485','45632','50596','46184',
                          '63518','16539','42464','39571','66468',
                          '98866','94492','74088','51679','60715',
                          '64289','17079','19370','78435','93686',
                          '68097','11894','50217','55410','14559',
                          '91981','19516','21153','89310','39761',
                          '20891','24532','66071','85522','90300',
                          '45230','88136','18725','45552','36904',
                          '23749','58784','18013','48633','24109',
                          '82559','77053','15902','90580','62550',
                          '81163','12420','55074','58459','28121',
                          '46606','16026','88094','77396','70755',
                          '51651','14348','42333','63585','75510',
                          '67231','49350','92295','30781','75249',
                          '37697','29670','87443','71626','50930',
                          '20267','44578','17258','21566','17877',
                          '57432','57048','91430','64908','35537',
                          '16524','10916','10896','79404','96003',
                          '28177','29448','43726','40559','58772',
                          '60441','43389','15752','85531','48173',
                          '40899','56257','73624','12064','88908',
                          '94642','18547','83677','53290','65455',
                          '91231','77437','34061','64242','19024',
                          '94375','22778','48421','58179','28783',
                          '97046','47664','40814','45977','34324',
                          '62481','58899','45281','99224','55475',
                          '66665','10024','68636','55357','88532',
                          '59863','77521','37405','12928','55804',
                          '67149','89032','75499','83778','66295',
                          '81387','65591','93834','82452','94513',
                          '67251','15118','12743','42354','50786',
                          '42707','50739','46257','92952','78440',
                          '52521','47873','41811','85824','15193',
                          '61194','68600','97692','40157','17685',
                          '88227','57063','30737','14095','38029',
                          '47921','14072','22293','67287','18214',
                          '47181','57705','33346','23226','94011',
                          '23097','11695','51894','80806','67433',
                          '35083','92818','36833','56565','44437',
                          '80863','75843','21754','71947','61533',
                          '54678','18930','24428','82191','57058',
                          '13088','88220','84813','86289','67357',
                          '14560','15543','26595','80275','34968',
                          '51853','41502','11654','93602','85840',
                          '98187','38910','93735','97732','34405',
                          '31493','25919','11853','29490','36240',
                          '54036','18079','79423','62085','24017',
                          '73908','71462','81973','70747','10464',
                          '29951','76709','84955','78145','23529',
                          '64047','89655','89313','42368','66429',
                          '72327','98750','14397','96326','86500',
                          '25922','23915','42271','27830','84421',
                          '17351','50900','91023','50604','38422',
                          '54961','44876','41081','52089','46929',
                          '60167','84442','65198','98940','68536',
                          '13380','74034','70123','80426','35871',
                          '13684','87875','46197','72188','30770',
                          '51959','71978','17687','53409','34963',
                          '93559','87644','36775','72098','94173',
                          '28339','26607','96834','96146','96380',
                          '26446','47926','60413','81664','44904',
                          '33598','30068','65276','82496','41589',
                          '68932','41068','95863','99166','20483',
                          '23978','94226','46743','31841','69297',
                          '88006','62693','56885','81074','13278',
                          '60774','69454','88971','57860','23961',
                          '25593','47237','58911','45465','13067',
                          '52574','88386','87979','65962','90223',
                          '27899','12719','78599','75906','94712',
                          '61609','78197','64989','30941','45418',
                          '35782','79141','51374','12936','79865',
                          '43266','97627','76407','38785','44220',
                          '89614','21074','45981','54006','67776',
                          '82607','85614','16042','95484','60930',
                          '30342','98752','37837','67171','43353',
                          '44694','80517','34208','10545','43394',
                          '25695','30110','88534','39712','25049',
                          '24907','35583','26329','58730','73426',
                          '29885','56364','73454','18089')
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
  and d_qoy = 2 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

