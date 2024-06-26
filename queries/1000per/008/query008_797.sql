
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
                          '37488','97655','65720','88097','18251','25351',
                          '10228','58031','21926','87425','82258',
                          '75291','74233','59388','40244','72840',
                          '84574','87460','68784','79882','59306',
                          '43371','98023','39420','42817','88173',
                          '55838','96652','13303','68192','12310',
                          '51261','12474','70135','80936','12164',
                          '97286','83099','55681','38597','17355',
                          '94721','97702','32476','30917','66819',
                          '66699','90545','89535','67328','58010',
                          '67822','14527','66220','59859','68589',
                          '60585','21075','73051','25556','21451',
                          '41955','37236','42708','24590','76579',
                          '47961','31129','12799','35162','35558',
                          '23844','33320','82630','54381','15706',
                          '23455','68768','36235','32104','49794',
                          '22621','98103','28312','21583','46441',
                          '26732','76589','10689','60905','83720',
                          '82477','77855','65538','14869','49714',
                          '40814','52412','24397','18604','80296',
                          '63872','45040','52277','31202','64219',
                          '50223','60714','35541','47935','98705',
                          '81587','25366','95951','82377','34334',
                          '52212','25424','22113','96097','63604',
                          '54227','26343','97265','56932','43096',
                          '66651','28527','69918','50500','74889',
                          '39609','34265','72093','28128','80552',
                          '57438','17828','81650','62585','29943',
                          '56588','32096','11755','76276','33141',
                          '63335','39026','93415','43411','28718',
                          '54058','20283','29483','48106','18077',
                          '96357','88695','10111','19534','55050',
                          '31375','32997','23553','27754','76178',
                          '54876','33716','88522','76966','64364',
                          '21504','73836','47216','72721','98475',
                          '69535','92500','37626','18522','27683',
                          '40727','42289','36185','40255','32229',
                          '99507','63848','88283','82296','40117',
                          '82025','78483','98638','19930','48956',
                          '32535','40973','46284','19095','59791',
                          '32250','94641','96828','47909','26687',
                          '45462','50668','19290','42238','37035',
                          '78501','81366','88186','99710','46979',
                          '78143','52304','82876','75255','78586',
                          '21478','93355','28463','54187','23045',
                          '45652','80656','88606','34955','10047',
                          '60717','19511','96582','38800','89318',
                          '14866','94165','58283','30919','82510',
                          '22496','60126','82912','36739','61747',
                          '68952','99589','83682','19239','62511',
                          '46972','66229','62833','49976','20771',
                          '39495','39555','37688','74713','48543',
                          '28865','51983','29089','40738','78151',
                          '80361','33179','23568','59816','66958',
                          '21671','42252','88552','90982','81237',
                          '81027','31449','19478','13622','62956',
                          '82937','10075','88596','73816','82493',
                          '76614','22926','79194','28605','44061',
                          '97534','86390','43679','86937','77357',
                          '37694','76951','74431','55580','37472',
                          '30964','71089','92680','76576','73432',
                          '53769','10839','68863','53547','58043',
                          '40668','78518','63967','87549','15082',
                          '34139','74949','42144','97104','34619',
                          '88699','93849','52919','40492','37893',
                          '54746','25443','18775','54192','39758',
                          '52717','66260','69628','53875','32416',
                          '94129','37896','99474','63935','48621',
                          '57503','36902','55186','70641','64786',
                          '41925','59983','64301','65407','30729',
                          '70330','39718','45311','25754','52873',
                          '35826','40506','30749','32664','90436',
                          '66550','49559','32644','87961','81381',
                          '90331','42427','65747','16510','34528',
                          '78258','46506','44130','22849','74767',
                          '41834','49065','96548','87668','55422',
                          '94084','27523','34584','18575','70435',
                          '34156','60807','77977','10803','96536',
                          '84988','56169','72612','98986','74988',
                          '85368','34575','77831','72246')
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


