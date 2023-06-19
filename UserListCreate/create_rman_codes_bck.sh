# Create dir and go their
mkdir -p /home/oracle/dba_code/RMAN
cd /home/oracle/dba_code/RMAN


# A
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
chmod u+x arch_bck.sh
ln -s arch_bck.sh A

# B
cat << 'EOC' > full_db_bck.sh
nohup rman << EOF &
connect target
SET ECHO ON
backup database;
EOF
EOC
chmod u+x full_db_bck.sh
ln -s full_db_bck.sh B

# F1

cat << EOC > list_file_1_backup.sh
rman << EOF
connect target
list backup of datafile 1 summary;
EOF
EOC
chmod u+x list_file_1_backup.sh
ln -s list_file_1_backup.sh F1

# L0
cat << 'EOC' > level_0.sh
nohup rman << EOF &
connect target
SET ECHO ON
backup incremental level 0 database;
EOF
EOC
chmod u+x level_0.sh
ln -s level_0.sh L0

# L1

cat << 'EOC' > level_1.sh
nohup rman << EOF &
connect target
SET ECHO ON
backup incremental level 1 database;
EOF
EOC
chmod u+x level_1.sh
ln -s level_1.sh L1

# M0

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
chmod u+x makeup_L0.sh
ln -s makeup_L0.sh M0

# J1
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
chmod u+x list_RMAN_BCK_jobs.sh
ln -s list_RMAN_BCK_jobs.sh J1
