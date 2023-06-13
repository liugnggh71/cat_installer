mkdir -p $HOME/dba_code/OEM_agent
cd $HOME/dba_code/OEM_agent

echo Creating Status_OEM_agent.sh
cat << 'EOC' > Status_OEM_agent.sh

EMHOME=$(emctl getemhome | grep EMHOME | cut -d= -f2) 
EMUSER=$(emctl status agent | grep "Started by user" | awk '{print $NF}')

echo 0,15,30,45 \* \* \* \* su ${EMUSER} -c \"${EMHOME}/bin/emctl start agent\"
echo 0,15,30,45 \* \* \* \* ${EMHOME}/bin/emctl start agent

echo emctl start agent
emctl start agent        

EOC

echo Link S1 Status_OEM_agent.sh
ln -sf Status_OEM_agent.sh S1
chmod u+x Status_OEM_agent.sh


echo Creating start_OEM_agent.sh
cat << 'EOC' > start_OEM_agent.sh

echo emctl status agent        
emctl status agent        

EOC

echo Link S start_OEM_agent.sh
ln -sf start_OEM_agent.sh S
chmod u+x start_OEM_agent.sh




echo Creating Uninstall_create_OEM_agent_codes.sh
cat << 'EOC' > Uninstall_create_OEM_agent_codes.sh
rm ${HOME}/dba_code/CURL/create_OEM_agent_codes.sh
cd $HOME/dba_code/OEM_agent
unlink S1
rm Status_OEM_agent.sh
unlink S
rm start_OEM_agent.sh
rm Uninstall_create_OEM_agent_codes.sh
EOC
chmod 600 Uninstall_create_OEM_agent_codes.sh
