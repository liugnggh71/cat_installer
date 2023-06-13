mkdir -p $HOME/dba_code/dbaascli/database
cd $HOME/dba_code/dbaascli/database

echo Creating save_backup_config.sh
cat << 'EOC' > save_backup_config.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo ORACLE_DATABASE: ${ORACLE_DATABASE}
RMAN_CONFIG=$(dbaascli database backup --dbname ${ORACLE_DATABASE} --getConfig | grep created | awk '{print $2}')
echo RMAN_CONFIG: ${RMAN_CONFIG}
mkdir -p config_files
echo Copy file: ${ORACLE_DATABASE}.cfg
cp -p ${RMAN_CONFIG} config_files/${ORACLE_DATABASE}.cfg

cat << 'EOD'
a. Add "bkup_oss=yes" if it does not exist. Or modify "bkup_oss" to "yes" if it exists.
b. If incremental backups are to be scheduled, change "bkup_cron_entry" to "yes".
c. Remove line "archivelogBackup=false", if it exists.
EOD

echo dbaascli database backup --dbname ${ORACLE_DATABASE} --getConfig
echo dbaascli database backup --dbname ${ORACLE_DATABASE}  --configure --configFile config_files/${ORACLE_DATABASE}.cfg
echo dbaascli database backup --dbname ${ORACLE_DATABASE} --status --uuid UUID generated in config steps


EOC

echo Link SC save_backup_config.sh
ln -sf save_backup_config.sh SC
chmod u+x save_backup_config.sh


echo Creating Verify_wallet.sh
cat << 'EOC' > Verify_wallet.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database verifyWallet --dbname ${ORACLE_DATABASE}
echo ==========================================================
dbaascli database verifyWallet --dbname ${ORACLE_DATABASE}

EOC

echo Link VW Verify_wallet.sh
ln -sf Verify_wallet.sh VW
chmod u+x Verify_wallet.sh


echo Creating getDetails.sh
cat << 'EOC' > getDetails.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database getDetails --dbname ${ORACLE_DATABASE}
echo ==========================================================
dbaascli database getDetails --dbname ${ORACLE_DATABASE}


EOC

echo Link GD getDetails.sh
ln -sf getDetails.sh GD
chmod u+x getDetails.sh


echo Creating getPDBs.sh
cat << 'EOC' > getPDBs.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database getPDBs --dbname ${ORACLE_DATABASE}
echo ==========================================================
dbaascli database getPDBs --dbname ${ORACLE_DATABASE}


EOC

echo Link PD getPDBs.sh
ln -sf getPDBs.sh PD
chmod u+x getPDBs.sh


echo Creating List_0.sh
cat << 'EOC' > List_0.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database backup --dbname ${ORACLE_DATABASE} --list --backupType REGULAR-L0
echo ============================================================================================
dbaascli database backup --dbname ${ORACLE_DATABASE} --list --backupType REGULAR-L0


EOC

echo Link L0 List_0.sh
ln -sf List_0.sh L0
chmod u+x List_0.sh


echo Creating List_1.sh
cat << 'EOC' > List_1.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database backup --dbname ${ORACLE_DATABASE} --list --backupType REGULAR-L1
echo ============================================================================================
dbaascli database backup --dbname ${ORACLE_DATABASE} --list --backupType REGULAR-L1


EOC

echo Link L1 List_1.sh
ln -sf List_1.sh L1
chmod u+x List_1.sh


echo Creating List_ARCHIVELOG.sh
cat << 'EOC' > List_ARCHIVELOG.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database backup --dbname ${ORACLE_DATABASE} --list --backupType ARCHIVELOG
echo ============================================================================================
dbaascli database backup --dbname ${ORACLE_DATABASE} --list --backupType ARCHIVELOG


EOC

echo Link LA List_ARCHIVELOG.sh
ln -sf List_ARCHIVELOG.sh LA
chmod u+x List_ARCHIVELOG.sh


echo Creating List.sh
cat << 'EOC' > List.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database backup --dbname ${ORACLE_DATABASE} --list
echo ============================================================================================
dbaascli database backup --dbname ${ORACLE_DATABASE} --list


EOC

echo Link L List.sh
ln -sf List.sh L
chmod u+x List.sh


echo Creating showHistory.sh
cat << 'EOC' > showHistory.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database backup --dbname ${ORACLE_DATABASE} --showHistory
echo ============================================================================================
dbaascli database backup --dbname ${ORACLE_DATABASE} --showHistory


EOC

echo Link SH showHistory.sh
ln -sf showHistory.sh SH
chmod u+x showHistory.sh


echo Creating List.sh
cat << 'EOC' > List.sh

cat << 'EOF'
Simple no parameter files:
===========================
getDetails
getPDBs
list
list REGULAR-L0
list REGULAR-L1
Save_config
showHistory
Verify_wallet



EOF


EOC

echo Link L List.sh
ln -sf List.sh L
chmod u+x List.sh


echo Creating Backup_0.sh
cat << 'EOC' > Backup_0.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database backup --dbname ${ORACLE_DATABASE} --list --start --level0
echo ============================================================================================
dbaascli database backup --dbname ${ORACLE_DATABASE} --start --level0


EOC

echo Link B0 Backup_0.sh
ln -sf Backup_0.sh B0
chmod u+x Backup_0.sh


echo Creating Backup_1.sh
cat << 'EOC' > Backup_1.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database backup --dbname ${ORACLE_DATABASE} --list --start --level1
echo ============================================================================================
dbaascli database backup --dbname ${ORACLE_DATABASE} --start --level1


EOC

echo Link B1 Backup_1.sh
ln -sf Backup_1.sh B1
chmod u+x Backup_1.sh


echo Creating Backup_archivelog.sh
cat << 'EOC' > Backup_archivelog.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo dbaascli database backup --dbname ${ORACLE_DATABASE} --list --start --archivelog
echo ============================================================================================
dbaascli database backup --dbname ${ORACLE_DATABASE} --start --archivelog


EOC

echo Link BA Backup_archivelog.sh
ln -sf Backup_archivelog.sh BA
chmod u+x Backup_archivelog.sh




echo Creating Uninstall_database_operation_CODES_install.sh
cat << 'EOC' > Uninstall_database_operation_CODES_install.sh
rm ${HOME}/dba_code/CURL/database_operation_CODES_install.sh
cd $HOME/dba_code/dbaascli/database
unlink SC
rm save_backup_config.sh
unlink VW
rm Verify_wallet.sh
unlink GD
rm getDetails.sh
unlink PD
rm getPDBs.sh
unlink L0
rm List_0.sh
unlink L1
rm List_1.sh
unlink LA
rm List_ARCHIVELOG.sh
unlink L
rm List.sh
unlink SH
rm showHistory.sh
unlink L
rm List.sh
unlink B0
rm Backup_0.sh
unlink B1
rm Backup_1.sh
unlink BA
rm Backup_archivelog.sh
rm Uninstall_database_operation_CODES_install.sh
EOC
chmod 600 Uninstall_database_operation_CODES_install.sh
