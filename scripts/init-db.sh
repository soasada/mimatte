#!/usr/bin/env bash

USAGE_TOOL="Usage: $0 <DB_USER> <MYSQL_SCHEMA> <MYSQL_SCRIPT> [DB_PASS] [DB_HOST] [DB_PORT] [MYSQL_FOLDER]"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echored() { echo -e "${RED}${1}${NC}"; }
echogreen() { echo -e "${GREEN}${1}${NC}"; }

if [ -z "$1"  ]
  then
    echored "No database username given! Exiting..."
    echo "$USAGE_TOOL"
    exit 2
else
  if [ -z "$2" ]
    then
      echored "No mysql schema given! Exiting..."
      echo "$USAGE_TOOL"
      exit 2
  else
    if [ -z "$3" ]
      then
        echored "No mysql script given! Exiting..."
        echo "$USAGE_TOOL"
        exit 2
    fi
  fi
fi

if [ -n "$4" ]
  then
    DB_PASS=$4
fi

if [ -n "$5" ]
  then
    DB_HOST=$5
fi

if [ -n "$6" ]
  then
    DB_PORT=$6
fi

if [ -n "$7" ]
  then
    MYSQL_FOLDER=$7
fi

if [ "$EUID" -ne 0 ]
  then
    echored "Please run as root"
    exit
fi

while true; do
    read -p "Do you wish to run this script? (The database will be erased if already created): [y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Dumping schema..."
mysql -h "$DB_HOST" -P "$DB_PORT" -u"$1" -p"$DB_PASS" "$2" < "$3"

if [ $? != 0 ]; then
  echored "Dumping schema failed"
  exit
else
  echo -e "Dumping schema ${GREEN}[OK]${NC}"
fi

echo "***********************************************************"
echo "******** Mimatte Database Successfully create *************"
echo "***********************************************************"