
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
                          '80368','81992','55096','70645','49614','71067',
                          '32291','79892','15945','61214','39605',
                          '24122','46735','18704','91852','22737',
                          '79199','84178','62025','15286','51337',
                          '84818','16846','99354','54615','61654',
                          '63291','30194','43439','32458','88433',
                          '65973','20005','27537','62932','66356',
                          '82102','69308','64723','98570','36840',
                          '15267','42509','30375','40246','12740',
                          '45916','84162','81229','75895','43498',
                          '93980','60608','98992','84749','73961',
                          '32018','61471','58670','34207','40872',
                          '31887','66431','69701','12189','82579',
                          '49405','92317','96135','44078','67091',
                          '46376','22477','11594','73000','28169',
                          '21094','87056','92131','49404','22222',
                          '16263','14690','59041','80489','12854',
                          '91613','64082','80192','39420','91587',
                          '87471','47940','31282','41922','65555',
                          '92272','31687','30458','78064','65455',
                          '52315','53415','37395','40494','57093',
                          '34157','90353','32192','46779','80438',
                          '89899','14693','70734','82187','93370',
                          '64394','35083','32959','91947','33639',
                          '90314','95944','36864','34860','13618',
                          '55896','30813','45441','58409','74716',
                          '97664','69611','32892','95295','83243',
                          '55543','19290','36928','56916','14346',
                          '92162','16186','71125','11644','59022',
                          '58259','34833','80413','49236','96292',
                          '68455','35247','40249','25827','43611',
                          '16589','25943','71287','45698','51312',
                          '98409','44900','58813','31484','75219',
                          '48567','82279','81707','71256','40055',
                          '10389','29343','77283','43304','44659',
                          '58426','71688','52098','87307','69618',
                          '71111','71890','46168','32302','51754',
                          '88033','20831','78717','80527','20540',
                          '35196','64152','12593','30314','58983',
                          '30774','14370','23631','92679','71537',
                          '36549','69299','86157','77308','76157',
                          '82178','50910','17138','30326','73164',
                          '95996','61009','21177','96861','99023',
                          '73944','40019','95856','25286','65279',
                          '64884','86317','89355','13324','77720',
                          '18651','17911','97492','15577','58031',
                          '52791','23158','30132','54408','66830',
                          '61953','80951','54296','91811','40913',
                          '61109','91013','66672','14742','59094',
                          '45458','54455','44040','37534','99280',
                          '82100','87387','21027','12679','65645',
                          '59283','18535','89084','17857','37241',
                          '29784','12790','97027','80387','15703',
                          '21961','49193','63851','19713','14078',
                          '84036','47300','93832','94617','55648',
                          '22156','98469','34812','91553','98144',
                          '59208','43440','63245','90986','67890',
                          '89237','66636','27428','21260','45826',
                          '81753','44274','59934','77528','99314',
                          '98561','73191','88350','15281','85265',
                          '21204','14727','12479','96106','44087',
                          '65402','37260','63175','93544','18780',
                          '24868','82002','68778','38210','62457',
                          '50657','93661','92579','44927','58119',
                          '34561','83784','53741','64985','56841',
                          '73567','39059','50217','55391','90860',
                          '51838','63515','35650','81257','95755',
                          '38153','31005','31789','88694','90662',
                          '73030','45121','97254','74059','67641',
                          '73968','42694','45472','67801','48677',
                          '32538','46442','19778','16676','54470',
                          '88278','63581','46131','28506','87494',
                          '59020','64460','98006','37530','62086',
                          '77333','50111','27138','95900','43914',
                          '22987','33908','89224','88091','57855',
                          '26694','82748','57727','47517','37413',
                          '75314','21883','95829','32272','85042',
                          '39724','44276','42735','66622','12112',
                          '76054','56673','11969','37829','94301',
                          '45348','11519','96741','97858')
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

