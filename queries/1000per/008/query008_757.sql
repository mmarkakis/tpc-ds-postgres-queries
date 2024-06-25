
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
                          '13477','91878','57997','67466','52185','18492',
                          '53303','20817','68317','99141','14612',
                          '65824','31036','48780','81302','55878',
                          '16554','42321','40832','70628','28267',
                          '34984','76258','35938','91309','10839',
                          '46065','62029','27715','85300','21269',
                          '64486','61880','67873','72571','91104',
                          '39241','26143','72140','47245','20932',
                          '19763','52922','53103','57225','20467',
                          '75534','11799','20892','89709','40262',
                          '50761','10627','73200','24148','94456',
                          '20212','80699','76252','82642','77889',
                          '13873','89525','50229','95651','96885',
                          '56479','71674','17368','46875','47426',
                          '78150','66461','38923','54979','60535',
                          '56177','14502','34863','40778','17459',
                          '92195','61457','67178','86815','45790',
                          '69050','83612','92445','95445','76654',
                          '52640','47472','55288','20878','99774',
                          '65642','33825','91544','28618','65626',
                          '77981','16926','29889','60984','77846',
                          '90397','92811','98683','37589','85144',
                          '62584','31928','89269','47126','50639',
                          '79313','84955','57957','79377','23711',
                          '49044','19818','99827','94421','14346',
                          '92590','53484','70585','45256','76315',
                          '43753','91011','99073','70230','25664',
                          '47214','74515','36465','68043','47058',
                          '91288','63754','55736','25875','17603',
                          '59116','75610','16849','84684','49497',
                          '13889','42581','86837','44096','29016',
                          '47241','63877','52145','32492','68786',
                          '36114','71529','20342','43830','70594',
                          '16868','11433','10613','62187','25331',
                          '65837','94143','70053','92550','29411',
                          '36867','50483','22399','75733','23531',
                          '42544','96494','71671','84314','87195',
                          '51838','92024','22638','78407','56163',
                          '96292','46723','93589','88671','35670',
                          '85860','22892','54916','31655','89475',
                          '54865','54797','83615','12478','67150',
                          '90371','41632','82373','78380','31080',
                          '60913','51142','54604','87587','87883',
                          '11009','73438','76669','61219','96707',
                          '46456','35144','93643','47843','98305',
                          '66856','63064','95723','96443','66820',
                          '99170','52613','51829','31529','12578',
                          '61867','83135','16217','55598','91828',
                          '50028','11859','11154','36774','78992',
                          '71923','82222','45372','40527','10874',
                          '11268','24694','49051','59655','46212',
                          '64621','74907','30183','76508','30794',
                          '44730','35371','71403','85464','87457',
                          '61334','49760','41820','67787','19128',
                          '49338','69139','65691','34599','39333',
                          '81462','98889','60507','84211','85096',
                          '15184','84847','62767','44016','90467',
                          '44866','62934','19544','27859','79482',
                          '69694','81761','42564','69192','42353',
                          '96263','13969','14255','22836','11946',
                          '74749','83576','79123','50243','27077',
                          '12012','63618','39091','40572','44832',
                          '65275','63295','27238','59182','62192',
                          '51852','31906','96059','74947','26512',
                          '23964','76087','67403','27752','26061',
                          '91219','28309','14406','45287','41024',
                          '96311','38250','24360','22987','93917',
                          '35128','10687','86330','37929','84400',
                          '26693','26594','33521','43474','19122',
                          '77004','91393','17673','13143','59176',
                          '84138','21271','86157','23541','56423',
                          '49170','35967','86028','26921','25571',
                          '42423','84415','21226','84467','22701',
                          '78232','63308','66981','96591','51702',
                          '60245','51990','23486','61904','46127',
                          '76716','22470','59662','92941','34056',
                          '83351','49283','64446','40688','88844',
                          '78097','63721','22103','98701','59380',
                          '38484','54440','79523','98819','60338',
                          '78926','28381','10284','46466')
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

