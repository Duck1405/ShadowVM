#!/bin/sh
PURPLE='\033[0;35m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

ROOTFS_DIR=/home/container

export PATH=$PATH:~/.local/usr/bin


PROOT_VERSION="5.4.0"

ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
  ARCH_ALT=amd64
elif [ "$ARCH" = "aarch64" ]; then
  ARCH_ALT=arm64
else
  printf "Something went wrong: Error 2340 | CPU Arch: ${ARCH}"
  exit 1
fi

if [ ! -e "$ROOTFS_DIR/.installed" ]; then

  printf "\033c"
  echo "${YELLOW}________   ____ ____________  ____  __.${NC}"
  echo "${YELLOW}\______ \ |    |   \_   ___ \|    |/ _|${NC}"
  echo "${YELLOW} |    |  \|    |   /    \  \/|      <  ${NC}"
  echo "${YELLOW} |    `   \    |  /\     \___|    |  \ ${NC}"
  echo "${YELLOW}/_______  /______/  \______  /____|__ \${NC}"
  echo "${YELLOW}        \/                 \/        \/${NC}"
  echo "${YELLOW}                                       ${NC}"
  echo "${RED}Made By Duck  https://discord.gg/WxP9dfau3d${NC}"  
  echo ""
  echo "${YELLOW}Please pick your image....${NC}"
  echo ""  
  echo "* [1] Debian                                                                                   "
  echo "* [2] Ubuntu                                                                                   "
  echo "* [3] Void Linux                                                                               "
  echo "* [4] Alpine Linux                                                                    "
  echo "* [5] CentOS                                                                                   "
  echo "* [6] Rocky Linux                                                                              "
  echo "* [7] Fedora                                                                                   "
  echo "* [8] AlmaLinux                                                                                "
  echo "* [9] Slackware Linux                                                                          "
  echo "* [10] Kali Linux                                                                              "
  echo "* [11] openSUSE                                                                                "
  echo "* [12] Gentoo Linux                                                                            "
  echo "* [13] Arch Linux                                                                              "
  echo "* [14] Devuan Linux                                                                            "
  echo "                                                                                               "
  echo "${Green}Enter OS (1-14):                                                                 ${NC}"

  read -p "" input

  case $input in

    1)
      echo "* [1] Debian 12"
      echo "* [2] Debian 11"
      echo "* [3] Debian 10"
      echo "* [4] Debian 13"
      echo "* [5] Debian"
      echo "${YELLOW}Enter the desired version (1-5): "
      read -p "" version
      case $version in
        1)
          echo "${GREEN}Installing Debian 12 (bookworm)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/debian/bookworm/${ARCH_ALT}/default/"
        ;;
        2)
          echo "${GREEN}Installing Debian 11 (bullseye)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/debian/bullseye/${ARCH_ALT}/default/"
        ;;
        3)
          echo "${GREEN}Installing Debian 10 (buster)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/debian/buster/${ARCH_ALT}/default/"
        ;;
        4)
          echo "${GREEN}Installing Debian 13 (trixie) (unstable)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/debian/trixie/${ARCH_ALT}/default/"
        ;;
        5)
          echo "${GREEN}Installing (sid) (unstable)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/debian/sid/${ARCH_ALT}/default/"
        ;;
        *)
          echo "${RED}Invalid selection. Exiting.${NC}"
          exit 1
        ;;
      esac

      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    2)
      echo "* [1] Ubuntu 24.04 LTS"
      echo "* [2] Ubuntu 22.04 LTS"
      echo "* [3] Ubuntu 20.04 LTS"
      echo "* [4] Ubuntu 18.04 LTS"
      echo "* [5] Ubuntu 16.04 LTS"
      echo "${YELLOW}Enter the desired version (1-5): "
      read -p "" version
      case $version in
        1)
          echo "${GREEN}Installing Ubuntu 24.04 LTS (noble)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/ubuntu/noble/${ARCH_ALT}/default/"
        ;;
        2)
          echo "${GREEN}Installing Ubuntu 22.04 LTS (jammy)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/ubuntu/jammy/${ARCH_ALT}/default/"
        ;;
        3)
          echo "${GREEN}Installing Ubuntu 20.04 LTS (focal)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/ubuntu/focal/${ARCH_ALT}/default/"
        ;;
        4)
          echo "${GREEN}Installing Ubuntu 18.04 LTS (bionic)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/ubuntu/bionic/${ARCH_ALT}/default/"
        ;;
        5)
          echo "${GREEN}Installing Ubuntu 16.04 LTS (xenial)...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/ubuntu/xenial/${ARCH_ALT}/default/"
        ;;
        *)
          echo "${RED}Invalid selection. Exiting.${NC}"
          exit 1
        ;;
      esac

      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    3)
      echo "${GREEN}Installing Void Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/voidlinux/current/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    4)
      echo "${GREEN}Installing Alpine Linux (Edge)...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/alpine/edge/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    5)
      echo "* [1] CentOS 9 Stream"
      echo "* [2] CentOS 8 Stream"
      echo "* [3] CentOS 7"
      echo "${YELLOW}Enter the desired version (1-3): "
      read -p "" version
      case $version in
        1)
          echo "${GREEN}Installing CentOS 9 Stream...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/centos/9-Stream/${ARCH_ALT}/default/"
        ;;
        2)
          echo "${GREEN}Installing CentOS 8 Stream...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/centos/8-Stream/${ARCH_ALT}/default/"
        ;;
        3)
          echo "${GREEN}Installing CentOS 7...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/centos/7/${ARCH_ALT}/default/"
        ;;
        *)
          echo "${RED}Invalid selection. Exiting.${NC}"
          exit 1
        ;;
      esac

      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    6)
      echo "* [1] Rocky Linux 9"
      echo "* [2] Rocky Linux 8"
      echo "${YELLOW}Enter the desired version (1-2): "
      read -p "" version
      case $version in
        1)
          echo "${GREEN}Installing Rocky Linux 9...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/rockylinux/9/${ARCH_ALT}/default/"
        ;;
        2)
          echo "${GREEN}Installing Rocky Linux 8...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/rockylinux/8/${ARCH_ALT}/default/"
        ;;
        *)
          echo "${RED}Invalid selection. Exiting.${NC}"
          exit 1
        ;;
      esac

      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    7)
      echo "* [1] Fedora 40"
      echo "* [2] Fedora 39"
      echo "* [3] Fedora 38"
      echo "${YELLOW}Enter the desired version (1-3): "
      read -p "" version
      case $version in
        1)
          echo "${GREEN}Installing Fedora 40...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/fedora/40/${ARCH_ALT}/default/"
        ;;
        2)
          echo "${GREEN}Installing Fedora 39...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/fedora/39/${ARCH_ALT}/default/"
        ;;
        3)
          echo "${GREEN}Installing Fedora 38...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/fedora/38/${ARCH_ALT}/default/"
        ;;
        *)
          echo "${RED}Invalid selection. Exiting.${NC}"
          exit 1
        ;;
      esac

      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    8)
      echo "* [1] AlmaLinux 9"
      echo "* [2] AlmaLinux 8"
      echo "${YELLOW}Enter the desired version (1-2): "
      read -p "" version
      case $version in
        1)
          echo "${GREEN}Installing AlmaLinux 9...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/almalinux/9/${ARCH_ALT}/default/"
        ;;
        2)
          echo "${GREEN}Installing AlmaLinux 8...${NC}"
          url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/almalinux/8/${ARCH_ALT}/default/"
        ;;
        *)
          echo "${RED}Invalid selection. Exiting.${NC}"
          exit 1
        ;;
      esac

      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    9)
      echo "${GREEN}Installing Slackware...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/slackware/current/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;


    10)
      echo "${GREEN}Installing Kali Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/kali/current/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    11)
      echo "${GREEN}Installing OpenSUSE Leap...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/opensuse/15.5/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    12)
      echo "${GREEN}Installing Gentoo Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/gentoo/current/${ARCH_ALT}/systemd/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    13)
      echo "${GREEN}Installing Arch Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/archlinux/current/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"

      mkdir $ROOTFS_DIR/home/container/ -p

      # Fixing pacman
      sed -i '/^#RootDir/s/^#//' "$ROOTFS_DIR/etc/pacman.conf"
      sed -i 's|/var/lib/pacman/|/var/lib/pacman|' "$ROOTFS_DIR/etc/pacman.conf"
      sed -i '/^#DBPath/s/^#//' "$ROOTFS_DIR/etc/pacman.conf"
    ;;

    14)
      echo "${GREEN}Installing Devuan Linux...${NC}"
      url="https://fra1lxdmirror01.do.letsbuildthe.cloud/images/devuan/daedalus/${ARCH_ALT}/default/"
      LATEST_VERSION=$(curl -s $url | grep -oP 'href="\K[^"]+/' | sort -r | head -n 1)

      curl -Ls "${url}${LATEST_VERSION}/rootfs.tar.xz" -o $ROOTFS_DIR/rootfs.tar.xz
      tar -xf $ROOTFS_DIR/rootfs.tar.xz -C "$ROOTFS_DIR"
      mkdir $ROOTFS_DIR/home/container/ -p
    ;;

    *)
      echo "${RED}Invalid selection. Exiting.${NC}"
      exit 1
    ;;
  esac
fi

curl -Ls "https://raw.githubusercontent.com/PortKVM/Is-a.KVM/main/run.sh" -o "$ROOTFS_DIR/home/container/run.sh"
chmod +x "$ROOTFS_DIR/home/container/run.sh"

if [ ! -e "$ROOTFS_DIR/.installed" ]; then
    mkdir -p "$ROOTFS_DIR/usr/local/bin"
    curl -Ls "https://github.com/proot-me/proot/releases/download/v${PROOT_VERSION}/proot-v${PROOT_VERSION}-${ARCH}-static" -o "$ROOTFS_DIR/usr/local/bin/proot"
    chmod 755 "$ROOTFS_DIR/usr/local/bin/proot"
fi

if [ ! -e "$ROOTFS_DIR/.installed" ]; then
    printf "nameserver 1.1.1.1\nnameserver 1.0.0.1" > "${ROOTFS_DIR}/etc/resolv.conf"
    rm -rf $ROOTFS_DIR/rootfs.tar.xz /tmp/sbin
    touch "$ROOTFS_DIR/.installed"
fi

port_args=""
while read line; do
    case "$line" in
        internalip=*) ;;
        port[0-9]*=*) port=${line#*=}; if [ -n "$port" ]; then port_args=" -p $port:$port$port_args"; fi;;
        port=*) port=${line#*=}; if [ -n "$port" ]; then port_args=" -p $port:$port$port_args"; fi;;   
    esac
done < "$ROOTFS_DIR/vps.config"

"$ROOTFS_DIR/usr/local/bin/proot" \
--rootfs="${ROOTFS_DIR}" \
-0 -w "/root" -b /dev -b /sys -b /proc -b /etc/resolv.conf $port_args --kill-on-exit \
/bin/sh "$ROOTFS_DIR/run.sh"