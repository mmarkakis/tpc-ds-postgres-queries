
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
                          '64930','35741','16849','25588','34687','88505',
                          '58015','71617','77946','16356','40807',
                          '88577','25208','50394','33126','38735',
                          '92660','37455','57801','62435','47946',
                          '58715','70940','52255','70408','51379',
                          '58123','44842','68273','26603','39954',
                          '81666','65985','46632','30859','31392',
                          '36731','62405','64051','81886','22195',
                          '90801','26551','57964','53295','84935',
                          '63144','32610','70731','54857','51991',
                          '30870','71896','54300','49635','16928',
                          '99878','82303','70256','50868','47818',
                          '53400','77397','24557','95784','46694',
                          '93805','69211','11883','54618','33199',
                          '86996','95680','36393','70662','36706',
                          '12898','87420','33043','90018','64835',
                          '75401','21062','85196','35792','18904',
                          '84408','11497','62396','90262','54357',
                          '72301','86392','15715','50245','24246',
                          '62694','23802','78821','60524','78384',
                          '67061','20741','27330','55164','52543',
                          '59796','14405','91160','85381','10070',
                          '53538','95205','22362','99706','32828',
                          '23677','44735','93124','95572','96474',
                          '72385','23090','74009','56214','60216',
                          '47435','80836','37493','19456','33275',
                          '84461','57293','54646','27294','12369',
                          '98320','71983','72624','12699','26069',
                          '95269','15265','73440','35606','26996',
                          '76273','88426','29347','81230','19635',
                          '91133','12716','88108','22227','70971',
                          '50190','89015','63415','98645','97420',
                          '80449','88975','21333','76731','79697',
                          '67763','47014','58167','32960','55961',
                          '29156','89846','23669','86046','21078',
                          '58127','61943','69623','26028','33265',
                          '71154','25431','89290','57893','34212',
                          '57060','45932','25245','46477','64020',
                          '40240','93158','16930','77363','28585',
                          '87798','24692','79352','11019','59990',
                          '16401','60266','43013','77402','75574',
                          '92389','99446','86538','50580','48746',
                          '29787','28283','37550','73930','39355',
                          '86833','42676','84976','51646','39664',
                          '22774','81929','62608','20123','11848',
                          '10638','74891','99543','67877','91347',
                          '42173','15719','41777','19831','60039',
                          '36212','90354','99385','62341','29973',
                          '33875','67974','97294','34781','41569',
                          '18926','33519','55634','61107','42443',
                          '77242','50619','77156','56491','99022',
                          '60764','39528','57111','83236','79869',
                          '83096','77080','27679','63345','44583',
                          '56252','49192','59341','58382','29326',
                          '17033','26035','65824','41184','55223',
                          '98308','55222','92113','40483','11849',
                          '18290','81802','13609','87512','42214',
                          '66633','74469','83545','52539','76234',
                          '64416','80101','95116','52206','77513',
                          '15701','79761','45412','19672','42064',
                          '74699','89457','49892','97342','50340',
                          '28409','86733','37299','70939','70397',
                          '33167','50218','51258','90860','47339',
                          '82778','17709','28408','29322','39268',
                          '70009','95764','33508','24906','59627',
                          '81441','21261','19347','61557','83548',
                          '94132','40109','68096','62307','95733',
                          '42916','36684','89254','55963','99439',
                          '86866','75056','91612','50305','55817',
                          '20702','27316','37574','18314','10874',
                          '91200','35380','60877','13947','47101',
                          '63154','51065','76064','35960','77666',
                          '26667','84864','73902','50969','24772',
                          '19034','91016','21391','39406','10319',
                          '69666','19479','70854','61657','84224',
                          '95076','13495','80703','53920','39777',
                          '73498','88981','74580','71185','52355',
                          '33956','20425','31292','17144','14943',
                          '27530','28595','22188','57353','31948',
                          '34425','50996','69390','51931')
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
  and d_qoy = 2 and d_year = 2000
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


