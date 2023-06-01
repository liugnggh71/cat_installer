sqlplus /nolog << EOF
connect DBSNMP/BSW-Adm1n-Pa55#01@10.21.133.36:1521/PS19PRD_PK4_PHX.PVTPPPRODDB02.PHXPVTPPPROD.ORACLEVCN.COM
spool output/PS19PRD.log
@OCI_prod_audit.sql
spool off
EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@apexprod.bhcs.pvt:1521/apxprod
spool output/apexprod.log
@OCI_prod_audit.sql
spool off
EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@apexprod.bhcs.pvt:1521/msapp
spool output/msapp.log
@OCI_prod_audit.sql
spool off
EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@bswcloud01.bhcs.pvt:1521/entomscc
spool output/entomscc.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@bswmpadb1pr.bhcs.pvt:1521/pdsprod
spool output/pdsprod.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@cenbbdonordb.sw.org:1521/pstr
spool output/pstr.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@cenrman:1521/cenrman
spool output/cenrman.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@claimsxtenprd.bhcs.pvt:1521/clmxprod
spool output/clmxprd.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@edwprd.bhcs.pvt:1521/bdwprod
spool output/bdwprod.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@edwprd.bhcs.pvt:1521/cogprod
spool output/cogprod.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@edwprd.bhcs.pvt:1521/dsrprod
spool output/dsrprod.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@edwprd.bhcs.pvt:1521/infaprod
spool output/infaprod.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@edwprd.bhcs.pvt:1521/iwsprod
spool output/iwsprod.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@edwprd.bhcs.pvt:1521/rdmprod
spool output/rdmprod.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@edwprd.bhcs.pvt:1521/twsprod
spool output/twsprod.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@hermes.sw.org:1522/dim10prd.hermes.sw.org
spool output/dim10prd.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@hpuaami1.sw.org:1521/aa6db1.hpuaami1.sw.org
spool output/aa6db1.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@hpudami2.sw.org:1521/aarro1.hpuaami1.sw.org
spool output/aa6ro1.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@hpuaami1.sw.org:1521/appworx1
spool output/appworx1.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@idmdbprod.bhcs.pvt:1521/idmprd
spool output/idmprd.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@lawprddb.bhcs.pvt:1521/logenp
spool output/logenp.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@lawprddb.bhcs.pvt:1521/lsfprod
spool output/lsfprod.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@midas.sw.org:1521/midas.sw.org
spool output/midas.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@mstrans01.bhcs.pvt:1521/timdbp1
spool output/timdbp1.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@svtrans01.bhcs.pvt:1521/timdbd1
spool output/timdbp1.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@mstrans02.bhcs.pvt:1521/ltrdbp1
spool output/ltrdbp1.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@provationprod.sw.org:1521/cmore
spool output/cmore.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@provdb1srv.bhcs.pvt:1521/provbhcs
spool output/provbhcs.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@provdb1srv.bhcs.pvt:1521/provmobp
spool output/provmobp.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@safetracedb.bhcs.pvt:1521/txpr
spool output/txpr.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@bhdaseclog01.bhcs.pvt:1521/etm
spool output/etm.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@ntxcloudctl.sw.org:1521/cloudctl
spool output/cloudctl.log
@OCI_prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect dbsnmp/BSW-Adm1n-Pa55#01@EMPIDBP.bhcs.pvt:1521/empi10pd
spool output/empi10pd.log
@OCI_prod_audit.sql
spool off

EOF
