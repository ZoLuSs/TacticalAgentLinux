#!/bin/bash

if [[ $1 == "" ]]; then
        echo "First argument is empty !"
        echo "It can be amd64 or armv6"
        exit 1
fi

if [[ $1 != "amd64" && $1 != "armv6" ]]; then
        echo "This argument can only be 'amd64' 'armv6' !"
        echo "Type help for more information"
        exit 1
fi

agentAmd64='https://github.com/ZoLuSs/TacticalAgentLinux/raw/main/agent/2.4.0/tactial-agent-2_4_0-amd64'
agentArmv6='https://github.com/ZoLuSs/TacticalAgentLinux/raw/main/agent/2.3.1/tactial-agent-2_4_0-armv6'

case $1 in
amd64)
        agentDL=$agentAmd64;;
armv6)
        agentDL=$agentArmv6;;
esac

wget -O /tmp/temp_rmmagent $agentDL

systemctl stop tacticalagent

cp /tmp/temp_rmmagent /usr/local/bin/rmmagent
rm /tmp/temp_rmmagent

systemctl start tacticalagent

echo "Tactical Agent Update is done"
