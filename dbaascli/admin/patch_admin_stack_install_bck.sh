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

echo creating patch_admin_stack.sh
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
