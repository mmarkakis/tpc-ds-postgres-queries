
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
                          '81622','24461','92339','20755','20902','84322',
                          '55673','88153','15043','82444','74035',
                          '97748','21116','77595','39609','76909',
                          '62047','98954','91093','48677','31397',
                          '19379','68576','57172','21174','14474',
                          '78066','12499','20317','98862','84530',
                          '16767','44410','15674','25075','67646',
                          '44023','99103','27481','25725','90171',
                          '68983','17410','18896','42660','48647',
                          '55013','70740','76539','21060','66910',
                          '77426','25773','87320','41892','33932',
                          '61254','54071','27617','38567','84045',
                          '46193','65724','57753','19540','78506',
                          '45799','75981','68328','69665','90333',
                          '83794','21339','94596','51688','82511',
                          '35962','14418','36755','23508','24106',
                          '44818','92809','79466','41597','17513',
                          '97735','94279','49590','51706','85631',
                          '86953','10316','75929','18358','12540',
                          '58149','56777','12607','92086','61763',
                          '30071','50515','44582','64275','49953',
                          '52873','55950','78623','50111','77225',
                          '27751','31038','71109','53312','98956',
                          '51985','37691','41891','32653','13219',
                          '67923','52025','69398','41025','16046',
                          '69539','99636','64680','20584','63236',
                          '21663','40629','79383','36532','26171',
                          '38543','55818','69563','25597','57908',
                          '66044','98726','58530','47839','38946',
                          '31239','62539','22230','28836','33229',
                          '89030','50331','29618','55687','83393',
                          '84091','10895','39165','50251','63769',
                          '34557','83297','17464','93873','86843',
                          '34766','87973','86386','48782','48284',
                          '76336','95369','10560','74551','39195',
                          '97291','64546','55582','18047','31600',
                          '54469','48047','24593','13874','69981',
                          '75494','69500','49952','70212','23098',
                          '38545','61727','86138','91164','56232',
                          '11600','92892','94844','89952','23065',
                          '52090','51670','55351','87953','93634',
                          '37468','76466','90695','71016','44534',
                          '65947','15829','28863','23894','57897',
                          '34375','24657','17341','55825','19736',
                          '64709','81598','26140','68001','50361',
                          '20672','56870','75764','25846','60325',
                          '68371','86940','53172','25991','73540',
                          '67027','88409','55029','38368','57078',
                          '74852','17063','26664','52819','90182',
                          '10576','85044','79067','90973','23532',
                          '61864','42678','66299','91543','75138',
                          '86549','75954','48649','59463','11608',
                          '16413','55316','23591','95217','98516',
                          '38876','51222','17268','61128','63383',
                          '44210','77346','58740','56065','36796',
                          '53747','76806','93092','39270','61384',
                          '16949','75417','71436','78014','24330',
                          '35895','68812','80830','47176','84595',
                          '53555','40380','64623','86087','87534',
                          '85919','35474','56774','99411','71777',
                          '67963','97172','46932','97794','10144',
                          '61464','58300','69851','58798','64457',
                          '39747','79559','21395','14657','33979',
                          '11987','64594','95044','44900','38572',
                          '90771','29066','70503','18634','74746',
                          '10872','73223','82290','68458','39724',
                          '90122','41877','35524','97718','91776',
                          '25081','60250','95739','95481','34455',
                          '67670','18332','81139','84902','28372',
                          '15283','31656','74111','53550','31821',
                          '45698','51677','84763','64027','10958',
                          '10056','94339','42357','29605','18277',
                          '59754','89809','10980','30990','48932',
                          '48371','31463','54095','83386','64162',
                          '81322','21955','36425','80245','65158',
                          '30485','73031','82771','66119','93002',
                          '10411','90423','30701','62759','55660',
                          '96511','43741','36536','57234','92707',
                          '12724','15030','33707','68052','77639',
                          '25809','81534','15231','60571')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

