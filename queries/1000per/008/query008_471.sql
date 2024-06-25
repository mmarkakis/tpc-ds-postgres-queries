
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
                          '96447','50226','57773','58451','92098','62091',
                          '20691','16020','77798','82445','74183',
                          '81997','22321','90105','19300','99601',
                          '60598','94568','52877','27065','26399',
                          '71507','85602','39642','67163','39225',
                          '51220','74438','54447','23969','20418',
                          '61231','69778','94057','13502','41760',
                          '12871','76811','63124','50393','82531',
                          '98353','38034','33868','66441','70676',
                          '14541','94424','48441','50765','40769',
                          '55954','77756','49114','83301','45070',
                          '76745','53580','54797','45335','35045',
                          '57947','63464','40146','40398','37872',
                          '89632','70550','93528','37980','33261',
                          '34872','52412','61291','98718','96343',
                          '25787','42760','73999','77442','36579',
                          '37783','70536','55892','93459','71047',
                          '25739','84094','81437','15646','44248',
                          '23175','86648','11079','18369','20480',
                          '65561','17092','25139','75108','25091',
                          '12913','10945','21671','32983','58944',
                          '48318','65375','75617','35593','39942',
                          '48769','17534','45495','46383','71912',
                          '35815','16646','65606','19965','50323',
                          '88942','34828','34473','53676','60641',
                          '16551','66667','54457','13872','20154',
                          '43059','30754','70008','72490','83425',
                          '43519','23649','27350','10480','38302',
                          '63641','40053','28015','29448','94230',
                          '61344','11852','36163','90441','88419',
                          '26529','25308','58370','29467','95034',
                          '23119','38436','81250','73205','74516',
                          '69683','54970','94430','80820','77883',
                          '79448','22972','74121','69420','85419',
                          '11127','91256','69820','26677','63531',
                          '56176','15483','96371','73300','26155',
                          '60157','79667','45824','23758','46174',
                          '67817','76863','57369','88589','16574',
                          '34348','12848','95440','76499','34817',
                          '16738','37684','82256','52938','55031',
                          '15084','28090','54573','36618','54499',
                          '40483','22023','45765','28352','11160',
                          '15848','30921','55650','82089','53715',
                          '37717','70080','85142','92575','59144',
                          '52527','79519','17142','72812','26479',
                          '60937','34795','54351','83684','95157',
                          '56497','64896','18501','87098','18274',
                          '91852','80773','90690','72353','94246',
                          '24732','98323','92794','79487','48308',
                          '66712','93561','43575','61494','28602',
                          '42280','30852','89161','46362','92592',
                          '40296','92375','35673','17384','49797',
                          '98459','60934','74051','77256','68537',
                          '94615','73140','98607','53472','88135',
                          '62668','52435','67441','76651','83144',
                          '43976','19801','11123','80024','72699',
                          '38582','83879','65088','42875','87411',
                          '65257','41943','99505','49077','91124',
                          '86850','41049','93593','88181','33644',
                          '38537','31010','89969','37905','57271',
                          '12806','25594','79841','93741','71581',
                          '82825','16913','71664','82187','22963',
                          '83653','74402','58087','34413','35118',
                          '37987','41384','23306','76448','32389',
                          '33341','70832','81930','44878','45177',
                          '68435','74197','43014','36049','83872',
                          '78048','50072','86315','13021','35883',
                          '32091','37258','59772','66120','19979',
                          '33999','93992','57951','38484','45674',
                          '34715','52269','84189','38236','28537',
                          '11536','74773','14684','42321','71035',
                          '96427','21354','79136','16430','17832',
                          '83223','59508','50373','82000','14047',
                          '46606','24891','90658','88375','12399',
                          '27129','13425','95830','91440','75509',
                          '81254','31997','36738','36046','74574',
                          '67891','14828','18690','91338','37373',
                          '51365','38270','58569','31918','70252',
                          '43945','55161','10123','96678','21824',
                          '54721','91187','87997','77648')
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
  and d_qoy = 1 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

