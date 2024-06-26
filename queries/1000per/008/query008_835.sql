
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
                          '60029','91692','45738','74064','93813','43660',
                          '40449','60482','87700','10617','71271',
                          '94011','43897','27833','44452','20250',
                          '80289','21198','25555','25182','77886',
                          '85123','34592','94183','18296','84147',
                          '19929','62700','99065','27298','54056',
                          '91972','73524','11622','66100','60278',
                          '42880','68941','31049','45711','57729',
                          '77876','85115','65235','66759','87183',
                          '91319','45871','17441','64611','12992',
                          '99025','21636','78026','58957','54864',
                          '18460','32116','41430','94438','75702',
                          '80855','83919','13105','58510','69148',
                          '67563','82126','29824','21164','95990',
                          '12097','18275','82167','90132','81881',
                          '81560','95789','52861','94689','50625',
                          '32592','63790','50612','40446','58278',
                          '41903','38391','72985','99145','69804',
                          '49412','34043','41715','68612','68747',
                          '29887','87092','84431','58432','66426',
                          '49392','45695','48865','88527','67425',
                          '39408','49045','19395','85961','38355',
                          '27814','47895','82861','78203','24961',
                          '37687','59636','59484','68515','30247',
                          '41400','40823','17044','52171','16028',
                          '60397','75558','76567','96838','47644',
                          '14017','78548','37557','90224','28124',
                          '79024','10590','40202','61717','11897',
                          '40691','28190','95834','55138','87142',
                          '52110','80908','46665','27428','96012',
                          '63641','75913','68702','48981','23891',
                          '89579','45901','89118','17118','73115',
                          '29907','47505','15717','48313','65384',
                          '75011','77639','15214','69929','23170',
                          '54764','95245','26656','91889','69892',
                          '76964','78461','91510','69362','44421',
                          '89187','75541','13482','84638','37363',
                          '24878','76803','16795','46514','38449',
                          '58910','94903','82671','52446','81726',
                          '52075','68243','76930','56710','63547',
                          '46624','83970','46716','99406','75721',
                          '61647','26809','49541','35770','54534',
                          '25482','91657','34289','35499','99328',
                          '25480','36252','58788','53727','71742',
                          '49727','72835','89678','60005','24969',
                          '44234','28247','26541','42857','82963',
                          '96772','96451','36090','75591','77130',
                          '25607','28824','29532','71151','28665',
                          '34930','97912','13209','84641','96615',
                          '26889','30865','30739','77657','91661',
                          '90074','47541','75920','27953','95714',
                          '44948','36427','53588','51857','73451',
                          '71712','85343','44976','20833','12459',
                          '38003','45293','49863','97940','85021',
                          '19164','16829','51079','58323','79601',
                          '19513','42979','75293','61120','19783',
                          '99459','36482','96090','38039','23273',
                          '10079','34415','96197','64509','16616',
                          '47976','90880','85193','98475','34466',
                          '24788','54115','59656','24110','24439',
                          '76427','64090','20535','80332','45086',
                          '32862','30173','44342','95716','46706',
                          '44835','88003','14062','95182','77098',
                          '56401','62711','74219','82625','31703',
                          '54411','25626','33384','14862','63490',
                          '88832','57900','96665','25849','72989',
                          '46260','81005','84897','61864','33700',
                          '85695','70115','20375','97566','78022',
                          '88484','38091','41115','25804','96420',
                          '84051','84306','34172','49742','21060',
                          '57634','49695','36776','86223','90551',
                          '64770','93736','32099','94179','69825',
                          '59757','27795','85831','63281','81508',
                          '32624','37460','78039','84606','87442',
                          '96867','21449','55740','39169','55222',
                          '64969','47822','93536','20338','74733',
                          '99502','92832','72522','86100','11686',
                          '26976','99827','63709','23965','39409',
                          '99111','78591','29359','45115','84991',
                          '76586','52912','38378','23999')
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
  and d_qoy = 2 and d_year = 1998
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


