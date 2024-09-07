export HOME=/home/container

cd /home/container

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

curl -Ls https://raw.githubusercontent.com/Duck1405/ShadowVM/main/install.sh -o install.sh

chmod +x ./install.sh

sh ./install.sh