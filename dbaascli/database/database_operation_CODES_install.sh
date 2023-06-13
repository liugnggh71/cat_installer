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
rm Uninstall_database_operation_CODES_install.sh
EOC
chmod 600 Uninstall_database_operation_CODES_install.sh
