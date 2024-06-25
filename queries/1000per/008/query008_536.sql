
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
                          '36673','36994','43009','84146','68830','65047',
                          '81369','42310','80960','69052','15426',
                          '15751','96171','66387','51286','41641',
                          '57986','68981','82828','80474','14610',
                          '47016','20172','29722','64826','27327',
                          '61457','17682','40618','31273','77575',
                          '78881','72259','79177','96416','40458',
                          '16152','11087','46234','99465','86962',
                          '51223','36843','87027','99962','57688',
                          '71325','40691','73376','96389','35259',
                          '23392','45448','64588','55219','41404',
                          '69317','62621','41542','24173','41379',
                          '58702','35119','74762','68042','59644',
                          '41016','59084','45893','45193','29201',
                          '49743','42410','81416','19312','35622',
                          '11763','23834','31291','47265','71085',
                          '62887','48687','33144','47539','68968',
                          '66015','90238','50058','42204','35263',
                          '21637','38771','32105','86920','62765',
                          '84364','67350','43321','26526','32195',
                          '18841','89019','64484','48669','67999',
                          '65405','18071','32843','54008','26596',
                          '97842','21647','61378','40659','86982',
                          '69594','59478','36581','68037','68969',
                          '76893','31941','97784','26047','70908',
                          '12424','43527','42186','38226','25904',
                          '50641','78517','77392','65558','92202',
                          '41321','54427','67287','35174','31915',
                          '53424','49823','73045','18521','22779',
                          '95007','11321','21371','49738','39049',
                          '30921','22652','38657','38941','74656',
                          '69739','94369','41416','15407','16756',
                          '76236','48804','45997','58134','72893',
                          '49986','75169','86475','60805','78953',
                          '14360','29486','97350','99029','80716',
                          '93734','24573','85818','86621','76677',
                          '93122','80930','72089','96805','33905',
                          '12661','50809','71772','37917','10958',
                          '47868','39155','62691','27952','72637',
                          '70897','18340','26828','73812','62426',
                          '45489','62858','76187','34516','93346',
                          '34815','42565','26594','38330','71102',
                          '54779','80086','20059','50815','20550',
                          '63758','36281','11864','63034','24300',
                          '15976','79644','37129','66395','29223',
                          '27888','17998','78319','68337','14549',
                          '13812','52207','16716','72311','16959',
                          '53362','99861','77368','25330','17365',
                          '29816','58077','96015','26488','51503',
                          '42631','26098','43297','58358','92591',
                          '90387','65032','37101','61800','98558',
                          '38847','94954','56025','90228','73773',
                          '59370','29613','29916','58652','44414',
                          '56459','37839','78065','89245','80986',
                          '37690','91274','56267','87716','57506',
                          '16615','15350','31813','58833','59089',
                          '26576','43582','58791','84299','70279',
                          '16200','68571','67327','96385','95064',
                          '98067','51709','47375','38167','40067',
                          '72831','83304','21528','71270','49536',
                          '45976','84067','91416','80869','33466',
                          '63475','47203','66761','45353','14467',
                          '30732','35230','83868','51022','23172',
                          '47929','53715','37879','32226','22231',
                          '78247','59380','18061','97489','12337',
                          '41355','54558','27920','76541','64206',
                          '92403','63486','64179','82639','31069',
                          '88605','19170','63549','55159','30754',
                          '91974','56471','90251','59201','38070',
                          '98156','62205','37805','26052','42585',
                          '48677','33985','68909','36999','34913',
                          '61408','36147','93703','82361','75441',
                          '35795','40520','95355','29695','57099',
                          '71712','33570','52140','86970','15702',
                          '12150','75094','12715','33600','62233',
                          '28791','86300','77958','44541','87153',
                          '27440','82745','63510','47767','87549',
                          '97525','89546','80487','98662','70669',
                          '25534','58659','64232','61428','79206',
                          '11960','71731','93371','16577')
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


