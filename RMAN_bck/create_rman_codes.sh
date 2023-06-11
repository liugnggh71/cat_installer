mkdir -p $HOME/dba_code/dbaascli/admin
cd $HOME/dba_code/dbaascli/admin

echo Creating arch_bck.sh
cat << 'EOC' > arch_bck.sh
nohup rman << EOF &
connect target
SET ECHO ON
backup archivelog all not backed up;
backup archivelog all delete all input;
backup spfile;
backup current controlfile;
crosscheck archivelog all;
delete force noprompt expired archivelog all;
delete noprompt obsolete;
delete force noprompt backup completed before "sysdate-100";
EOF

EOC

echo Link A arch_bck.sh
ln -sf arch_bck.sh A
chmod u+x arch_bck.sh


echo Creating full_db_bck.sh
cat << 'EOC' > full_db_bck.sh
nohup rman << EOF &
connect target
SET ECHO ON
backup database;
EOF

EOC

echo Link B full_db_bck.sh
ln -sf full_db_bck.sh B
chmod u+x full_db_bck.sh


echo Creating list_file_1_backup.sh
cat << 'EOC' > list_file_1_backup.sh
rman << EOF
connect target
list backup of datafile 1 summary;
EOF

EOC

echo Link F1 list_file_1_backup.sh
ln -sf list_file_1_backup.sh F1
chmod u+x list_file_1_backup.sh


echo Creating level_0.sh
cat << 'EOC' > level_0.sh
nohup rman << EOF &
connect target
SET ECHO ON
backup incremental level 0 database;
EOF

EOC

echo Link L0 level_0.sh
ln -sf level_0.sh L0
chmod u+x level_0.sh


echo Creating level_1.sh
cat << 'EOC' > level_1.sh
nohup rman << EOF &
connect target
SET ECHO ON
backup incremental level 1 database;
EOF

EOC

echo Link L1 level_1.sh
ln -sf level_1.sh L1
chmod u+x level_1.sh


echo Creating makeup_L0.sh
cat << 'EOC' > makeup_L0.sh
if [ $# -lt 2 ]
then
echo " "
echo "USAGE: makeup_L0.sh env_name wait_hour"
echo "example: makeup_L0.sh PRD 5"
echo " "
exit 1
fi

cat << EOG
nohup sh << EOF &
. \${HOME}/${1}.env
sleep \$((${2}*3600))
cd /home/oracle/dba_code/RMAN
/home/oracle/dba_code/RMAN/level_0.sh
# /home/oracle/dba_code/RMAN/level_1.sh
# /home/oracle/dba_code/RMAN/full_db_bck.sh
EOF
EOG

EOC

echo Link M0 makeup_L0.sh
ln -sf makeup_L0.sh M0
chmod u+x makeup_L0.sh


echo Creating list_RMAN_BCK_jobs.sh
cat << 'EOC' > list_RMAN_BCK_jobs.sh
sqlplus / as sysdba << 'EOF'
SET LINESIZE 160
SET PAGESIZE 60
column SESSION_KEY format 9999999999999
column INPUT_TYPE format A16
column START_TIME format A17
column END_TIME format A17
column TIME_TAKEN_DISPLAY format A21
column INPUT_BYTES_DISPLAY format A21
column OUTPUT_BYTES_DISPLAY format A21

select
 SESSION_KEY, INPUT_TYPE, STATUS,
 to_char(START_TIME,'mm/dd/yy hh24:mi') start_time,
 to_char(END_TIME,'mm/dd/yy hh24:mi')   end_time,
 TIME_TAKEN_DISPLAY,
 INPUT_BYTES_DISPLAY,
 OUTPUT_BYTES_DISPLAY
 from V$RMAN_BACKUP_JOB_DETAILS
 WHERE INPUT_TYPE not LIKE '%AR%'
 order by session_key;
EOF


EOC

echo Link J1 list_RMAN_BCK_jobs.sh
ln -sf list_RMAN_BCK_jobs.sh J1
chmod u+x list_RMAN_BCK_jobs.sh




echo Creating Uninstall_create_rman_codes.sh
cat << 'EOC' > Uninstall_create_rman_codes.sh
rm ${HOME}/dba_code/CURL/create_rman_codes.sh
cd $HOME/dba_code/dbaascli/admin
unlink A
rm arch_bck.sh
unlink B
rm full_db_bck.sh
unlink F1
rm list_file_1_backup.sh
unlink L0
rm level_0.sh
unlink L1
rm level_1.sh
unlink M0
rm makeup_L0.sh
unlink J1
rm list_RMAN_BCK_jobs.sh
rm Uninstall_create_rman_codes.sh
EOC
chmod 600 Uninstall_create_rman_codes.sh
