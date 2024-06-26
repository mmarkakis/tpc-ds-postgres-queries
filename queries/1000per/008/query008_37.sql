
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
                          '91725','36047','29193','19364','78332','50344',
                          '30831','23688','49172','67183','45618',
                          '60317','94417','85352','99438','68196',
                          '96145','12164','11514','30800','79545',
                          '98555','29560','13810','66306','13539',
                          '21417','30343','20778','69148','86552',
                          '72441','75620','54393','98190','56741',
                          '59862','43973','56105','42039','59021',
                          '41092','53713','67674','85465','31791',
                          '95758','43949','20804','30049','84966',
                          '50274','30172','27599','55097','71706',
                          '98297','47557','72744','10442','73829',
                          '51065','16410','18613','51749','36980',
                          '60044','46844','45080','61655','98217',
                          '19290','84522','95977','40640','48691',
                          '95917','13805','32698','21348','67290',
                          '85186','18986','98913','34663','14563',
                          '98593','26132','12362','97136','39220',
                          '81020','82856','63904','46515','24374',
                          '93467','22961','29905','64083','14352',
                          '50813','51151','36709','85430','76425',
                          '43968','15467','68127','45772','27533',
                          '79903','21017','45677','76797','66033',
                          '76492','50453','94530','26860','78785',
                          '47302','19240','46015','41951','13383',
                          '19655','26306','43378','96558','67276',
                          '73423','34849','62420','53406','51354',
                          '91187','46154','98245','59860','88587',
                          '82868','16258','43529','11483','42326',
                          '18902','11640','12243','28263','71276',
                          '13405','30420','21688','90478','23841',
                          '80600','26779','95786','23524','79452',
                          '14360','81635','45737','77576','10122',
                          '40620','59520','93335','94658','95571',
                          '11069','89192','73377','86953','21526',
                          '99208','50247','91517','75693','65828',
                          '90689','14062','94104','33972','78831',
                          '77649','60793','65886','68527','34165',
                          '34596','40839','30993','61423','19659',
                          '80195','56318','56341','54181','22800',
                          '94771','38447','18216','73702','76196',
                          '37684','59808','23959','40880','32628',
                          '48566','98532','18853','73159','22893',
                          '62758','88218','56010','54637','68020',
                          '40789','97096','80867','28904','57619',
                          '80781','93564','61863','87362','27706',
                          '75206','62413','24007','83650','93192',
                          '25823','78940','55230','83511','82319',
                          '75975','22584','90375','39607','72221',
                          '58462','51407','33990','20020','24111',
                          '25972','83397','22427','85456','11961',
                          '61353','53235','78666','90584','41110',
                          '71938','56401','82534','60804','79354',
                          '36036','54529','97140','42433','48155',
                          '64892','46547','58059','70105','34308',
                          '99585','69483','44552','68157','97604',
                          '37438','90351','49564','60378','88212',
                          '38561','91300','59163','23953','36856',
                          '11467','67642','17745','34766','38022',
                          '49930','53547','57107','23701','69668',
                          '39966','33954','35880','19872','41876',
                          '17868','33436','89413','86592','65600',
                          '92152','81391','79436','11874','84625',
                          '52066','25091','35209','18920','78774',
                          '58580','25111','25321','56868','82083',
                          '90953','11302','20102','49423','87991',
                          '43947','93202','40041','33515','63287',
                          '39803','32656','52665','40643','33328',
                          '23542','66728','67496','58663','12412',
                          '85607','18792','88230','78308','62447',
                          '86605','97334','55201','37502','93924',
                          '73759','44689','60283','13652','99279',
                          '42156','29884','68133','94212','32456',
                          '55908','10889','85216','56267','32191',
                          '93103','49984','25891','11472','54650',
                          '18027','70342','11822','84671','11470',
                          '95173','72742','39351','37999','78566',
                          '49403','76853','10048','39032','38658',
                          '38764','13635','93693','21786','69972',
                          '62511','68043','84062','43489')
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


