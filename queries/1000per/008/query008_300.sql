
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
                          '75289','35202','49332','58088','42329','84842',
                          '69690','21374','35451','71778','66349',
                          '79660','26530','86218','83268','12727',
                          '54817','78351','97223','16872','80918',
                          '18704','86029','11410','88095','41974',
                          '73118','46938','98510','82506','33356',
                          '42469','43575','38143','72888','17281',
                          '72347','42302','91567','17262','54317',
                          '99453','19780','49865','29864','15412',
                          '37450','39027','27590','36959','46605',
                          '87997','62412','62217','48904','30155',
                          '53967','35316','61665','44440','64736',
                          '15600','11824','30537','33230','81605',
                          '52367','42884','34513','43935','23422',
                          '73678','31391','96199','50899','24005',
                          '32421','79664','45190','37572','46034',
                          '63339','83947','15932','59311','87875',
                          '94519','92281','80956','63919','92664',
                          '87611','62338','99157','27803','26978',
                          '82828','10069','91322','87883','23893',
                          '61043','65255','43946','40555','31885',
                          '22073','48022','95717','82064','97242',
                          '50220','81720','83437','54840','89518',
                          '91277','56011','13718','50398','19297',
                          '18460','49484','38223','19024','84927',
                          '89587','55479','46091','64395','31480',
                          '93098','97922','72423','51808','14076',
                          '26339','57916','53103','22497','45225',
                          '35872','95439','23615','48411','93539',
                          '17565','51508','44005','64141','81844',
                          '42931','90648','46861','23877','36251',
                          '29265','29819','19505','19631','82504',
                          '88755','26581','67917','87735','56844',
                          '15275','78385','77990','55242','98375',
                          '32394','26314','73226','38929','87995',
                          '34573','98097','22818','12541','14236',
                          '34785','41848','73637','45935','90285',
                          '97601','81573','52723','41394','64868',
                          '71823','53100','55318','60020','82196',
                          '36709','48576','87140','17758','97668',
                          '26285','18205','42991','94481','95107',
                          '50336','58572','41783','67367','16395',
                          '57263','92087','11308','95744','72597',
                          '59474','66246','41285','75665','52166',
                          '58953','53884','54892','71335','18582',
                          '64960','38975','66378','35335','20125',
                          '51989','31867','53165','23162','46929',
                          '90551','44911','55031','12940','79955',
                          '35172','53378','11441','57816','82669',
                          '99932','63540','28254','91905','95318',
                          '28491','83639','33244','17335','83410',
                          '39924','86448','77223','35396','92767',
                          '54976','26997','38953','56924','52070',
                          '44874','14536','49071','74303','67122',
                          '43024','64821','81421','60069','72854',
                          '49512','34531','37057','60204','67920',
                          '32600','54982','30653','18671','46264',
                          '23364','60240','38761','92730','44804',
                          '19904','66816','68532','39029','11352',
                          '11018','53343','81608','49771','89132',
                          '56127','87685','95186','54426','55370',
                          '70858','94752','83137','69982','10598',
                          '77237','90241','23518','47761','68006',
                          '93648','86970','62268','85423','45277',
                          '33736','35537','21637','12317','28624',
                          '24812','20959','57961','65709','39577',
                          '89773','10593','53300','72374','33793',
                          '90741','71539','59608','94326','64066',
                          '31401','47084','15022','43032','26024',
                          '50151','59835','89465','71816','21859',
                          '23509','71643','97380','87175','62292',
                          '26287','46450','31081','39829','93077',
                          '62098','23208','11082','93373','10368',
                          '66535','80515','55811','61288','30299',
                          '51648','41110','93386','59322','19290',
                          '18293','67108','85486','96109','73715',
                          '67988','96422','94260','57109','50554',
                          '92733','37452','41352','20210','54385',
                          '56650','37135','24215','71702','18352',
                          '77628','73224','80276','59626')
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


