mkdir -p $HOME/dba_code/dbaascli/diag
cd $HOME/dba_code/dbaascli/diag

echo Creating diag_healthcheck.sh
cat << 'EOC' > diag_healthcheck.sh

echo dbaascli diag healthcheck
dbaascli diag healthcheck


EOC

echo Link SC diag_healthcheck.sh
ln -sf diag_healthcheck.sh SC
chmod u+x diag_healthcheck.sh


echo Creating diag_healthcheck.sh
cat << 'EOC' > diag_healthcheck.sh

echo dbaascli diag collect
dbaascli diag collect


EOC

echo Link SC diag_healthcheck.sh
ln -sf diag_healthcheck.sh SC
chmod u+x diag_healthcheck.sh




echo Creating Uninstall_diagnos_CODES_install.sh
cat << 'EOC' > Uninstall_diagnos_CODES_install.sh
rm ${HOME}/dba_code/CURL/diagnos_CODES_install.sh
cd $HOME/dba_code/dbaascli/diag
unlink SC
rm diag_healthcheck.sh
unlink SC
rm diag_healthcheck.sh
rm Uninstall_diagnos_CODES_install.sh
EOC
chmod 600 Uninstall_diagnos_CODES_install.sh
