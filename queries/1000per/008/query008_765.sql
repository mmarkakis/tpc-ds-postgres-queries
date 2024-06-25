
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
                          '29905','23348','75658','87447','94970','54558',
                          '94748','62628','95081','96038','50664',
                          '84909','40373','92693','12819','73076',
                          '83388','78822','66056','34410','25246',
                          '64707','51550','84375','84435','19323',
                          '36527','45403','50975','40138','58681',
                          '62412','60995','54227','54802','65940',
                          '60999','48097','41975','71342','34981',
                          '17092','25418','56567','43134','91164',
                          '31319','72562','75964','12557','11570',
                          '53484','44825','97798','84356','12453',
                          '87452','10315','61149','76772','74153',
                          '59670','74968','72534','41191','85794',
                          '50008','45210','28073','70593','39704',
                          '17600','55762','27865','88139','76507',
                          '97608','90375','17868','35256','14685',
                          '89965','25529','28149','28840','64554',
                          '87303','88836','37182','91263','85772',
                          '46346','64477','69651','60139','65535',
                          '93784','53142','16948','60810','13438',
                          '70968','71671','86594','40026','71444',
                          '40578','97575','96032','28807','52291',
                          '90022','57777','78481','73563','15895',
                          '87022','32739','66580','44892','66260',
                          '99022','39702','80109','95847','16369',
                          '93484','28167','24093','26851','56358',
                          '28544','97056','14925','59158','49731',
                          '85348','84475','43373','52110','74419',
                          '68628','78637','47344','79475','29948',
                          '63521','57130','18546','49465','66546',
                          '36337','13083','25200','38653','59241',
                          '26914','72692','72536','38956','90621',
                          '28408','51743','59809','77379','81378',
                          '96627','21145','96468','39255','23288',
                          '87416','40343','29638','53916','56788',
                          '88274','44818','59662','13267','94698',
                          '84012','10852','62087','39816','32306',
                          '32326','97761','87924','55830','85614',
                          '30486','83028','67571','98627','18648',
                          '72794','26071','86741','74172','21992',
                          '39911','65375','46186','50896','31037',
                          '65825','70098','25075','39850','25377',
                          '56305','93913','10279','89944','71835',
                          '29158','60152','34011','39671','80866',
                          '50396','36767','50710','82903','57933',
                          '16358','61028','87088','57092','99153',
                          '91255','58372','55644','85075','77173',
                          '89504','95246','60410','68418','27921',
                          '80436','13588','54846','17365','40638',
                          '54649','97996','25260','16294','61388',
                          '31204','85420','98818','80943','13433',
                          '42334','60271','63806','73670','69995',
                          '64802','36897','95717','23391','68443',
                          '83728','27583','53551','39803','23870',
                          '34727','24956','50972','71040','84873',
                          '93409','97091','59671','74304','80719',
                          '22152','52910','14732','10133','69250',
                          '99870','69113','37188','83278','96654',
                          '20827','98045','77685','46335','34023',
                          '62630','67764','56061','61306','65750',
                          '58269','16496','26373','28983','99964',
                          '73686','16482','38426','76407','17133',
                          '94022','84757','88145','11987','70625',
                          '66427','31250','66929','33646','77928',
                          '52047','76814','50345','53447','37184',
                          '27977','76463','45478','84337','93466',
                          '23329','44806','14989','52180','82101',
                          '10931','78325','83404','89016','35953',
                          '38516','22117','37464','31473','78427',
                          '66104','36938','26191','18166','80907',
                          '71235','92902','63682','27842','99019',
                          '89802','95016','19503','85112','45525',
                          '15169','19112','22288','34887','88991',
                          '68645','49427','31779','40697','97752',
                          '30482','66150','14462','44396','12067',
                          '81616','11896','76665','35252','59000',
                          '30033','60724','84780','59787','67656',
                          '56616','81429','56758','25298','29312',
                          '47155','34314','18540','47446','84870',
                          '77966','98284','36503','68126')
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

