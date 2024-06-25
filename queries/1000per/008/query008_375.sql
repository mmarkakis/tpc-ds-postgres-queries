
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
                          '26841','83404','53151','77667','55769','56507',
                          '66404','27951','94408','38868','37045',
                          '20861','26655','18200','12922','97204',
                          '44653','96127','66243','68740','91439',
                          '88061','29093','62509','21821','33890',
                          '24411','70998','45160','53180','51059',
                          '44181','77834','69102','86034','92854',
                          '30395','39119','66776','43500','94431',
                          '16961','17331','20465','53454','65383',
                          '83630','12878','64638','42890','82685',
                          '87288','91837','98437','80264','24110',
                          '52124','70841','23543','89659','54299',
                          '37542','12088','39864','15009','59228',
                          '88614','22323','26537','79958','80602',
                          '91962','79582','31238','44365','72308',
                          '64144','87174','24326','56852','24395',
                          '33212','47917','66907','81697','61696',
                          '11573','41963','65760','56374','85700',
                          '54320','42877','46404','54438','33250',
                          '21849','50923','48290','79187','19742',
                          '28844','95079','23660','96036','63448',
                          '47272','34503','25024','72084','44806',
                          '41691','10863','84597','56642','20192',
                          '43988','73673','89272','14398','42469',
                          '14574','89683','73906','75625','12464',
                          '17578','15948','28381','74290','14349',
                          '85216','80275','51479','50576','67068',
                          '92255','31107','93042','93726','93327',
                          '68970','58061','11417','29476','20255',
                          '51699','22013','74537','74286','80384',
                          '33500','16896','82805','64485','82406',
                          '33652','73806','85611','59343','76490',
                          '63247','76925','21739','65477','40852',
                          '31779','53777','60405','16349','58647',
                          '51940','11150','66942','78426','88232',
                          '84229','33506','27208','52743','87990',
                          '91577','83307','33162','63176','85089',
                          '69036','97336','70247','10655','13971',
                          '88264','91457','24458','74914','34200',
                          '64125','16985','76643','98806','36049',
                          '52074','88771','22885','97060','82838',
                          '11153','84504','52840','16221','80530',
                          '11201','23368','55802','24001','58510',
                          '72067','15931','42831','94031','23218',
                          '97463','75090','93776','38502','93052',
                          '95646','60416','61507','36436','66068',
                          '83563','25861','90354','46262','85337',
                          '86013','90955','76901','74371','33422',
                          '89571','67561','55429','20674','25520',
                          '21218','27621','86323','74176','43568',
                          '45899','28760','10877','73619','39335',
                          '57345','89616','28815','66117','53293',
                          '73645','34996','77985','53206','18177',
                          '83527','36751','33009','45706','79511',
                          '63712','57203','46283','64403','10790',
                          '30620','69981','50724','29928','93230',
                          '71962','25466','81017','65581','93209',
                          '52011','47583','91522','30902','27863',
                          '59020','78381','24485','62347','65032',
                          '92703','46148','48786','75140','53659',
                          '87187','20063','75984','11149','63365',
                          '20586','10006','40448','36417','39356',
                          '95257','25849','71888','94780','23299',
                          '25302','54199','21592','81399','86631',
                          '95932','71179','48512','26606','24817',
                          '99615','29026','60351','11076','34322',
                          '45542','27443','90186','27898','43734',
                          '97293','70322','13023','68355','60871',
                          '30941','41537','26118','40098','64808',
                          '61148','79138','29029','29265','55279',
                          '21514','46856','76954','10529','58433',
                          '49928','92726','26492','30430','67644',
                          '15963','59815','14818','53086','68447',
                          '69189','85528','84523','10973','77581',
                          '66144','55874','23441','62518','89200',
                          '28002','15005','83463','56687','46264',
                          '20138','68888','77963','71911','61183',
                          '81277','19236','84456','22988','85787',
                          '71474','42593','94327','91787','26584',
                          '76820','50385','69583','26652')
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

