
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
                          '90171','28074','34145','29864','69858','72843',
                          '64172','84594','42344','50938','83600',
                          '78771','96399','31491','12264','16336',
                          '23681','12744','97199','92111','29425',
                          '91495','84718','78687','72727','32147',
                          '70581','42472','72922','52637','34559',
                          '60921','85524','85994','73945','54641',
                          '91474','24191','51471','74620','70865',
                          '93939','59776','17700','11029','75346',
                          '68958','15353','76790','76220','81890',
                          '98532','86559','44901','15631','99215',
                          '79213','16053','24972','56022','47233',
                          '62664','25379','77869','33502','92306',
                          '62398','18466','22781','20774','14804',
                          '75783','50975','47752','39161','73865',
                          '58636','46948','57881','66900','27993',
                          '41027','53806','46121','65028','94161',
                          '11329','63634','79026','25023','76026',
                          '35763','39273','94257','20119','20108',
                          '98148','13112','28753','96628','72359',
                          '73484','86010','11710','64837','34197',
                          '29312','60158','34684','33282','29270',
                          '35091','36151','21094','34534','57458',
                          '34367','86625','85391','92231','99292',
                          '16416','53910','98692','33828','33537',
                          '55026','41508','70511','95216','52934',
                          '68607','53320','30508','89977','95615',
                          '30291','96086','44461','19466','92884',
                          '48964','26687','82715','63388','12945',
                          '58871','10258','71821','21274','97910',
                          '30953','57822','97529','55608','98856',
                          '30288','31378','30095','66301','70919',
                          '62461','79967','78850','89862','76170',
                          '36691','36790','75300','73087','88097',
                          '29056','79841','93371','54206','75736',
                          '92594','92320','96194','81977','23237',
                          '11298','33773','40205','77865','58032',
                          '91905','62766','27555','79582','45952',
                          '61010','60571','63621','75304','70212',
                          '79135','32374','38305','64311','62104',
                          '71705','85026','60603','86981','20943',
                          '68979','98743','66449','65107','48956',
                          '11587','81117','22836','52263','61063',
                          '15277','21420','63231','72245','75575',
                          '54720','79449','33802','28085','93808',
                          '82610','40927','69656','19730','40950',
                          '99223','51710','39590','49403','60931',
                          '48056','10552','58426','16357','70221',
                          '88857','48096','93634','76772','47235',
                          '34262','83863','50014','93198','26828',
                          '81803','89481','13266','65968','98775',
                          '75224','88090','50655','57017','29459',
                          '33347','71536','19786','41061','25353',
                          '56523','64338','39463','43912','59337',
                          '29635','83127','94618','19240','71609',
                          '69154','35192','23616','69666','27022',
                          '38271','88247','73379','84069','55669',
                          '35277','52711','28482','14765','47241',
                          '35189','69592','18531','90679','83589',
                          '19967','12955','51754','51096','47908',
                          '56242','80484','87213','81338','66101',
                          '37230','96688','22625','43379','29174',
                          '16673','35841','58259','87199','43564',
                          '91757','41798','47595','25750','30942',
                          '66897','53605','89372','33451','49759',
                          '86836','86932','19501','35597','84203',
                          '12383','97514','28958','62057','90424',
                          '41188','57591','11038','51841','38963',
                          '11781','91345','48562','55495','54362',
                          '34770','21948','40112','80415','27049',
                          '90148','13233','68340','11497','88194',
                          '48091','24540','77792','72126','29537',
                          '43638','24227','19820','46645','36611',
                          '20952','24957','47218','98369','10714',
                          '70198','74511','95510','32804','94220',
                          '41964','67250','36583','47422','46342',
                          '68226','42932','55746','32272','28334',
                          '14266','23082','16662','19207','34066',
                          '76644','44886','25851','84055','85380',
                          '76911','18790','29997','80987')
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


