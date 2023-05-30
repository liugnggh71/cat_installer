if [ $# -lt 1 ]
 then
 echo " "
 echo "USAGE: create_gen_env.sh Oracle_sid"
 echo " "
 exit 1
fi

cat << 'EOC' > gen_env.sh
cat << EOF > ${1}.env
export ORAENV_ASK=NO
export ORACLE_SID=${1}
. oraenv
EOF
EOC
chmod u+x gen_env.sh
