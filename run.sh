#!/bin/sh
PURPLE='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'


DIR=$PWD
if [ "$PWD" = "/root"* ]; then
    DIR="~${PWD#/root}"
fi

printf "\033c"
printf "${YELLOW}________   ____ ____________  ____  __.${NC}"
printf "${YELLOW}\______ \ |    |   \_   ___ \|    |/ _|${NC}"
printf "${YELLOW} |    |  \|    |   /    \  \/|      <  ${NC}"
printf "${YELLOW} |    `   \    |  /\     \___|    |  \ ${NC}"
printf "${YELLOW}/_______  /______/  \______  /____|__ \${NC}"
printf "${YELLOW}        \/                 \/        \/${NC}"
printf "${YELLOW}                                       ${NC}"
printf "                                                                                               \n"
printf "root@shadowvm:${DIR}#                                                                             \n"

run_cmd() {
    read -p "root@shadowvm:$DIR# " CMD
    eval "$CMD"

    # Update DIR after executing command
    DIR=$PWD
    if [ "$PWD" = "/root"* ]; then
        DIR="~${PWD#/root}"
    fi
    
    printf "root@shadowvm:$DIR# \n"
    run_user_cmd
}

run_user_cmd() {
    read -p "user@shadowvm:$DIR# " CMD2
    eval "$CMD2"

    # Update DIR after executing command
    DIR=$PWD
    if [ "$PWD" = "/root"* ]; then
        DIR="~${PWD#/root}"
    fi
    
    printf "root@shadowvm:$DIR# \n"
    run_cmd
}

run_cmd