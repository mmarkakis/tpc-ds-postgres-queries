
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
                          '13082','47208','75906','19884','16075','66968',
                          '70513','56749','49649','79947','29001',
                          '67873','30287','63834','91066','71315',
                          '43756','76932','39338','78005','27028',
                          '68249','77613','47704','38943','12425',
                          '19917','71088','48674','18544','26245',
                          '15963','86059','96676','69331','98713',
                          '97093','35113','51572','35248','59083',
                          '66255','64436','57512','38867','92504',
                          '22854','46307','29665','63516','25341',
                          '67645','38222','49785','19830','99772',
                          '44027','56354','39086','12583','19261',
                          '65723','17688','31528','87013','59956',
                          '83024','55462','48513','11282','75148',
                          '17564','72628','10610','90877','28739',
                          '90142','22658','70216','27948','74631',
                          '99357','78192','59272','98906','46430',
                          '44615','17673','42519','27101','72223',
                          '54223','21753','49701','46693','29593',
                          '94112','95299','68154','76499','23666',
                          '62131','19066','46160','70482','36612',
                          '51364','75458','53577','17074','17048',
                          '66952','55126','15616','57634','31548',
                          '80010','25204','83048','68148','81456',
                          '35990','96736','26369','27952','60820',
                          '82645','84055','68575','33706','96585',
                          '19220','52157','80584','74178','59821',
                          '59786','49025','73513','29341','37291',
                          '44355','60412','88110','59967','13930',
                          '57584','20173','17573','24009','48313',
                          '88867','47125','42709','38142','13402',
                          '65576','66172','80854','34314','39048',
                          '86564','39921','59706','80880','40601',
                          '24865','13792','44468','87465','92328',
                          '41015','41790','41812','48844','23033',
                          '37977','48720','55199','21531','26820',
                          '12940','20662','46217','24854','60121',
                          '65057','94922','33037','38772','67543',
                          '77856','72509','12601','72900','93535',
                          '75814','63043','58359','58221','16978',
                          '48815','17758','37403','64006','51175',
                          '65335','22630','34120','84770','51234',
                          '49276','99211','18000','57286','19910',
                          '20033','23918','42318','34844','48931',
                          '11886','35006','84143','38829','30544',
                          '60271','84704','81327','14792','74918',
                          '74970','58786','52966','83198','11419',
                          '80481','33105','90899','70030','93417',
                          '46510','67721','34054','21493','17033',
                          '89172','19190','34203','16751','87368',
                          '61802','15018','48216','25623','88762',
                          '61718','30831','36970','32388','78606',
                          '82171','16032','78074','86315','63143',
                          '80263','72948','33113','92073','69922',
                          '70046','69376','78406','37550','47605',
                          '82999','98520','38538','42152','42434',
                          '79480','67961','64428','32803','90837',
                          '97880','46887','91640','79659','71722',
                          '16379','42982','15604','64838','24694',
                          '46616','50906','76836','45939','31003',
                          '34365','93091','73162','34031','62489',
                          '49381','34016','64011','29794','38535',
                          '89937','76484','87243','46896','49544',
                          '40712','99102','87222','77730','27477',
                          '20316','93299','50629','20396','73108',
                          '37603','52931','16930','58793','49618',
                          '61619','46049','14713','62863','42352',
                          '43621','85352','48860','55417','19349',
                          '88930','30934','32520','20440','34496',
                          '31408','98092','78840','22678','79445',
                          '37051','35221','88171','75078','92968',
                          '81930','68638','13733','25545','41443',
                          '81734','43751','52055','28145','54834',
                          '57045','95020','33513','12830','58461',
                          '57343','80322','72324','27003','82984',
                          '90756','51342','47196','38737','56926',
                          '38729','88875','66723','55202','26769',
                          '63141','72546','66385','60737','75770',
                          '33563','81491','83241','87342','71031',
                          '34901','87828','23083','18570')
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
  and d_qoy = 2 and d_year = 1999
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


