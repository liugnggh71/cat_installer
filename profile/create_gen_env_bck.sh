cat << 'EOC' > gen_env.sh
if [ $# -lt 1 ]
 then
 echo " "
 echo "USAGE: gen_env.sh Oracle_sid"
 echo " "
 exit 1
fi

cat << EOF > ${1}.env
export ORAENV_ASK=NO
export ORACLE_SID=${1}
export PATH=/usr/local/bin:\${PATH}
. oraenv
EOF
EOC
chmod u+x gen_env.sh
