
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
                          '30153','53099','17628','16532','97708','82515',
                          '50668','72946','31665','77367','21640',
                          '72663','95479','59464','11649','13320',
                          '14624','71780','16955','53413','76195',
                          '24439','36575','38205','35697','49794',
                          '34650','12214','97845','26558','48030',
                          '29444','16678','25932','65953','11070',
                          '62250','41441','58223','69988','88495',
                          '15262','81363','31342','16352','48878',
                          '49133','33753','63072','56022','28627',
                          '13249','55002','48701','61590','34534',
                          '29697','34197','68857','39654','75103',
                          '18218','81475','35438','50939','81997',
                          '72122','53485','84120','32338','39304',
                          '53333','48428','13371','32591','23578',
                          '59680','72448','72479','80207','65830',
                          '12297','20766','80899','87294','23390',
                          '24065','59567','36803','17677','10525',
                          '71842','50606','78884','68395','14745',
                          '78220','33451','40750','28753','47369',
                          '50962','13445','13960','71542','69324',
                          '86424','18526','30842','16101','52341',
                          '15634','90814','49651','31291','45853',
                          '23684','12013','50090','83598','92527',
                          '82435','38582','12236','14607','88574',
                          '93963','61924','98547','37068','10863',
                          '48647','95719','37977','78967','78437',
                          '51847','80097','75883','46846','51694',
                          '17220','41037','79899','63297','30603',
                          '56141','93823','67634','86129','94091',
                          '38445','54635','64294','18691','66462',
                          '13272','12817','81528','50045','16025',
                          '78432','49673','46247','19934','45539',
                          '50542','47414','78339','55943','87098',
                          '33717','90997','10951','19570','18485',
                          '98353','37583','78966','20331','45564',
                          '10103','59964','90473','12451','50905',
                          '36738','90602','13196','75007','54675',
                          '71492','54203','89811','72677','67990',
                          '33033','42698','10097','45675','85406',
                          '17410','22418','21929','95186','18991',
                          '13926','15660','21038','68827','74665',
                          '82328','61112','98337','48794','19604',
                          '77539','93319','84836','15198','26436',
                          '21591','36197','25588','95794','21549',
                          '13378','29556','21758','44402','14140',
                          '28515','15732','97277','12307','37963',
                          '73348','78413','78743','48205','87680',
                          '78527','69302','87409','49352','44472',
                          '84820','66171','91181','95827','16302',
                          '77349','76268','82926','92449','71691',
                          '94127','45206','61795','20712','65815',
                          '29216','65073','23489','54137','36932',
                          '98589','33045','80817','45008','81357',
                          '58560','34081','99548','14772','69777',
                          '37799','91133','13237','23584','19746',
                          '96187','38741','73459','62827','24919',
                          '73988','75862','50829','73415','82131',
                          '44058','68509','59488','70074','94673',
                          '88174','49650','77637','22582','67111',
                          '14556','95139','68021','87929','82556',
                          '76899','54986','49920','71003','18437',
                          '51717','89781','87466','85625','59120',
                          '87328','24998','53671','49408','37756',
                          '13450','59433','76094','90062','88310',
                          '26221','37167','95303','65962','55654',
                          '66859','32461','87195','64492','75990',
                          '80587','50394','80805','80979','66382',
                          '46551','53369','86106','11465','12538',
                          '52849','13425','26267','74320','40281',
                          '50265','77983','38512','23654','70912',
                          '77974','56818','33672','40393','46618',
                          '14287','22284','70960','74901','26327',
                          '94138','31084','33776','51481','75478',
                          '16837','70534','99721','60788','73393',
                          '98619','41665','39101','38010','51917',
                          '26120','24553','30909','82436','12569',
                          '78436','96886','67178','16198','74154',
                          '38991','54728','28339','80016','96736',
                          '17696','10733','59231','15739')
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


