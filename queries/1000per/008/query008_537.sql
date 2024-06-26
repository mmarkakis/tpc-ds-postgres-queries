
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
                          '49069','18666','95989','81998','38569','63715',
                          '96133','11045','86494','32812','83714',
                          '78378','61805','32353','20480','25898',
                          '79996','96723','32351','78949','38787',
                          '22487','93690','99254','96504','15657',
                          '97212','21609','74560','34657','11091',
                          '75690','63195','64103','76253','38249',
                          '41821','10670','80013','50067','65719',
                          '40093','66169','40727','33440','90234',
                          '25534','69995','50449','74614','25215',
                          '56988','67859','58759','49342','58474',
                          '15684','18849','17623','66776','11223',
                          '33600','88737','94105','17183','55440',
                          '13589','97350','18374','39102','88414',
                          '96850','39570','16973','10253','27006',
                          '66203','87949','77177','11152','38458',
                          '71584','62209','98915','60773','41579',
                          '18656','56849','48390','54473','94366',
                          '65242','32091','77234','22240','31956',
                          '81120','98267','88599','89289','88320',
                          '35366','66145','14977','90088','46277',
                          '20001','22331','53113','63436','52707',
                          '52768','47396','55771','33953','69990',
                          '69635','12731','61440','46314','28005',
                          '59486','26296','59477','41454','43047',
                          '42829','95342','89612','78271','77365',
                          '24101','90766','58693','11073','78031',
                          '41919','43801','21679','23630','70540',
                          '34100','24527','53328','19321','65933',
                          '45787','87916','34553','90708','33925',
                          '95798','86389','85256','59346','24944',
                          '61557','57793','74998','78581','21064',
                          '42458','66427','68033','93376','50732',
                          '47548','88481','93235','78097','25627',
                          '44373','11951','37826','77659','40669',
                          '45396','19516','53756','62728','58565',
                          '67197','67870','46126','75818','84493',
                          '64267','41207','78095','66098','76384',
                          '88920','78294','18171','29817','99163',
                          '65901','81375','37018','64735','99613',
                          '71000','49860','43698','77091','11999',
                          '13563','86203','67862','29021','25327',
                          '24447','99353','30368','83339','31540',
                          '22860','81485','32065','67380','65484',
                          '95560','78422','53691','88183','18381',
                          '73868','16736','20876','97769','26646',
                          '27662','83276','84222','68858','37756',
                          '64802','95493','87392','63016','38567',
                          '47425','63783','92617','16204','81527',
                          '53793','10711','90144','94545','77032',
                          '34108','98362','30706','87301','13291',
                          '68211','78775','89520','69534','91973',
                          '66092','54712','90948','95450','13514',
                          '76486','83483','23323','31327','10937',
                          '82397','52632','34346','90843','26844',
                          '81061','83030','68536','12037','69629',
                          '50177','16399','54434','33472','96677',
                          '67973','62907','82249','16405','56941',
                          '29553','34260','82916','25026','10847',
                          '40690','10678','63366','70967','92623',
                          '74230','58605','81506','52404','95136',
                          '55415','45846','56211','22113','45589',
                          '13127','52464','82913','95308','77851',
                          '74091','50812','72020','47695','53939',
                          '99930','93616','66689','64307','76639',
                          '54933','98166','89648','48770','76643',
                          '56529','12047','93482','87287','27201',
                          '79363','63513','61454','78623','91194',
                          '11804','35247','32609','20310','62712',
                          '10771','62604','98670','27715','82580',
                          '29790','24693','70894','14408','36994',
                          '95662','72041','69020','79362','95417',
                          '60690','62986','19111','38052','91180',
                          '14270','99097','44268','50650','99288',
                          '54071','73200','19274','31871','58510',
                          '67804','32549','84860','17091','19790',
                          '50052','44786','27828','25684','89031',
                          '66025','61865','85380','96086','87833',
                          '31513','12887','14327','73605','81430',
                          '85013','57607','49262','10053')
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


