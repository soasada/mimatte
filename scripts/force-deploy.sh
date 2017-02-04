#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
USAGE_TOOL="Usage: $0 <PROJECT_NAME>-<VERSION> <DEPLOY_PORT>"

echored() { echo -e "${RED}${1}${NC}"; }
echogreen() { echo -e "${GREEN}${1}${NC}"; }
unzipproject() { unzip "$1"; }

if [ -z "$1"  ]
  then
    echored "No project name given! Exiting..."
    echo "$USAGE_TOOL"
    exit 2
else
  if [ -z "$2" ]
    then
      echored "No deploy port given! Exiting..."
      echo "$USAGE_TOOL"
      exit 2
  fi
fi

while true; do
    read -p "Do you wish to run this script? (The application will be erased if already created): [y/n] " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

function run_project {
  bin/kernel -Dplay.crypto.secret=wde3R4tTdrs -Dhttp.port=${1} &
}

echo -ne "Building project...\r"
sbt dist &>/dev/null

if [ $? != 0 ]; then
  echo -e "Building project...${RED}[FAILED]${NC}"
  exit
else
  echo -e "Building project...${GREEN}[OK]${NC}"
fi

echo -ne "Checking if the project is unzipped...\r"
cd target/universal/${1}/ &>/dev/null

if [ $? != 0 ]; then
  echo -e "Checking if the project is unzipped...${RED}[FAILED]${NC}"
  echo -ne "Unzipping...\r"
  cd target/universal
  unzipproject ${1}.zip &>/dev/null
  echo -e "Unzipping...${GREEN}[OK]${NC}"
  cd ${1}
  run_project ${2}
else
  echo -e "Checking if the project is unzipped...${GREEN}[OK]${NC}"
  echo -ne "Checking if the project is running...\r"

  if [ ! -f RUNNING_PID ]; then
    echo -e "Checking if the project is running...${RED}[FAILED]${NC}"
    echo -e "Starting..."
    run_project ${2}
  else
    DUMMY_VAR=$(cat RUNNING_PID)
    if ps -p ${DUMMY_VAR} > /dev/null
    then
      echo -e "Checking if the project is running...${GREEN}[OK]${NC}"
      echo -ne "Stopping...\r"
      kill -9 "$DUMMY_VAR"
      echo -e "Stopping...${GREEN}[OK]${NC}"
      cd ..
      echo -ne "Removing project folder...\r"
      rm -rf ${1}
      echo -e "Removing project folder...${GREEN}[OK]${NC}"
      echo -ne "Unzipping...\r"
      unzipproject ${1}.zip &>/dev/null
      echo -e "Unzipping...${GREEN}[OK]${NC}"
      cd ${1}
      run_project ${2}
    else
      echo -e "Checking if the project is running...${RED}[FAILED]${NC}"
      echo -e "Starting..."
      rm -rf RUNNING_PID
      run_project ${2}
    fi
  fi
fi
