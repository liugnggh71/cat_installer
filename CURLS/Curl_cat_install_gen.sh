# Create and Go to dba CURL directory
echo Create and Go to dba CURL directory

mkdir -p $HOME/dba_code/CURL
cd $HOME/dba_code/CURL

# C00 CURL_Curl_cat_install.sh

echo C00 CURL_Curl_cat_install.sh

cat << 'EOC' > CURL_Curl_cat_install.sh
echo Download Curl_cat_install.sh
curl -L https://objectstorage.us-ashburn-1.oraclecloud.com/p/\
u-fbd97YEAbH-2M2n2oBb7IlP8LAuNJSPucUSXfPc3Cn90UBxjJILAPFVYSM3Lbd\
/n/bswhealth/b/RMAN_PSFT_NP/o/Curl_cat_install.sh\
 -o Curl_cat_install.sh
chmod u+x Curl_cat_install.sh
ln -sf Curl_cat_install.sh I00
EOC

chmod u+x CURL_Curl_cat_install.sh
ln -sf CURL_Curl_cat_install.sh C00

# C01 CURL_lll_X_install.sh

echo C01 CURL_lll_X_install.sh

cat << 'EOC' > CURL_lll_X_install.sh
echo Download lll_X_install.sh
curl -L https://objectstorage.us-ashburn-1.oraclecloud.com/p/\
KbW6B7W5EOQuEn16EnCPJB4H8Ko0IyUZeOZQ0xMYHG38SVlrrkXLhEdEN5oMGGIs\
/n/bswhealth/b/RMAN_PSFT_NP/o/lll_X_install.sh\
 -o lll_X_install.sh
chmod u+x lll_X_install.sh
ln -sf lll_X_install.sh I01
EOC

chmod u+x CURL_lll_X_install.sh
ln -sf CURL_lll_X_install.sh C01

# C02 CURL_create_gen_env.sh

echo C02 CURL_create_gen_env.sh

cat << 'EOC' > CURL_create_gen_env.sh
echo Download create_gen_env.sh
curl -L https://objectstorage.us-ashburn-1.oraclecloud.com/p/\
7pmybqkHELHBCjk72Bz_iBYOsRmu1qAdxYmMLnqyFPVPMZeNQ24Ruk5gKlcYIoPT\
/n/bswhealth/b/RMAN_PSFT_NP/o/create_gen_env.sh\
 -o create_gen_env.sh
chmod u+x create_gen_env.sh
ln -sf create_gen_env.sh I02
EOC

chmod u+x CURL_create_gen_env.sh
ln -sf CURL_create_gen_env.sh C02

# C03 CURL_create_rman_codes.sh

echo C03 CURL_create_rman_codes.sh

cat << 'EOC' > CURL_create_rman_codes.sh
echo Download create_rman_codes.sh
curl -L https://objectstorage.us-ashburn-1.oraclecloud.com/p/\
_zqApqAQvuJzFSZHf2ZMbEsOd6slNlu5LDg9mxSjrKDuxnb-ebZq8AP-deUhw8b7\
/n/bswhealth/b/RMAN_PSFT_NP/o/create_rman_codes.sh\
 -o create_rman_codes.sh
chmod u+x create_rman_codes.sh
ln -sf create_rman_codes.sh I03
EOC

chmod u+x CURL_create_rman_codes.sh
ln -sf CURL_create_rman_codes.sh C03

# C30 CURL_patch_admin_stack_install.sh

echo C30 CURL_patch_admin_stack_install.sh

cat << 'EOC' > CURL_patch_admin_stack_install.sh
echo Download patch_admin_stack_install.sh
curl -L https://objectstorage.us-ashburn-1.oraclecloud.com/p/\
B9LYQSwgf25BaCks3FxXdciyfVUrnnUc3vxDJclE61q5v3eB9ZEZgmNlqZzKFSka\
/n/bswhealth/b/RMAN_PSFT_NP/o/patch_admin_stack_install.sh\
 -o patch_admin_stack_install.sh
chmod u+x patch_admin_stack_install.sh
ln -sf patch_admin_stack_install.sh I30
EOC

chmod u+x CURL_patch_admin_stack_install.sh
ln -sf CURL_patch_admin_stack_install.sh C30

