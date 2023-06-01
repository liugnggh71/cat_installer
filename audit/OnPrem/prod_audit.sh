sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@apexprod.bhcs.pvt:1521/apxprod
spool apexprod.log
@prod_audit.sql
spool off
EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@apexprod.bhcs.pvt:1521/msapp
spool msapp.log
@prod_audit.sql
spool off
EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@bswcloud01.bhcs.pvt:1521/entomscc
spool entomscc.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@bswmpadb1pr.bhcs.pvt:1521/pdsprod
spool pdsprod.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@cenbbdonordb.sw.org:1521/pstr
spool pstr.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@cenrman:1521/cenrman
spool cenrman.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@claimsxtenprd.bhcs.pvt:1521/clmxprod
spool clmxprd.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@edwprd.bhcs.pvt:1521/bdwprod
spool bdwprod.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@edwprd.bhcs.pvt:1521/cogprod
spool cogprod.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@edwprd.bhcs.pvt:1521/dsrprod
spool dsrprod.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@edwprd.bhcs.pvt:1521/infaprod
spool infaprod.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@edwprd.bhcs.pvt:1521/iwsprod
spool iwsprod.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@edwprd.bhcs.pvt:1521/rdmprod
spool rdmprod.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@edwprd.bhcs.pvt:1521/twsprod
spool twsprod.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@hermes.sw.org:1522/dim10prd.hermes.sw.org
spool dim10prd.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@hpuaami1.sw.org:1521/aa6db1.hpuaami1.sw.org
spool aa6db1.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@hpudami2.sw.org:1521/aarro1.hpuaami1.sw.org
spool aa6ro1.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@hpuaami1.sw.org:1521/appworx1
spool appworx1.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@idmdbprod.bhcs.pvt:1521/idmprd
spool idmprd.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@lawprddb.bhcs.pvt:1521/logenp
spool logenp.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@lawprddb.bhcs.pvt:1521/lsfprod
spool lsfprod.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@midas.sw.org:1521/midas.sw.org
spool midas.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@mstrans01.bhcs.pvt:1521/timdbp1
spool timdbp1.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@svtrans01.bhcs.pvt:1521/timdbd1
spool timdbp1.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@mstrans02.bhcs.pvt:1521/ltrdbp1
spool ltrdbp1.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@provationprod.sw.org:1521/cmore
spool cmore.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@provdb1srv.bhcs.pvt:1521/provbhcs
spool provbhcs.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@provdb1srv.bhcs.pvt:1521/provmobp
spool provmobp.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@safetracedb.bhcs.pvt:1521/txpr
spool txpr.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@bhdaseclog01.bhcs.pvt:1521/etm
spool etm.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@ntxcloudctl.sw.org:1521/cloudctl
spool cloudctl.log
@prod_audit.sql
spool off

EOF

sqlplus /nolog << EOF
connect RO_CC/H0tsummerd2y**@EMPIDBP.bhcs.pvt:1521/empi10pd
spool empi10pd.log
@prod_audit.sql
spool off

EOF