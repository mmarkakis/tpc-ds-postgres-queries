
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
                          '94286','51186','92863','58699','25490','12652',
                          '46834','26174','25697','34247','86610',
                          '26564','55192','37879','92920','24166',
                          '89834','30255','17250','23787','37446',
                          '48581','39178','45881','15590','55870',
                          '41560','61788','29539','35989','16660',
                          '18691','61363','45317','40787','29777',
                          '20225','52259','13093','12203','29062',
                          '83505','79528','48153','98288','63614',
                          '65187','75985','26390','94795','88816',
                          '89291','88967','97320','49798','38036',
                          '13530','60755','12977','27131','73462',
                          '76344','67164','54336','33605','10078',
                          '99245','46640','54386','42178','31062',
                          '53482','12219','45128','84399','69299',
                          '81105','59631','78866','61729','42282',
                          '96805','85715','50753','85168','52358',
                          '38311','96922','59359','96635','63429',
                          '80229','28515','58113','29365','16822',
                          '75732','26092','44300','63645','90888',
                          '43699','66518','92886','39517','44425',
                          '47763','11116','21848','55347','14980',
                          '13790','95677','64304','95654','28971',
                          '10799','85046','89548','77591','24126',
                          '20321','99807','15970','38013','37200',
                          '33522','63290','46278','54636','55707',
                          '81216','53732','85038','25668','16080',
                          '20039','68949','33749','41927','34762',
                          '20106','73118','29654','15746','75140',
                          '23669','25686','54836','17419','78511',
                          '45644','28965','95853','16583','97267',
                          '84967','95257','27544','27844','12285',
                          '99076','25876','89695','19335','69639',
                          '25211','48070','32285','86086','85633',
                          '57113','86967','86512','47210','57999',
                          '53463','53993','71133','96558','76249',
                          '16250','11424','25808','42522','19825',
                          '75472','90222','80587','95062','56692',
                          '81952','12888','81131','93491','55113',
                          '58770','15212','39692','19616','46069',
                          '15577','62016','70680','64172','64896',
                          '14585','36307','72828','71270','11010',
                          '38609','30891','45981','96056','95754',
                          '13350','23953','65668','93753','13154',
                          '41003','69729','36483','97410','75583',
                          '73354','47737','88587','24481','39822',
                          '47652','89817','76606','41676','66645',
                          '57839','13534','91338','65958','45358',
                          '15545','94954','75836','88151','21943',
                          '38298','49091','64498','47339','25646',
                          '92057','52136','63327','22571','71267',
                          '72631','45138','59057','61863','21285',
                          '33093','53183','26202','57694','53260',
                          '60399','40371','42778','73074','44810',
                          '75799','36027','73628','30748','33099',
                          '54553','91555','18637','80838','77936',
                          '69105','54187','42149','46827','77255',
                          '16084','86569','47013','74379','11236',
                          '42980','68087','36636','63733','24685',
                          '60378','73495','42896','59599','71933',
                          '42825','27158','50428','29379','87631',
                          '79229','25063','65069','19453','38509',
                          '57866','23295','79022','75866','39271',
                          '63753','70143','91508','39608','56258',
                          '58857','15952','53470','50912','92198',
                          '73696','74988','38975','82156','14669',
                          '25337','56358','31581','74480','69459',
                          '39777','51182','30514','28820','39909',
                          '47880','77201','20494','13710','52919',
                          '93804','19216','10890','11259','27508',
                          '91334','78448','35210','48090','63701',
                          '90932','39223','43802','65100','51237',
                          '27666','44865','17233','85665','67731',
                          '62799','50214','87676','81417','84680',
                          '66089','47951','96442','74240','37411',
                          '87465','72848','64003','36072','31088',
                          '39158','60271','23738','40564','87409',
                          '76045','92108','26244','99120','88684',
                          '58090','96421','32496','39527','98454',
                          '35837','15853','72547','88869')
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
  and d_qoy = 1 and d_year = 2002
  and (substr(s_zip,1,2) = substr(V1.ca_zip,1,2))
 group by s_store_name
 order by s_store_name
 limit 100;


