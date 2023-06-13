mkdir -p $HOME
cd $HOME

echo Creating gen_env.sh
cat << 'EOC' > gen_env.sh
if [ $# -lt 1 ]
then
echo " "
echo "Purpose: create ${ORACLE_SID}.env "
echo "USAGE: gen_env.sh Oracle_sid"
echo "Parameter 1 need to match /etc/oratab entry exactly"
echo " "
cat /etc/oratab | grep -v ^#
exit 1
fi

cat << EOF > ${1}.env
export ORAENV_ASK=NO
export ORACLE_SID=${1}
export PATH=/usr/local/bin:\${PATH}
. oraenv
EOF

EOC

echo Link Ev gen_env.sh
ln -sf gen_env.sh Ev
chmod u+x gen_env.sh


echo Creating add_dba_code_env_path.sh
cat << 'EOC' > add_dba_code_env_path.sh
if [ $# -lt 1 ]
then
echo " "
echo "Purpose: Add ${HOME}/dba_code/bin to PATH env"
echo "USAGE: add_dba_code_env_path.sh FILE_NAME"
echo " "
exit 1
fi

cat << 'EOF' >> $1
export PATH=$HOME/dba_code/bin:${PATH}
EOF
EOC

echo Link P1 add_dba_code_env_path.sh
ln -sf add_dba_code_env_path.sh P1
chmod u+x add_dba_code_env_path.sh


echo Creating create_CLASS_PATH_env.sh
cat << 'EOC' > create_CLASS_PATH_env.sh
if [ $# -lt 1 ]
then
echo " "
echo "Purpose: Add CLASSPATH of saxon_he_stable.jar"
echo "USAGE: create_CLASS_PATH_env.sh FILE_NAME"
echo " "
exit 1
fi

cat << 'EOF' >> $1
export CLASSPATH=${HOME}/dba_code/bin/saxon_he_stable.jar
EOF
EOC

echo Link P2 create_CLASS_PATH_env.sh
ln -sf create_CLASS_PATH_env.sh P2
chmod u+x create_CLASS_PATH_env.sh


echo Creating create_TZ_env.sh
cat << 'EOC' > create_TZ_env.sh
if [ $# -lt 1 ]
then
echo " "
echo "Purpose: Set TZ to America/Chicago"
echo "USAGE: create_TZ_env.sh FILE_NAME"
echo " "
exit 1
fi

cat << 'EOF' >> $1
TZ='America/Chicago'; export TZ
EOF
EOC

echo Link P3 create_TZ_env.sh
ln -sf create_TZ_env.sh P3
chmod u+x create_TZ_env.sh


echo Creating add_AIX_java_path.sh
cat << 'EOC' > add_AIX_java_path.sh

OSTYPE=$(uname)

if [[ "$OSTYPE" == "AIX"* ]]; then
  JAVA=$(find /*/app/oracle/agent*/*/jdk/bin/ -name java -type f | tail -n 1)
  cd ${HOME}/dba_code/bin
  ln -fs ${JAVA} java
fi
which java
java -version

EOC

echo Link P4 add_AIX_java_path.sh
ln -sf add_AIX_java_path.sh P4
chmod u+x add_AIX_java_path.sh


echo Creating create_AIX_zip_unzip.sh
cat << 'EOC' > create_AIX_zip_unzip.sh
OSTYPE=$(uname)

if [[ "$OSTYPE" == "AIX"* ]]; then
  UNZIP=$(find /*/app/oracle/agent*/*/bin -type f -name unzip|tail -n 1)
  ZIP=$(find /*/app/oracle/agent*/*/bin -type f -name zip|tail -n 1)
  cd ${HOME}/dba_code/bin
  ln -s ${UNZIP} unzip  
  ln -s ${ZIP} zip  
fi
EOC

echo Link Cz create_AIX_zip_unzip.sh
ln -sf create_AIX_zip_unzip.sh Cz
chmod u+x create_AIX_zip_unzip.sh


echo Creating add_OEM_link.sh
cat << 'EOC' > add_OEM_link.sh


EMCTL=$(find /*/app/oracle/*/agent_13.5.0.0.0/bin -type f -name emctl)
cd ${HOME}/dba_code/bin
ln -fs ${EMCTL} emctl

which emctl
emctl status agent

EOC

echo Link P5 add_OEM_link.sh
ln -sf add_OEM_link.sh P5
chmod u+x add_OEM_link.sh




echo Creating Uninstall_create_gen_env.sh
cat << 'EOC' > Uninstall_create_gen_env.sh
rm ${HOME}/dba_code/CURL/create_gen_env.sh
cd $HOME
unlink Ev
rm gen_env.sh
unlink P1
rm add_dba_code_env_path.sh
unlink P2
rm create_CLASS_PATH_env.sh
unlink P3
rm create_TZ_env.sh
unlink P4
rm add_AIX_java_path.sh
unlink Cz
rm create_AIX_zip_unzip.sh
unlink P5
rm add_OEM_link.sh
rm Uninstall_create_gen_env.sh
EOC
chmod 600 Uninstall_create_gen_env.sh
