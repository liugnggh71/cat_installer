mkdir -p $HOME/dba_code/dbaascli/admin
cd $HOME/dba_code/dbaascli/admin

echo Creating list_admin_stack.sh
cat << 'EOC' > list_admin_stack.sh
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 'Running: rpm -qa |grep dbaas'
rpm -qa |grep dbaas
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 'Running: dbaascli --version'
dbaascli --version
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 'Running: dbaascli admin showLatestStackVersion'
dbaascli admin showLatestStackVersion
EOC

echo Link L list_admin_stack.sh
ln -sf list_admin_stack.sh L
chmod u+x list_admin_stack.sh


echo Creating patch_admin_stack.sh
cat << 'EOC' > patch_admin_stack.sh
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 'Running: rpm -qa |grep dbaas'
rpm -qa |grep dbaas
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 'Running: dbaascli admin showLatestStackVersion'
dbaascli admin showLatestStackVersion
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 'Running: dbaascli admin updateStack --version LATEST'
dbaascli admin updateStack --version LATEST
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 'Running: rpm -qa |grep dbaas'
rpm -qa |grep dbaas
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo 'Running: dbaascli admin showLatestStackVersion'
dbaascli admin showLatestStackVersion
# dbaascli patch tools list


EOC

echo Link P patch_admin_stack.sh
ln -sf patch_admin_stack.sh P
chmod u+x patch_admin_stack.sh


echo Creating Bounce.sh
cat << 'EOC' > Bounce.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo ====================================================
echo dbaascli database bounce --dbname ${ORACLE_DATABASE}
echo ====================================================


EOC

echo Link Bo Bounce.sh
ln -sf Bounce.sh Bo
chmod u+x Bounce.sh


echo Creating Status.sh
cat << 'EOC' > Status.sh
ORACLE_DATABASE=${ORACLE_SID::-1}
echo ====================================================
echo dbaascli database status --dbname ${ORACLE_DATABASE}
dbaascli database status --dbname ${ORACLE_DATABASE}


EOC

echo Link S Status.sh
ln -sf Status.sh S
chmod u+x Status.sh




echo Creating Uninstall_patch_admin_stack_install.sh
cat << 'EOC' > Uninstall_patch_admin_stack_install.sh
rm ${HOME}/dba_code/CURL/patch_admin_stack_install.sh
cd $HOME/dba_code/dbaascli/admin
unlink L
rm list_admin_stack.sh
unlink P
rm patch_admin_stack.sh
unlink Bo
rm Bounce.sh
unlink S
rm Status.sh
rm Uninstall_patch_admin_stack_install.sh
EOC
chmod 600 Uninstall_patch_admin_stack_install.sh
