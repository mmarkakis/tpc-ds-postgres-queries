
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
                          '76359','79482','67746','72412','80057','30873',
                          '65464','91029','70446','34814','45658',
                          '68780','18775','24852','67368','38318',
                          '11998','35860','75765','57625','85065',
                          '85227','80027','35195','66835','83226',
                          '32150','13839','74884','65188','70196',
                          '55852','94445','96875','26757','62694',
                          '77334','94004','30930','93585','24308',
                          '83612','91637','78389','56143','15069',
                          '98684','63001','74515','61339','99934',
                          '52202','53936','28008','22990','56491',
                          '94273','50714','84277','20103','75619',
                          '79049','70155','37041','38847','15478',
                          '92055','80145','93012','73003','82649',
                          '71205','23100','38798','79476','76061',
                          '75878','16985','21112','42364','21980',
                          '26254','98744','22090','13245','51437',
                          '43679','81105','53359','69201','56665',
                          '20244','74241','45681','11737','99655',
                          '47429','76926','88842','80756','11093',
                          '30215','90513','10866','42629','90144',
                          '29897','37123','41268','86469','40844',
                          '24622','65122','71477','68069','97586',
                          '38366','32893','66398','87870','91656',
                          '87306','53372','23719','43401','42502',
                          '40221','65627','61611','44520','88274',
                          '30108','64452','21502','38008','62551',
                          '48724','84112','97431','19972','17487',
                          '90884','96600','19735','22409','58765',
                          '83766','21710','58929','10114','12572',
                          '31797','29890','94215','47165','11884',
                          '49215','15576','26907','74449','27416',
                          '99396','75283','89518','61919','85324',
                          '26214','86330','38247','84228','58355',
                          '24660','56836','57221','20415','90924',
                          '84087','53871','43982','11724','85564',
                          '59519','69975','32826','91706','41866',
                          '46377','86684','50513','34184','48470',
                          '23865','28063','63468','36899','76415',
                          '34894','25166','51758','79287','51632',
                          '32159','46556','46484','63573','50559',
                          '25242','69137','98638','75045','83747',
                          '83763','48090','99274','27571','15119',
                          '92863','66121','16665','74306','16074',
                          '44466','10439','37663','47594','56696',
                          '82809','75732','57283','93736','27759',
                          '57790','69524','66247','90715','31524',
                          '67130','57847','16737','27140','28676',
                          '35393','72663','79341','84371','25689',
                          '30376','68198','98137','72622','75888',
                          '79892','40403','50868','87084','77662',
                          '95937','23591','58843','93918','65810',
                          '16613','68519','98992','14218','98629',
                          '45699','97121','74143','36522','88889',
                          '21471','17376','75633','77305','49160',
                          '12545','22615','22617','84435','51591',
                          '85148','47832','40675','38394','31450',
                          '70607','20066','87721','21788','11910',
                          '51519','20869','78340','84656','82602',
                          '25837','59103','98507','23185','30421',
                          '88238','46271','83785','42743','10414',
                          '61443','47129','73277','58794','88194',
                          '76014','26356','81974','86679','46511',
                          '40142','61742','38722','50923','32870',
                          '85466','16925','53514','19833','99669',
                          '77891','43606','95374','82550','55822',
                          '51524','68331','11391','27449','25278',
                          '37860','63050','48681','18901','78677',
                          '65370','78724','73934','32604','64116',
                          '23733','73138','46630','83135','80262',
                          '21397','69375','76212','67492','47316',
                          '51113','29563','18482','63038','60544',
                          '92087','72031','97974','77987','69680',
                          '64670','55190','59265','29636','26931',
                          '77208','33416','61430','98491','74459',
                          '11342','95011','66089','81436','86431',
                          '12950','24121','25741','69596','72468',
                          '62537','40916','22056','31481','11755',
                          '59780','10244','51220','91197','28648',
                          '13665','79274','83951','53589')
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
  and d_qoy = 1 and d_year = 2001
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;

